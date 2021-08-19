Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3626EC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:59:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7DC86109E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7DC86109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A3C80F1C;
	Thu, 19 Aug 2021 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkuedJl5Hotn; Thu, 19 Aug 2021 18:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A13A480F3C;
	Thu, 19 Aug 2021 18:58:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6E621BF402
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A396480F3C
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCgQhOmNm8FV for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 18:58:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2B9480F1C
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 18:58:47 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 74DDB206C1;
 Thu, 19 Aug 2021 13:58:46 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1629399526; bh=tU8RNTgzl4G2nlLHwzHt/gRZCfGpzqJo6wRXGg7mXiE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Xd2TKF5OCFSchZx+SCSC9kwj8UUbm3gYnrzCY3FWXPO0v+pVlM6aY5qM8rJTJPDJ/
 o9aUMy4wpIGF8crVL0qWSQd9YsXwrJMWkgn0Am/eYdDpknsdrJvGQNFfo8IY/oV58M
 DcoGjmWmrqgzzCxacK/iI6UzDAEvhVtIpGGJ5/Fw=
To: Oscar Gomez Fuente <oscargomezf@gmail.com>, buildroot@busybox.net
References: <CALtfCQajW_ZAvVq3J5cA=XgSh1w6u9_Sv+VoRcqLkSMO46aghg@mail.gmail.com>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <34f4b07e-8a17-71a5-58cf-92af91aac87d@xes-inc.com>
Date: Thu, 19 Aug 2021 13:58:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CALtfCQajW_ZAvVq3J5cA=XgSh1w6u9_Sv+VoRcqLkSMO46aghg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] Issues with SVN keywords and SITE_METHOD = svn
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

UGxlYXNlIHNlZSBCUiBjb21taXQgYzkyYmU4NWUzYTIKCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTAzMTAyMjU5MzcuMzE1NTA3NS0xLXlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyLwoKCk9uIDgvMTkvMjEgMToyNiBQTSwgT3NjYXIgR29tZXog
RnVlbnRlIHdyb3RlOgo+IEhpIGV2ZXJ5b25lLAo+Cj4gSSBhbSB1cGRhdGluZyBteSBidWlsZHJv
b3QgZnJvbSAyMDIwLjA4LjIgdG8gMjAyMS4wNS4xIGFuZCBJIGhhdmUKPiBmb3VuZCBhIHByb2Js
ZW0uCj4KPiBJIGhhdmUgbXkgb3duIHBhY2thZ2UgY3JlYXRlZCB5ZWFycyBhZ28gd2l0aCBTSVRF
X01FVEhPRCA9IHN2bi4gVGhlcmUKPiBhcmUgc29tZSBmaWxlcyBpbiB0aGF0IHJlcG9zaXRvcnkg
d2l0aCBrZXl3b3JkIHN1YnN0aXR1dGlvbiB0aGF0IHdpdGgKPiBidWlsZHJvb3QgMjAyMC4wOC4y
IHdvcmtzIHBlcmZlY3RseSBhbmQgdGhlIGhlYWRlcnMgb2YgdGhlIGZpbGUgaXMKPiBkb3dubG9h
ZHMgZnJvbSB0aGUgcmVwb3NpdG9yeSBwZXJmZWN0bHksIGFzIHlvdSBjYW4gc2VlOgo+Cj4gISAv
dXNyL2Jpbi9weXRob24KPiAjIC8qKgo+ICMgICogQGZpbGUgbmFtZS5weQo+ICMgICogQGF1dGhv
ciAgT3NjYXIgR29tZXogRnVlbnRlIDxvZ29tZXpAeHh4eC54eHg+Cj4gIyAgKiBAdmVyc2lvbiAk
UmV2OiAxNjEgJAo+ICMgICogQGRhdGUgJERhdGU6IDIwMjEtMDgtMTkgMTE6NTA6MjUgKzAyMDAg
KGp1ZSwgMTkgYWdvIDIwMjEpICQKPiAjICAqIEBzZWN0aW9uIERFU0NSSVBUSU9OCj4gLi4uLgo+
Cj4gQnV0IHdpdGggYnVpbGRyb290IDIwMjEuMDUuMSBkb2Vzbid0IHdvcmsgZmluZToKPgo+ICMh
IC91c3IvYmluL3B5dGhvbgo+ICMgLyoqCj4gIyAgKiBAZmlsZSBuYW1lLnB5Cj4gIyAgKiBAYXV0
aG9yICBPc2NhciBHb21leiBGdWVudGUgPG9nb21lekB4eHh4Lnh4eD4KPiAjICAqIEB2ZXJzaW9u
ICRSZXYkCj4gIyAgKiBAZGF0ZSAkRGF0ZSQKPiAjICAqIEBzZWN0aW9uIERFU0NSSVBUSU9OCj4g
Li4uCj4KPiBJIGhhdmUgY2hlY2sgdGhhdCBteSBzdWJ2ZXJzaW9uIGlzIHdvcmtpbmcgcHJvcGVs
cmx5IGluIG15IGNvbXB1dGVyLAo+IHNvIEkgZG9ub3Qga25vZSB3aGF0IHRvIGRvLCB0byBrbm93
IHRoaXMgUmV2IGtleXdvcmQgaXMgdmVyeSBpbXBvcnRhbnQKPiBmb3IgbWUgZHVlIHRvIHRoZSBm
YWN0IEkgdXNlIGl0IGZvciBzaG93aW5nIHdoZW4gSSBleGVjdXRlIHRoZQo+IHByb2dyYW0uCj4K
PiBEb2VzIGFueW9uZSBoYXZlIGFueSBpZGVhIGhvdyB0byBmaXggdGhpcyBpc3N1ZT8KPgo+IFRo
YW5rcy4KPgo+IMOTc2NhciBHw7NtZXogRnVlbnRlCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1c3lib3gubmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgotLSAKVmluY2VudCBGYXppbwpFbWJlZGRlZCBTb2Z0d2FyZSBFbmdpbmVl
ciAtIEFUUwpFeHRyZW1lIEVuZ2luZWVyaW5nIFNvbHV0aW9ucywgSW5jCmh0dHA6Ly93d3cueGVz
LWluYy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
