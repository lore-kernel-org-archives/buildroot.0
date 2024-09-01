Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EDBCD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A1980BA4;
	Sun,  1 Sep 2024 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lewkUx9W4whO; Sun,  1 Sep 2024 16:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC73C80CDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC73C80CDF;
	Sun,  1 Sep 2024 16:31:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3072B1BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E7FA80BA4
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rd3YEzsvFWWQ for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:31:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD0D680DED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0D680DED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD0D680DED
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:31:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1sCZ7i3YTM-00e1dq; Sun, 01
 Sep 2024 18:31:02 +0200
Date: Sun, 1 Sep 2024 18:31:02 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZtSWxoLDrd6v6ysz@probook>
References: <20240901-aer-v1-1-03b124cb64b1@gmx.net> <ZtSVWOOM9d57FC6h@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZtSVWOOM9d57FC6h@landeda>
X-Provags-ID: V03:K1:uacXZ74Zotrjimeu+sQKdjCtaCXuEA1rpN7pwugWkDKIZRSTOqp
 RceKe2xRcU9n0nya8GY5AVNDlvyBkCh2NY4nRwuYntuguGLqKzsOjwS7SOECL2C0LmqL1OQ
 nA1OlBwj+lAF8taAdE7FgwZ/BgOM9gFqdivX8ELnx4bI8G2Kt222MELc5Ts1to+HqSDM+E6
 iuUO/pnheWxd7vp0xixUQ==
UI-OutboundReport: notjunk:1;M01:P0:gMatakGP0m0=;OndWQYXhfOutfmoxBf5V869oCHp
 FKapFDhjck9VZ12ApTBEyFppuIl9XthCTLKNKqbiphPpNSCB+fZVhWJwRknByWyGFzFmn9I38
 F+KGvfCMesqjbe6Iyo7XOot3aeOaCrE6xLb81jrLDMGOHcqqekc8XJx4FJuc6cApT0N8ivWnq
 UMZbCX/B11hf9qfmabzjYWsueZrMpNkfW0YikjtIf/QbWhz3Efekc/zhnXpz9KKGuyflPEfv/
 p9sx29savlaY7RtVyZRCAuk7U7kYmjDCpFVs7HZemU0N1IksruwAS/xglqog1zjGCPTfBDd+y
 blQaRmf2LfNnCzABjHU+YvIUtj5b8gWJGreftu/j+fEFug/wXusXx3HLbzeN+E4sxWJSu2GbW
 8N1hk6ApUL0tDW2Ozm57Vz2WvBaEc+zBThaAhBR/5CwSENGADZBXaQT0d9ZXO84kpUdIDCtyn
 G3DH3Ijzo/UEWcS0HvBjenFS8wFjfJRolSFNrkjSNbqUjW8kDx+9yCoP1wJk5gxkQBgyNgfOZ
 yReuGe1s/xP5EWlEqwV0NZ1j4r457MDAfHvlj4qqAHBUBb6nx5xIZyvqIvato6gwp8iOXBWYp
 aiCSsd/QQx0UBKoSU/V6M43axcfspjT5Z7RUwgm+3/XegB6NcbRC9Cd8VwoAP9yKMTLW+1JSH
 +sM7n2pFWsONRGDYtbmKnit9T7v/YR/q8lMkU13N/x9WLlYuRLmtiPNAB3Eqk8sCQlJCQVbWd
 K2aoAVpb1LpXHBB27F/JeluKns9Bchj1MubSeB50V4JhgwyKyGbigveLiaDvTJtrtjs7s/bvR
 vvYbJszITKNfLeLCtqsSR0Tw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725208262; x=1725813062; i=j.neuschaefer@gmx.net;
 bh=z/KKNFtT8tzEKYxWFnOEGPickHdlsk63mIQp28HJL6E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ucWuuUifM5F8g7PsRVkMneA7Gs5NQyBgDRyhmt35xUmwlwZJz0Z2WGnqX2rjCbpL
 kyBmSaxpQUjUFmDbTIX/iftXh9q//AL1G3XjbQyDVDcq9AJPTKqoBdR5TpHi4kC2C
 +q4yAdfh3DpmomWqt7mbJaabccMC9mGmJttWyc1ObkxrT89/TG1gtBtNT4pN3ayfS
 s1NZt0XptKNgsskukCO/tpIiulayUCf+SixJtOx/3Grt7jU3snN9IYJq3W3LRz06q
 NcRJM1Pmb9CJgJWWeoANn/n4XDKq4chkRg4qJijFEaeNK71pUffO/GQbAOlfghiiS
 5UEVgy+WfX1uFPTYww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ucWuuUif
Subject: Re: [Buildroot] [PATCH] package/aer-inject: switch upstream
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBTZXAgMDEsIDIwMjQgYXQgMDY6MjQ6NTZQTSArMDIwMCwgWWFubiBFLiBNT1JJTiB3
cm90ZToKPiBKLiwgQWxsLAo+Cj4gT24gMjAyNC0wOS0wMSAxODoxMSArMDIwMCwgSi4gTmV1c2No
w6RmZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6ClsuLi5dCj4gPiAgQUVSX0lOSkVDVF9W
RVJTSU9OID0gOWJkNWUyYzc4ODZmY2E3MmYxMzljZDg0MDI0ODhhMjIzNTk1N2Q0MQo+ID4gLUFF
Ul9JTkpFQ1RfU0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2dvbmcuY2hlbi9hZXItaW5qZWN0LmdpdAo+ID4gLUFFUl9JTkpFQ1RfU0lURV9NRVRI
T0QgPSBnaXQKPiA+ICtBRVJfSU5KRUNUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGludGVsLGFlci1p
bmplY3QsJChBRVJfSU5KRUNUX1ZFUlNJT04pKQo+Cj4gUGxlYXNlLCBrZWVwIHVzaW5nIHRoZSBn
aXQgZG93bmxvYWQgYmFja2VuZCwgcmF0aGVyIHRoYW4gdXNlIHRoZSBnaXRodWIKPiBtYWNybzsg
YW5kIGp1c3QgY2hhbmdlIHRoZSBfU0lURS4gVGhpcyB3YXksIHRoZSBoYXNoIHdpbGwgbm90IGNo
YW5nZS4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KCkFscmlnaHQsIHdpbGwgZG8KCnRo
YW5rcywKLS0gam4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
