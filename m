Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA61606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=era9u9LR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A28260B57;
	Fri, 30 Oct 2026 14:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYpD7Qyxu1Uz; Fri, 30 Oct 2026 14:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5809460AF3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369243;
	b=EQTauZXe56hjCKNiXea7FApooaW9kIiPhh484bt05DMuFc20UfOKQexRDucCMosud3dV
	 cCBB8XDA9Y6cuY5vk9a0zmLugiB2Lb9HDkpcXTcywBuI4lfosUk5PrnDsnvDdoJAdx00I
	 7lrMbD/wn7QxLFza/Dl9FdyWx3e30sMclFgf4rjM5T76/uKr5Y0sphq1psbjG7CYoxh6b
	 ud23k0nET9LBTkQgilUBlLZYBa//JYZ+Fs8C/eMGWiMmF/QqDaClDEFFiyIAa8a/9cfAR
	 4qlyFPdecNj0AUSU/kus8Ra0tWi5PuKiYvD7w7R5z6H5pllugnG6y93C6fnE1gd8SvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ieQMGAc+GOaM0UUwCjZGR9346LXkWjpu4ZBs2OnC1WE=;
	b=cmC2qYs1s1rZVTYqvNhAVJ9Npe9EfixAb0lbMPdtCZBer5JNnViW+V5CYTUZtNRdpezs
	 qHB+Su/zgYu8FxNyTc+BWQfgRM9oh5uJnv6zP0CcYnfc+/lHAhBxsZxmNYdFRsEe5ek4L
	 v4JdF48IO7TkylXKkAanwTcPDlVfLWXsc62U3DSG2nOyPJxb8AQW1LGk/Yq1/i4Q6Ni4v
	 D8oTs3WiMBl66kbNK6pjmRMvWQx2gKLUhiv54bQzLiJ9GwCrA/+WHuJkn7yXaKuukiLK7
	 wplwH039wV9ZTVMogkDo3rVMoupwQBkNvB3gGvAKcY0j6u6adJ1GJ88Fa/nmCWigptg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369243;
	bh=ieQMGAc+GOaM0UUwCjZGR9346LXkWjpu4ZBs2OnC1WE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=era9u9LRDtcFdxUkm1Nh7/xUyi0/Csk1ZgE7mCj9xt3ZZRscaC3eY1zMpsYCp6LK+
	 o3loixjVBWJmjXpmIkbNJIGLId26OZmTFK9l1Xt+Xn6BOaEyMPQbpMN3DlMkeC2QDq
	 pfvTmvaEfyRgclETP9QD0T2DaFulD/sqESu1baf/ZOV8V0O72/f2MAZcgmdx6YEQWH
	 gIqiWvmjDZIjGJXdfpSYo5YYPfP8fjy1wq/LeAKFMjQItBbiPiIAgl+s1qcy1YEmls
	 XRwHXYwVW1EsxCIdniop7Mh0gkdfpNhcZ02U+rzSY6HMZd2xTOuIPMQyo99HPKZX2Q
	 s9FrOcxE92yaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5809460AF3;
	Fri, 30 Oct 2026 14:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50CF3D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B5A8811A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZRa7ilcsk4j for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0B29281191
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=StQ3ynAXmW+G64xEAcywp7fUYldJdOsOyLKH7LWFHZjysgJQOmOVTbo/b/gfGqiGkaKm
 PO6rgm+09THFvOobzMu64vPQzdc63PNfSmYAScSfU67DHEc3Il0HOW/QI2yF7OITgYZN2
 EkxX9IFkN6Jdb5sCSx4TCbDy0WDSqy9i5/1HIu1BtMhT7LoI7Ccri+r0sDIlmk59Hdq7Y
 CvoDx/iARCLDMTgrtrBM08XqVTQeFHUBt5voAsZjf/0YmEwJjakH3jFU9OKuz/4uZnk9S
 4vXLnUv4FvAkS9Xl+sLRiVTN6zhERBKzZItYYJa+b/3zbl+rnF40PbaQcDpX3HB2A/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7WVDBWyIcLoxSV+GreLPEDRrEzlyXK8bH5JLmgaEVmQ=;
 b=YkUUESMgKo821oPrqaf3a+L9qE0v8V/BtSDHB5tih61IXpuYT9MoAovtNnfx6TsWOep3
 NlmCBLbs56BJRbxFTG9tIths6o+zoK+cWi3FcpnIeSIGQWc+C6rvtQD/+/WvslFSjvRi1
 9m3Ep0AHulfq44yRdyXjnm+vxdEnvv0MHWeG4qyHhVsRYewr8cwaAntB6rTSeFNNYWmLY
 Mr9QziaWkvPfp7oh1+k8t6wZKEtxMvHbm8ig3mnTk4hsLnD/0fUnafXKfOtcUeP19E+sH
 D7AxovR0uBo+HMLcaIBOfoZ5MdrTPnUofi8S+yF/En3IhiieU+w5zdS4XrPLTSYx8Xg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B29281191
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25F729C668; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 88ee2842b977e02bc9b3dd74a42fa3a4cfac64a0
X-Git-Newrev: 13f77c192dc86ef28ef1670303e1fed13886fd5a
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.25F729C668@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.115
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2112313390834563629=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2112313390834563629==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13f77c192dc86ef28ef1670303e1fed13886fd5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_115.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cd49f931a7e7b1ff7b043104b77671da8313e3d6)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 764bf1d179..1c6b5ede18 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_114_RTM/src/SHA256SUMS
-sha256  cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1  nss-3.114.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_RTM/src/SHA256SUMS
+sha256  ac2a47fb33bd79320159144e01c0d4af9a937a2d928c7c77ff06f5d9507861ab  nss-3.115.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9af53ca8ff..1580994941 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.114
+LIBNSS_VERSION = 3.115
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============2112313390834563629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2112313390834563629==--
