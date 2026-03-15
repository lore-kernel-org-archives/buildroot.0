Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F4F3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AB361460;
	Sun, 15 Mar 2026 22:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8HmwDmL8PiG; Sun, 15 Mar 2026 22:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A9E614AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613202;
	bh=aLdkDNpcSc+1OmP2qnDKS8qiaqtWAO8zvQRlylhnPp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RgP+IlDPoLjFsB3D307mrgMOGKp0JW/g/PBB7943jGqRnkiHJcNc5ANPLf1q6pwZo
	 gN/KYB2t0ypcag7s/KSYtSC9kXxaek9PyV9KQ9r+SjTDuYRyQBrjEthCg8M0hf0bxR
	 lBKG847YdTR4kn4wDtrbwtH+2MFBv1SzN7FbhtmKj6V2EwYZfAXIFmQjnL7Uv/JXlW
	 /DM3ugUKnQBW/tAqn5HwPKyrexDD61ksYfis8HGZofsnXnfk9zIy9IxYtdtI8sPYUq
	 HzcTFlXCYPyZyZEJEohJg9qpRxWydnijcFVgu2MSVtZQf/W+bJNALyLNdkTTFZ7Mf1
	 aVrcO56BaQnSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A9E614AB;
	Sun, 15 Mar 2026 22:20:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E2F357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B593610AD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmV6T-pauWqO for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC8E610F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC8E610F1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFBD482642; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52f5beb7d41789470464c29cad10acb97bf8d1bb
X-Git-Newrev: 507242b6632e5a28acfcf52ff882ecebb47bf6ea
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.CFBD482642@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 version to 2.9.0.20260305
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/507242b6632e5a28acfcf52ff882ecebb47bf6ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/python-dateutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 29cd158640..9f8e30447b 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  e55e57c4c0fc636b20f1ac3b48b49469  types_python_dateutil-2.9.0.20251115.tar.gz
-sha256  8a47f2c3920f52a994056b8786309b43143faa5a64d4cbb2722d6addabdf1a58  types_python_dateutil-2.9.0.20251115.tar.gz
+md5  59a73a1592656ca894f6c61eb8f2a0b3  types_python_dateutil-2.9.0.20260305.tar.gz
+sha256  389717c9f64d8f769f36d55a01873915b37e97e52ce21928198d210fbd393c8b  types_python_dateutil-2.9.0.20260305.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index 6a9c19185a..cece2e4fb1 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20251115
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260305
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/6a/36/06d01fb52c0d57e9ad0c237654990920fa41195e4b3d640830dabf9eeb2f
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1d/c7/025c624f347e10476b439a6619a95f1d200250ea88e7ccea6e09e48a7544
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
