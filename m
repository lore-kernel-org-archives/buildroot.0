Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E769EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ACDE4081A;
	Thu,  1 Jan 2026 09:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAyH6R0_vIDe; Thu,  1 Jan 2026 09:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4DE140711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260558;
	bh=aX1eRbhMF8JVHvTeMopTglknKaWTotJo6V85IhdLBfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=buosIafmz2aJHlGcQoCUtwpfW82gFsvF7bGNCN5k4WQtrNYyaOOun2oGbw8EoJq0f
	 y0CudfCRPMZcnStwNH4DPxbRG52219ySyZsEPTgW8eKjVoYsxq/aNwSrz1yoWlxKpS
	 GJZOIEdQVYIXfGvU1qtfa94si8v1Un48CHLS56wtuFDaVpFcnv9ermubfYUXKyces+
	 10hSFam4MZkMR7C+TrQDKKwTa+Je50qvwT9Iwn6xuU1yN3obri4tdCJue1MNsGw2YT
	 gsTE7jfuG5haTwDsfSgPUVqQlR89DNA6p6OHlauntdMVgiWbuUvpyzAw2zJQTAZaZq
	 pXJztVgIlg9fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4DE140711;
	Thu,  1 Jan 2026 09:42:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26904206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A0B040168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU2QjMwDL5oS for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A7B400A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49A7B400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AD74878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc6187f9dbae67c8acae207e388bec790876a206
X-Git-Newrev: f09b01a01a861ef4bd56db8997073450fb0a11a7
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.3AD74878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tftpy: bump to version 0.8.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f09b01a01a861ef4bd56db8997073450fb0a11a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tftpy/python-tftpy.hash | 5 ++++-
 package/python-tftpy/python-tftpy.mk   | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
index 3a040a456a..93fb32621d 100644
--- a/package/python-tftpy/python-tftpy.hash
+++ b/package/python-tftpy/python-tftpy.hash
@@ -1,3 +1,6 @@
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/tftpy/json
+md5  8f81c101961282c965086fc3cd123a40  tftpy-0.8.6.tar.gz
+sha256  f616f6a43a36d481c266573608597b9dd3c7c63818415d72aa04f1d1795480ea  tftpy-0.8.6.tar.gz
+# Locally computed sha256 checksums
 sha256  fc1460bf698c4207a255fffb446ce21d44cb0d9a8f2ee5ad705cd40969800050  python-tftpy-0.8.5.tar.gz
 sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 322d514f1f..5b31b4a5cf 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TFTPY_VERSION = 0.8.5
-PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
+PYTHON_TFTPY_VERSION = 0.8.6
+PYTHON_TFTPY_SOURCE = tftpy-$(PYTHON_TFTPY_VERSION).tar.gz
+PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/68/7a/15a01d67184aa855e07eac08bfd514e008027ff198b32274f7657d8368ad
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
