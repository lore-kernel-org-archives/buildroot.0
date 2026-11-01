Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D436606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gkzHOq3S
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E1ED4047B;
	Sun,  1 Nov 2026 16:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3T1UC0rK7zw3; Sun,  1 Nov 2026 16:04:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 91829403BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793549060;
	b=XzjPUanGLQQqWvoL0PUlfc4z8o3lOmsS7r6Hge1e2VfjFV9KPO78OWz393kMvEgCrlsz
	 rYUv44N1BHwBkHjED2sMIZenFyY3o3Mm2re8qM7YHzaYETUTA4/uyFuw4444P39D13aH9
	 U8ifoiYWk6asRVZEQ5WAyuR2uldL57sgMGVtoKXhQCCVQ/HM2mtrXyLtB36h+MfmoVz80
	 DDUYB3/hn4InrZsPiprBFAyf/1NWTX4QNnifMRE5lG5gUKmlgbNvtMEp2vhlUbUU9oEwI
	 zRlNwX+54O2JNiB6Dz9jEKy7LQLaRnKib65vTlLZC2Z5s8/P4cJgPkNt0iu5MGgMilw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793549060;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oYlIi0Heq24AqG4fjke4ebw2bldEGHxL0ft0zATlhqc=;
	b=abLXxVtbtIZLByKHeNqWoHuXLFLfFyx47cWrisGssOTehr9y7kc/rKZXAM7FGDDZlLQw
	 MZD+I8EfzQEZNaYeLEQoxDXLSEiYrD1ZqKYw6KFKDF4SHIU4o0BwO1/DNopx4/3GNCgsT
	 oz/gS119KDaPWb6cIFKj/fPKumT9PcLqW4N2/FkFLdtnA5Un746i9gAMgmpHoeExN6bWq
	 sHV8TrtaFfU0JgsVf83Qu5OWG4qxo3p6lRVZvekM/rQjwRCUtvg/z/kesO392U8VPYVtF
	 uD56QQZeAGAS+Hx8+MMKeTcNoAnB2rtgGVTeVe+cM0y8xGf6s67TF5BdnYzHmYYV20w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793549060;
	bh=oYlIi0Heq24AqG4fjke4ebw2bldEGHxL0ft0zATlhqc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gkzHOq3SiEaXc4X8YFYvB2aAMD93ZBFhGRVqmWMWWA+6qAi8Ck85oHiTzpTqMPMHO
	 kvfuIsjQRNKYLAVqxGIXvcGF+3wnDdclNY4tzQabwMa+Y2VuFb637wfzrNDWrjGkNB
	 RtQBr2BO3CXbC2wH8zV9OfgJKCzfUkHJyezAxwwG6FovaYfjI9qq/BUZdOyGXWk5+T
	 Q/GIo/V/yxEcElTSQ7Xarut8Ez56OOOKbrPPIRO8hjT1EO8bhMNVBTvu8/mAtsYyfs
	 EpryinAEGtA7xrfPrxY3Ns3mItcMug1KXC6Jm+lQakq9FbMBC2OSL7NnXNzC0WHB3k
	 se0Hw8wcaW8YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91829403BD;
	Sun,  1 Nov 2026 16:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC080EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDEE960602
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCg5ooYgUDEj for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D48FF605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793549056;
 b=qlW8R/wFsWjyMKDfq6c+VBzexMxTVMAn8cLa0O0NPssi3Sz/Kjj/9jpaF+XNVjNNgwWC
 4k5WpQaxChEFa3482mBgT5swa9WgviA5jcwulPMaiuQYlJbDdFokwhkju+3mIhAg6iB+R
 2CKR+LmLzSPGA8U0diq3FaP/wl9WKSYeWomvhmLheD6UGES4oAUxR9pyZZ9B9DngDJGGX
 YHGMWF1FxGTzg4y095zM3LH0MiH628L9nwJN3JC4UenyJ7KgfwuGysjt1urXChhZKCZlX
 oJdR+EtoA28SRyBG64sGPhUtyHvU3oQQ4+UgeZK1KYjxfWeR/7btPsRhmWVMGKNrH+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793549056;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Cbrec3wPlxfIbbfhuqgMTb5LECOh63pwcctfZMxGXAk=;
 b=I8r0g6XLPywMEEMFJiQb7ANzsIDoz3v3uN4myl+7aKM8IySWiApruhbyQuV9b2MtgJv4
 MTz/jVj4QSfd4cVAsu+3ffZXPE9qNuhHGy4NqSsGunV1pyOt0uXzS2e5DXR/BOFXPPj2t
 9pI1w0HuDZErRdiszhgjRR6W+ZlF3/33TBBsjG3TJZ7JPe1HUdupAtG8k2V+WPU+38466
 gHuR5bYD8UxDAYqIYNAMC2HWEhfyYDL9qpde5fPTl/KLzDjwWEpu/PJzbRAyDbGPphFn4
 zrsrxrpIrTv7EtUkHbtNqlnEoheaiyusnDN/sVtszZWsZR0sAQ31xu1xtNs1KAcG1SA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D48FF605DB
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0DD79D49B; Sun,  1 Nov 2026 16:02:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 16:49:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b44f6a27ecf86bff4b137efe6648a32fe91464e1
X-Git-Newrev: f538f0164cc81ec803684041de65004885eaac15
X-Patchwork-Hint: ignore
Message-Id: <20261101160247.A0DD79D49B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.43.123
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f538f0164cc81ec803684041de65004885eaac15
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 61960a619f..6c79ec9e4b 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  d4ef8a8162f55f930817bd9496801491  boto3-1.43.118.tar.gz
-sha256  c0620f799e0f0c222ba42c337b65cdbcd3da38a3121187f634d8926cbbb28a9c  boto3-1.43.118.tar.gz
+md5  7d86080792fe50286be0312f32c26305  boto3-1.43.123.tar.gz
+sha256  055fabb990c5d2f31fce4ca569255bd640cdd11a3ca68c9ecad35f4f8a5b83b5  boto3-1.43.123.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 36ba647d2a..f4ff81d9e2 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.118
+PYTHON_BOTO3_VERSION = 1.43.123
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/96/8b/5694c8433b5202f34a82def4edee274f7df1eba2919c66d9d389d2202ec8
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/fc/8a/64b46f075149f9160da44aa7e1052dd18431b9ad4435beb0cfb02cc48624
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
