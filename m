Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC7606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TD8c1Nvo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281F580D82;
	Sun,  1 Nov 2026 17:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWHU_A0MeRXQ; Sun,  1 Nov 2026 17:44:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 28B4A80D7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555047;
	b=nkBdxH0wh/vpf/s0aap/SdqVvrUWbJYuyvjUTuMaRaEpCGwvAupSwVUrMTRqow+wE85p
	 MPdfy61yHW7xYyVuXTy7Zjv8i8pbilCQSk0L+NaA2NBOmCcMdmSMZq0KSzK5VQ4jIf0lV
	 +GOKZ8llmoMerb2a3Ey0aw/8edlrygD+gTdYDM1I03mm5VFWgUbIo7Nq2X1Kc+v1sD65B
	 LTn2mUDhnfPIAWn9YoJgZ67qK4cSkD4pJyBr2TCRw4DPI57eHd7a/FswTAxh8gr+XM14I
	 hUKPWvJIHyGUUiG7Cu9T7xO+sGnIXUIBMi3sVvY88giXBSng+nxdimHSMM1FD5nU96Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=52HVnz4GEqtHR9bpvWv9FP3XD7JlWO0Kp/4XBRkm+mo=;
	b=ZpbtMqEtNNl0dQ+Fa8y4jKBaQBu6cCF/xy8FyJM4mWwURUCkWDAtOCwOEIzwstmCFtYB
	 pLB/TqnYWanu44+JW2vrRWsNOODshxmqSCebZFCBK72ZPCN8RXp91NA/cUb5jWldnmmef
	 WCpxYkLYlwhf3kVi9NlK1LlmFBUCQTkS75tUREky4g+mk9rpIOluFG7dLoAO0YIXpcpX9
	 dxPRCLp3/khe8GqR+xxvd47pEPe9Ci2PJP8wNhtTwpGogC+4yovlkOSHG8zomqX21N6yy
	 3c52zJDR2mjBSHCRIJWDRpGOrKl3i/JaVNPdEjteSKa00IaWFUVEcuVBo4wnr6JwT9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555047;
	bh=52HVnz4GEqtHR9bpvWv9FP3XD7JlWO0Kp/4XBRkm+mo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TD8c1NvomXyY0YEMA2S26/bXXBZA35A5pJz75VLr1iu7yf0zQep3gveHkeGxa7jVc
	 Nlv6Rxhd88L0/aEtI3DOTqoN1vD5qHtYZp/ATN9gdfob9RtALj6+xcTnni/NqenpKO
	 vC08FHpjlYODFRIQgPXUURAxFsgCACZRSYw9OedhCazXoDbJipwMEMYku/XKzZBuRr
	 4zH1a52Ym9/S+1LpnYkbxmcWjf3DHHGV0ehRJ19mk77LLqOQ5obLmO1RVyn/MOhEYc
	 Ao9BWVWHUlwmw2makv1REmuGhFvxFXjmqcRYSTKncstP8E1vlM2DTpqIheKVZwJJLq
	 ofGHmGQsXEHIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B4A80D7B;
	Sun,  1 Nov 2026 17:44:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8604E323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7469760616
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEls1FJfZ1XY for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:44:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BCC5F60612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555044;
 b=PlTAUEzMwmu1zKCcxgFhOSbAbzAzUtPip60d3fjaB8p1UbVE8almGXZZz+R2Wimyd4+D
 go3ZvL8ErxcHfepMDm3H67opVbWuOCn5FCeHFBYAD3jGIvoZOVHuBNp7KAHo+QtXuOdAT
 WWch4ckcp3PqyiogiNoEnXFGzP7Cl2+quSN1Hg7rI4MlUHrT6Y6kSsCO8liZ/dddjVeBf
 coGexmfp9SQg/+db9C1lPkG3Re1oMxImwHRkDAk7PMe5ukl0Ru6pwdvATetIotd8r+La4
 uSQjOv4RET6sPsIzAHhahP3bPorPUHzQdwn9v9pglcpmSD9ZdgPJ3OdI2EFdSX0FHhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555044;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YiO3v1f8ILOsH9Ji6h4/YOa7hAhWi2GBexqcDKA0uTU=;
 b=klyQJlT+HWBWOaiyu7z/QxZ3q3asDCrbQqop+t/Ej8FcZcw4IV+S8NilG4qpXEAtLyTB
 jk7NltvavNqoy0gH+ZDd96ujLOp5Sy2NsMTa3ld19V5GicuRs/Whyj367Rp3aaMeIb3Ye
 wh3Ura0jrXyO84gqlF3i3hUueT7UOGPwt6jHhNvLBM+02LBIJRZ6NlNj3FfWqPobWY2md
 q/29eViMafLynwH0x70qUzzIviBH5g36jjx56WxYUiJdYGTGyMsP/Z28+32tEvyXVaN7d
 1X5WrEYs+8LHGuB4vmqR2s160j+N5wADemSUa7NRYSD7D+EVyQ37ieHIPO9tztRJoDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCC5F60612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:44:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BF759D539; Sun,  1 Nov 2026 17:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:43:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2abec6fde97e5b2e23c09793c7d1a0008ac95c5b
X-Git-Newrev: afeefdaf4a5c00fc7941a7bc9007b92d8639f38b
X-Patchwork-Hint: ignore
Message-Id: <20261101174233.6BF759D539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: bump to 2026-10-30
 version on branch 5.11.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/afeefdaf4a5c00fc7941a7bc9007b92d8639f38b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version allows to build with Linux up to version 7.3.

Fixes:
https://autobuild.buildroot.net/results/772/772d3c85a05336b8702ba12094ebe70457d87469/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 05e53745c7..de11e2e5ae 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  50e289e6a1a4f5cf455e7525b2e2003c0ce58b6b55c1c3ab2e91e3b9fc357730  rtl8192eu-9664b2bfc4bcba55ca5a1284e67bad15ed910081.tar.gz
+sha256  2e4310f7a68f93b50a98792cff8a3ab78bde92f611cc9e20d03bb53e5c9212fa  rtl8192eu-c9314e0d846d2823a81f7e896016b4122d7dfab2.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 91c250e07d..472046136a 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 9664b2bfc4bcba55ca5a1284e67bad15ed910081
+RTL8192EU_VERSION = c9314e0d846d2823a81f7e896016b4122d7dfab2
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
