Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE39CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 05:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F6A80E05;
	Wed, 27 Aug 2025 05:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6unCJP8-acXd; Wed, 27 Aug 2025 05:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B1080D4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B1080D4C;
	Wed, 27 Aug 2025 05:43:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 616FF114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 05:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A5860BD5
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 05:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUvtdXOsRBFi for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 05:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A42F760B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42F760B3C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A42F760B3C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 05:43:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 781453073; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Aug 2025 05:43:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ur8wg-002yCp-1C;
 Wed, 27 Aug 2025 07:43:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Romain Naour
 <romain.naour@smile.fr>
References: <20250818202015.3213119-1-thomas.petazzoni@bootlin.com>
 <045355db-ffe4-4136-963f-ba80dec0cad9@smile.fr>
Date: Wed, 27 Aug 2025 07:43:42 +0200
In-Reply-To: <045355db-ffe4-4136-963f-ba80dec0cad9@smile.fr> (Romain Naour via
 buildroot's message of "Sun, 24 Aug 2025 14:46:06 +0200")
Message-ID: <87ldn5l3ox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EG2gdrlLtnjJsQ1PRlEo1F3VolnClkx+z5u4O2BrkD+Z3t+iW0pDNYRw1Ysp8uTJ3amBW7zB9qMR3IEUqvwdGw4uIsasrpTGK36VpsVqK3MPVY+cmmRmQ9Mx6fwcMD2m1w+3947PCPmi+/NbaN31YiqpjV1JLx3EySwJmLcVQ3zcZNw7FxTsp1MeshTQ8kK4KZgj3IxuhdUAYizW8V12BCDvPMKTXzZlreDZ9MSZ8j2rp1PsWu8ycfvwLwHRU+IveUGhT8H9EZrY02AQ6AKvl6/a+2yNGuHUqeEXAdIrKDCDmLUMi/jKjJRWxch2IOc5fHYXOr0ll8pAIkhRTVVGFQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=u/qpI6cVqqSmkKkc3Igg2Yy+A416/QqJ/pIBmoUPhiE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EG2gdrlL
Subject: Re: [Buildroot] [PATCH] package/liboauth: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBIZWxsbyBUaG9tYXMsIEFsbCwKID4gTGUgMTgvMDgv
MjAyNSDDoCAyMjoyMCwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6
CiA+PiBUaGlzIHBhY2thZ2UgZmFpbHMgdG8gYnVpbGQgaW4gdGhlIGF1dG9idWlsZGVyczoKID4+
IAogPj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC8/cmVhc29uPWxpYm9hdXRoJQog
Pj4gCiA+PiBUaGUgbGFzdCB1cHN0cmVhbSByZWxlYXNlLCAxLjAuMywgd2FzIGRvbmUgMTEgeWVh
cnMgYWdvOgogPj4gCiA+PiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9saWJvYXV0
aC8KID4+IAogPj4gVGhlcmUgaXMgYSBHaXRodWIgcmVwbyBhdDoKID4+IAogPj4gaHR0cHM6Ly9n
aXRodWIuY29tL3g0Mi9saWJvYXV0aAogPj4gCiA+PiB3aXRoIGNvbW1pdHMgZnJvbSAzIHllYXJz
IGFnbywgYnV0IG5vIHJlbGVhc2UuCiA+PiAKID4+IFdlIGFscmVhZHkgY2FycnkgYSBwYXRjaCBm
aXhpbmcgdGhlIGJ1aWxkIHdpdGggT3BlblNTTCAxLjEueCwgd2hpY2gKID4+IGhhcyBiZWVuIHN1
Ym1pdHRlZCBhdCBodHRwczovL2dpdGh1Yi5jb20veDQyL2xpYm9hdXRoL2lzc3Vlcy85IGJ1dAog
Pj4gbmV2ZXIgbWVyZ2VkLCBkZXNwaXRlIGJlaW5nIG9wZW5lZCBzaW5jZSAyMDE3LgoKID4gQWN0
dWFsbHksIElmIHlvdSBjYXJlZnVsbHkgbG9vayBhdCB0aGUgc3VibWl0dGVkIHBhdGNoIFsxXSwg
eW91IG1heSBub3RpY2UKID4gYWN0dWFsbHkgYSBiaWcgZGlmZmVyZW5jZSB3aXRoIHRoZSBwYXRj
aCB3ZSBoYXZlIGluIEJ1aWxkcm9vdCBmcm9tIExGUyBwcm9qZWN0IFsyXS4KCiA+IEFuZCB5ZXMs
IEkgbm90aWNlZCB0aGlzIGJ5IGxvb2tpbmcgYXQgdGhlIG90aGVyIGNvbXBldGl0b3IgcHJvamVj
dCA6KQoKID4gSWYgeW91IHVwZGF0ZSBvdXIgcGF0Y2gsIGxpYm9hdXRoIGp1c3QgYnVpbGQgZmlu
ZS4KClN0aWxsLCBnaXZlbiB0aGF0IGl0IGlzIHNvIG9sZCBhbmQgbm9ib2R5IHNlZW1zIHRvIGNh
cmUgYWJvdXQgaXQgKEUuRy4Kbm90IGluIERFVkVMT1BFUlMpLCBsZXRzIGp1c3QgZHJvcCBpdC4K
CkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
