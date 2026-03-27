Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD9510ED652
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C162C61311;
	Fri, 27 Mar 2026 09:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67vLDisjlCM6; Fri, 27 Mar 2026 09:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A229E612EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605571;
	bh=T/oKFcwUB0YuaLA38R9sG/jPgrGP3kjlRKQeL0R9sjw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=joGEvcM2ixTY+/RlDCYP16LiR5rpxobp4xqAiEsvLJ9MCxhqaZlRV3tzuyExyxxLn
	 NkWu5a+ri+q+qGRXSgE5sbXIEyTnZppqh1inAIkQVou27InsYmQHw3zpKTIhFHRXpM
	 g2gXrLns5086R+eDjImW98dUaBgKC4UZtF9roN/Al7xoQCzPkNOKD2+qjEbVNou454
	 WIwANx7GO5nBdiZmVkonzL+ZOmgUOSeav3pzwXyc4SGQ6IJ3qOng5C7JpwLyygM3fK
	 2z5qh1DukVlUGEOi2Ssz/2Ii/Kk77+2FCoOrHvCmjkYdy6JOHofbaoCw2i2tq7fq5b
	 BqV+3CVgn/c/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A229E612EB;
	Fri, 27 Mar 2026 09:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78604249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECA87416A2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrhNUB534Fzl for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3140041678
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3140041678
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 770167FB68; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a4cee3b339dbe741232e88ee12ec29bb7a710f0
X-Git-Newrev: c04ad0721369d920ea4a00849dfd2640c9a96ca3
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.770167FB68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-wheel:
 patch CVE-2026-24049
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c04ad0721369d920ea4a00849dfd2640c9a96ca3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2026-24049:
    wheel is a command line tool for manipulating Python wheel files, as
    defined in PEP 427. In versions 0.40.0 through 0.46.1, the unpack
    function is vulnerable to file permission modification through
    mishandling of file permissions after extraction. The logic blindly
    trusts the filename from the archive header for the chmod operation,
    even though the extraction process itself might have sanitized the
    path. Attackers can craft a malicious wheel file that, when unpacked,
    changes the permissions of critical system files (e.g., /etc/passwd,
    SSH keys, config files), allowing for Privilege Escalation or
    arbitrary code execution by modifying now-writable scripts. This issue
    has been fixed in version 0.46.2.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24049
  - https://github.com/advisories/GHSA-8rrh-rw8j-w5fx

(cherry picked from commit 635c145c16c11f90109f49b842c5a1b4184760d1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-fixed-security-issue-around-wheel-unpack.patch | 35 ++++++++++++++++++++++
 package/python-wheel/python-wheel.mk               |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch b/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
new file mode 100644
index 0000000000..8640dfa291
--- /dev/null
+++ b/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
@@ -0,0 +1,35 @@
+From 7a7d2de96b22a9adf9208afcc9547e1001569fef Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Thu, 22 Jan 2026 01:41:14 +0200
+Subject: [PATCH] Fixed security issue around wheel unpack (#675)
+
+A maliciously crafted wheel could cause the permissions of a file outside the unpack tree to be altered.
+
+CVE: CVE-2026-24049
+Upstream: https://github.com/pypa/wheel/commit/7a7d2de96b22a9adf9208afcc9547e1001569fef.patch
+[thomas: change filename, remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/wheel/cli/unpack.py |  4 ++--
+ 3 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/src/wheel/cli/unpack.py b/src/wheel/cli/unpack.py
+index d48840e6e..83dc7423f 100644
+--- a/src/wheel/cli/unpack.py
++++ b/src/wheel/cli/unpack.py
+@@ -19,12 +19,12 @@ def unpack(path: str, dest: str = ".") -> None:
+         destination = Path(dest) / namever
+         print(f"Unpacking to: {destination}...", end="", flush=True)
+         for zinfo in wf.filelist:
+-            wf.extract(zinfo, destination)
++            target_path = Path(wf.extract(zinfo, destination))
+ 
+             # Set permissions to the same values as they were set in the archive
+             # We have to do this manually due to
+             # https://github.com/python/cpython/issues/59999
+             permissions = zinfo.external_attr >> 16 & 0o777
+-            destination.joinpath(zinfo.filename).chmod(permissions)
++            target_path.chmod(permissions)
+ 
+     print("OK")
+
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 417db7c167..ae02d21feb 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -13,4 +13,7 @@ PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
 PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
 PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
 
+# 0001-fixed-security-issue-around-wheel-unpack.patch
+PYTHON_WHEEL_IGNORE_CVES += CVE-2026-24049
+
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
