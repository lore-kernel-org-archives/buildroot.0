Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B1E82EA4;
	Sat, 23 Apr 2022 16:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iuc3AE-uLKt4; Sat, 23 Apr 2022 16:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE3882BC3;
	Sat, 23 Apr 2022 16:47:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E11D1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B80282BC3
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKypj6tIOMhz for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:47:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-outgoing-1603.laposte.net (smtp-outgoing-1603.laposte.net
 [160.92.124.98])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0081482A4E
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:47:07 +0000 (UTC)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KlxyF1lhNzdZLg",
 "contextId":"26f88884-c848-4c98-b3c2-2d693ff2f4f6"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4KlxyF1lhNzdZLg;
 Sat, 23 Apr 2022 18:47:01 +0200 (CEST)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KlxyD6JmDzdZLM",
 "contextId":"db295464-8150-46a6-908a-98ecf403e7d0"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvfedrtdeigddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecunfetrffquffvgfdpggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeggihhntggvnhhtucfuthgvhhhlrocuoehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvtheqnecuggftrfgrthhtvghrnheptefggffgvdejueejheegjeevheetleekhfelvedvveejffdugedugeegfeejveegnecukfhppeekkedrudeiledruddvledrvddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeiledruddvledrvddvhedphhgvlhhopehrohhmuhgrlhgurdgsvghrghgvrhhivgdpmhgrihhlfhhrohhmpehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhrtghpthhtohephigrmhgruggrrdhmrghsrghhihhrohesshhotghiohhnvgigthdrtghomhdpmhhouggvpehsmhhtphhouhht
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4KlxyD6JmDzdZLM;
 Sat, 23 Apr 2022 18:47:00 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 8F532493D35D;
 Sat, 23 Apr 2022 18:47:00 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.95)
 (envelope-from <vincent@radicelle.bergerie>) id 1niIuS-0007Sf-2S;
 Sat, 23 Apr 2022 18:47:00 +0200
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:46:41 +0200
Message-Id: <20220423164641.28675-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1650732424; bh=ITQpQ6OcLw/U3nnNmpOk3OyEMhGzXt9pkrPRY+r2NZs=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=OB8pGAd48Hkr98K2HSdtFVo+HTJ+NaBmMS6I1fCiF1XJeLLoQHnolCxzxYnFXQX7mriQLlaldRwPJcWvs/RBPTCd+LfsUEgCBLHtTUkoD7a55sE0wceS07K1CA9hK/4O8yr3XZGythjsjucP0HMc9ptqw5gBBl9Gpms+Mpkf0fE0kRHu050PSsipGbb9Y84HgvUjsFxcGDJBtLMkLK+BFcPop+ljZco6Cat7jCE1c+K6wnyWwGQfdkPDoc0T7PF+ToS6qnu+d5qkRu7Sw8f2JDdJz+NJdn9qRjutlSPe2QU3w5nstTU7OoDfVP6hICatcgpYpdBLqk3KL07y6h63iw==;
Subject: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux 5.16.20
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5l
dD4KQ2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0t
LQoKSGksCgpJIGhhdmUgdGVzdGVkIGl0IHN1Y2Nlc3NmdWxseSB3aXRoIGJvdGggRlZQIHY4IEZv
dW5kYXRpb24gUGxhdGZvcm1zIDExLjEyIGJ1aWxkCjM4IGFuZCAxMS4xNCBidWlsZCAyMS4KCkJl
c3QgcmVnYXJkcywKVmluY2VudC4KCiBjb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmln
IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKaW5kZXggMzYzZjI4OGI4Ny4uM2M2M2Y1
ZGM3NiAxMDA2NDQKLS0tIGEvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZworKysg
Yi9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCkBAIC0xLDEwICsxLDEwIEBACiBC
UjJfYWFyY2g2ND15Ci0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS45IHNlcmll
cwotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81Xzk9eQorIyBMaW51eCBo
ZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDUuMTYgc2VyaWVzCitCUjJfUEFDS0FHRV9IT1NUX0xJ
TlVYX0hFQURFUlNfQ1VTVE9NXzVfMTY9eQogQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9
InR0eUFNQTAiCiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT049eQotQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS45LjExIgor
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNi4yMCIKIEJSMl9MSU5V
WF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQogQlIyX0xJTlVYX0tFUk5FTF9EVFNf
U1VQUE9SVD15CiBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYXJtL2ZvdW5kYXRp
b24tdjgtZ2ljdjMtcHNjaSIKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
