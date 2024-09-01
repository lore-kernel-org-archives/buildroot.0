Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637EACD342A
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F8240433;
	Sun,  1 Sep 2024 14:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8zCIAopsBJT; Sun,  1 Sep 2024 14:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2181404C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2181404C9;
	Sun,  1 Sep 2024 14:30:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 088901BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C3240533
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiHR54f_7OSr for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 948394051A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948394051A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 948394051A
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:29:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY6Cb-1sYooI3peP-00Wo2X; Sun, 01
 Sep 2024 16:29:47 +0200
Date: Sun, 01 Sep 2024 16:29:46 +0200
MIME-Version: 1.0
Message-Id: <20240901-rgbmatrix-v2-3-3a10c3c367e4@gmx.net>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
In-Reply-To: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725200985; l=579;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=NtjTnkTFhZeXD9Pr/Ctqs1m3bUgBhTmGZDtojseWsCw=;
 b=YeaZtWd2IktuDaGDUNDr4Dygg5MdX6oK104IFyiy7N/NZOf6yoAsnctNT4Zz7oRAuv2FXOMVo
 IPGATVKPIHKBiojAivZjyi3spkXPh0FIK80/2QUOpA2xu8fHuy5n6dY
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:v8FLyaulYO/ti9cVYkZmy2VJ4T0QcST752ZjBEuHb4H2b/R2x8W
 MdrKsF4HvyUL5h6u6lpHwf7B8ZNgbk01FHz+AtGct4zaRLYbrpie4gbwb/7plE0d6dkmBgS
 46YIvvnlr266znzbF/N2JWves5nGJZeXnSWlYD5w2j+VtR9cnCbKH0b7j8YP7aEjrHu9xkK
 O5KhZr97RMB5XI4Lygu+g==
UI-OutboundReport: notjunk:1;M01:P0:0iumj895B1k=;5DpF8soEDafGo+fvRkkPhQGPUy7
 GbE52hp1EvMgD77bnVZSX/CtUaSUstsujmDM0jCCluqb9sLvfvAZdlPNQJdCLm5cxQe8CQ0Hu
 PiRFUAy9ukWrDhbpI+e6SEO/tiIHS40ht3TOaTuz29tb5vjuvZQGNsmtToqktrkoPC/RDgkyM
 zXDlNbdGyMTDnONVr8RxnNks9frKpijFTFWwGpJ7baO6TaG1kxs9MoncF0h4VJa5O0+63Ph/S
 3SN+etA1zh2xeSBegVB6GNDsm3xZ2JdFjDx9eTNE+22/q2qGStoXJ3sGmPol6/88VEppkdtgF
 u/npVFY1YxE8DBerUZ6L1WTrXgzNSVIFWxDm9Tc5t7xJcd/D+0+g5E/oGFeDEbpoeyOqoXHzS
 o86n3OOaGKImjbQ4OfYow9Pac6FcKS9Rin4zu/VfkRY16l67h/I/QHyexEfYZnsypfSk2+wX6
 6ri3OmSnuiCzuo3TJHRbO1q15aQyyoCcF1Uv1yLohHIrgLq8NFLKPh7bNth0sIe8ORSrqnSV/
 sHLnCaGVz8YdTg+/GR61OCMAaFFJi3mzT4omOfDeLCPgP3BPJOeiGlHthwBbD/akuIzGCvSxq
 JW5Ru/0T5u7bt0BJkECse8iOtsaZHUIr5r0ionr/X3dkFULF0B1VpZl0j7ivsbv90mhgbBGEF
 j3VEQ30Oqa9QiPSfP+69yDbQeiS5lV/83wuZnQq3ad2IGoSWL/be4FFjMWDWW1gVjgwgcAFNn
 vIu2yYDknOqV6OwEKfvC8biOs9M7abQZ3Pj8hxzZiA4Dk20CcBAgDWZcNw3i2GbHvq43fsYnX
 WdX0NwDPzbRNX/n/xomk7HXw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725200988; x=1725805788; i=j.neuschaefer@gmx.net;
 bh=apUAG4CXiBHM1hD4LGJPVc1k5KD9CFL/xKkzPD3ywQg=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EUGjX3ppQst04ZDlfFlPhez5Lh8E/HhzkJ6SIPcgfZA8cWGTBchVDBSIDNJt3GsV
 s4MlMVLV0CwsEwLJee+6ORGskBdiE8Pziyg4iP08lY5zWQUSO1B/vxzOB06LAW/y/
 ikijXChmt6IExnpsMybhPG3CsSkL1ZTSXK0g8CHPmNM5dPCBpVBQDDKqQinwwc1Js
 cRvtjwXfLqv50j23h7dLZEJfiMOS7rZVrZvBC+XWVxj7vEDmy0zKVNAMQfGIiMy1w
 /weIBAVYGWFRk81IX7tesNXbf4SaE81a8uh4SIBE9aml/a9ivGCIXkGOwfzg7OoVa
 9uuYszED9Ja9IhwBiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=EUGjX3pp
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v2_3/3=5D_DEVELOPERS=3A_add_J=2E_?=
 =?utf-8?q?Neusch=C3=A4fer_for_rpi-rgb-led-matrix/python-rgbmatrix?=
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
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIG15c2VsZiBhcyBtYWludGFpbmVyIHNvIEkgY2FuIGJlIG5vdGlmaWVkIG9mIHBhdGNoZXMv
cHJvYmxlbXMvZXRjLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVm
ZXJAZ214Lm5ldD4KLS0tCiBERVZFTE9QRVJTIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDU3
MGY0ZmYxMTUuLmNmYTU2OGZkZTIgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxP
UEVSUwpAQCAtMTQ1NSw2ICsxNDU1LDggQEAgRjoJcGFja2FnZS9tYXdrLwogTjoJSi4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KIEY6CXBhY2thZ2UvZXhlY2xpbmUvCiBGOglw
YWNrYWdlL21kZXZkLworRjoJcGFja2FnZS9weXRob24tcmdibWF0cml4CitGOglwYWNrYWdlL3Jw
aS1yZ2ItbGVkLW1hdHJpeAogRjoJcGFja2FnZS9zNi8KIEY6CXBhY2thZ2UvczYtbGludXgtaW5p
dC8KIEY6CXBhY2thZ2UvczYtbGludXgtdXRpbHMvCgotLQoyLjQ1LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
