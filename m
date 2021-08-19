Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946E7C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF60604AC
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BF60604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E0C64011D;
	Thu, 19 Aug 2021 21:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rcrt9tbCZSf7; Thu, 19 Aug 2021 21:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F91940176;
	Thu, 19 Aug 2021 21:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E96D1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DC5819ED
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPI3-KXO7zHS for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:58:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2270A81990
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:58:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E2DEF200381;
 Thu, 19 Aug 2021 23:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629410301;
 bh=vmi3FQefsw0oAaNwsEqx/xnl/q1EBINEqRpiCXNwQEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9tgYOw6GqC+LbJz1B8LYzDZf+dkqSAQBC5LM0ZLkEosdWehX+p4GE9IAYtlM9LJH
 ULjN5i0RDW+n0gIQ4wQCbVGIlKBDUM0QgFj3LWmz3fC6ugarMWMT95HPeeRB/t5aXs
 o9wZHhSA8kcknN2hAjnNZc+tRwMFl1x/XMPEnFaMYKQPzK4sbuBQdT45BR23Y1kCiq
 gk7y7hTzJrHFSAT8GchnUECgCtlve478GwaeWGXQuK0RX6wyQxhLby0VNAQqwdfSw2
 ly9bZGeCkDX6i5LMBX6Y8f1Lus2pklgEHcOgNalNeyJ31luOoTWkxLwyUrSNYpFij3
 rQkKgHWYJnaPg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 23:58:14 +0200
Date: Thu, 19 Aug 2021 23:58:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819215814.GL27036@scaer>
References: <20210805174252.2661314-1-fontaine.fabrice@gmail.com>
 <20210819230539.16ac5e4f@windsurf>
 <CAPi7W820rnjxXh4uRrnkiN+OuULThhcLoBiq3j-vDKBTJ3Zy_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W820rnjxXh4uRrnkiN+OuULThhcLoBiq3j-vDKBTJ3Zy_Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/mcrypt: drop package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOC0xOSAyMzoyMSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIzOjA1LCBUaG9tYXMg
UGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPiA+
Cj4gPiBIZWxsbyBGYWJyaWNlLAo+ID4KPiA+IE9uIFRodSwgIDUgQXVnIDIwMjEgMTk6NDI6NTEg
KzAyMDAKPiA+IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiA+IERyb3AgbWNyeXB0IHdoaWNoIGlzIG5vdCBtYWludGFpbmVkIGFueW1v
cmUgKG5vIHJlbGVhc2Ugc2luY2UgMjAwOCkuClstLVNOSVAtLV0KPiA+IERvIHdlIGhhdmUgYSBn
b29kIHJlYXNvbiB0byBkcm9wIHRoZXNlIHBhY2thZ2VzPyBXZSBoYXZlIGxvdHMgb2YKPiA+IHBh
Y2thZ2VzIHdpdGggbm8gdXBzdHJlYW0gYWN0aXZpdHksIGFuZCB3ZSBkcm9wIHRoZW0gb25seSB3
aGVuIHRoZXJlIGlzCj4gPiBzb21lIHBhcnRpY3VsYXIgaXNzdWUuIFdoYXQgcHJvbXB0ZWQgeW91
IHRvIHByb3Bvc2UgdGhlc2UgcGFja2FnZXMgZm9yCj4gPiByZW1vdmFsID8KPiBCZWNhdXNlIGl0
IGlzIGEgY3J5cHRvZ3JhcGhpYyBwYWNrYWdlLCBoZXJlIGlzIGFuIGV4dHJhY3Qgb2YKPiBodHRw
czovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9NY3J5cHQ6Cj4gIlRoZSBsYXN0IHVwZGF0ZSB0byBs
aWJtY3J5cHQgd2FzIGluIDIwMDcsIGRlc3BpdGUgeWVhcnMgb2YgdW5tZXJnZWQKPiBwYXRjaGVz
LiBUaGVzZSBmYWN0cyBoYXZlIGxlZCBzZWN1cml0eSBleHBlcnRzIHRvIGRlY2xhcmUgbWNyeXB0
Cj4gYWJhbmRvbndhcmUgYW5kIGRpc2NvdXJhZ2UgaXRzIHVzZSBpbiBuZXcgZGV2ZWxvcG1lbnQu
IgoKT0ssIHdpdGggc3VjaCBleHBsYW5hdGlvbnMsIHRoYXQgbWFrZXMgc2Vuc2UuCgpDYW4geW91
IHBsZWFzZSByZXN1Ym1pdCBib3RoIHBhdGNoZXMgd2l0aCB0ZXNlIGluIHRoZSBjb21taXQgbG9n
PwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVz
eWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
