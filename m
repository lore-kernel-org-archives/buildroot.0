Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5FBC44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2BE81003;
	Wed, 21 Jan 2026 20:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8FTP1jXQk-r; Wed, 21 Jan 2026 20:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FBD81068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028289;
	bh=fPygW+RSwe82tNdj9mS5Zx0vK3t+jMpdhHwTUhWB3Ow=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I9x2PFqDekqeK8865Sw0d8ilVEgWoN9eBbcT0B2RjoQz5hmKh3Ru9UDDq0HBnsMFu
	 fIP3F9yizOAqrC4Cnn+EMZTrR8fsOsP4O60c0MA9DGptJ0WZsNdduyG34id9umZzpe
	 B+o/4N1M779sdLEcs+QI0qM47BTRHaHqaTG3MUVdFIyzymsC2Co6QcOL1RxxBemRSM
	 xN98TfC5vVqUQ2oifb8QOdiZ2xdtE7czzu1KYJvkG0JmfV58cNgd7J07xvHgy26YoP
	 68EDkNdm8jrxjedq8ocuq4qCZlI2uoDku4L7NuVAPsbqUuI0YGRUbPJGMGb6IlNUbX
	 gkRX1I3QOENHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FBD81068;
	Wed, 21 Jan 2026 20:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A52E34C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 659A540643
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMb9EILbMmmJ for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B5E4041C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B5E4041C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81F00874AA; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 20:53:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7447c0d86e55d973d69e92c70a55087e24320a5
X-Git-Newrev: a7a3621c0b45cd76255f018a2ab3718a14f0dadb
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.81F00874AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: drop unsupported system
 ffi option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7a3621c0b45cd76255f018a2ab3718a14f0dadb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --with-system-ffi was removed back in Python-3.12.0, in upstream
commit [1].

From the Python 3.12 release notes:

  - gh-100540: Removed the ``--with-system-ffi`` ``configure`` option;
    ``libffi`` must now always be supplied by the system on all non-Windows
    platforms.  The option has had no effect on non-Darwin platforms for
    several releases, and in 3.11 only had the non-obvious effect of invoking
    ``pkg-config`` to find ``libffi`` and never setting
    ``-DUSING_APPLE_OS_LIBFFI``.  Now on Darwin platforms ``configure`` will
    first check for the OS ``libffi`` and then fall back to the same
    processing as other platforms if it is not found.

Buildroot includes such a Python 3.12.x version since commit [2].

When compiling python3 in Buildroot, the package configuration step
reports the warning:

    configure: WARNING: unrecognized options: [...] --with-system-ffi

The commit drops the now defunct option.

[1] https://github.com/python/cpython/commit/25590eb5dee5176f3ac60916b19450f8198e7ffc
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
[Julien: add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0690678c04..d8ee11e8a8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -206,7 +206,6 @@ PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
-	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
