Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A582606A32D
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nPY8/1BF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6356064F;
	Sat,  7 Nov 2026 18:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwIApH_VBOQj; Sat,  7 Nov 2026 18:25:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 375236066D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794075944;
	b=ihA+SS4MWnJ7uqoRKuFqV9i3H49nwx0LrI8bEUHJHWPPiWi7ZcRa7KY1NrqaUTdskICz
	 DWtqrDzDGLZD3ApebiWhjWjLII4rYXzBASjw+CAeJXBre3OMZeGDe+gkNQA+uMUTdObTQ
	 DcpkFzh6minV+A6aTTfkP3ioV2blkWZ5n7hiOZyvfNhGx9MeVhc79rYdLqzlyqRamn0Ax
	 6sTEbbxGms+byh97E4gEsf1OWKv8cQNxeaFYUoGIPMJpi3OvJq7hspIJVJZ/ptiW3s/a5
	 zW0Rk27gssTV3HiZyVxTVh8sudct9Xwrjq+51AlR3cKbIDiamzfw4Fqg74FBQNRR3pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794075944;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K77X9hZUCvF/zIuOpJafAf38gDKKf3wnzin4iM4RGYw=;
	b=tLhUdrqKrNR6etbexDSpF1djsxphq1NKVYY8vxAdV0O1awQ5CFzTM3zKiZtpsxeA8gGp
	 rmYtb73J0zabC3rf5monNcXCYuHneufyrnhoQ7kKdOXJKV0TRxNrHs1Gswx5PnNyDXvQQ
	 gGhWmn74W3WRwf37zOj3OQoJRX7M36/z0S655WiCiInQwfX+sykjTUKI4wvggQ/wa1QgA
	 BjEXzW58XwfLi6zSAxRxXEB7LfTL3ShVaqUNQe9FKS/zwfNGffexcxWrHS4oZdnXEPCj+
	 4lWAkZBXPFKoTBZaA0iACG9TTohUmX627PZq9qVO3C2ytgxjLdLDFXPC8ryv5QwHj6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794075944;
	bh=K77X9hZUCvF/zIuOpJafAf38gDKKf3wnzin4iM4RGYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nPY8/1BFkHI4LtsJeKFzU/zGyrMQmaCGkUQ1eGsa47FGuH3BdiT9sF6wzuef2eekd
	 BE5q53HPxqCpJ44LcDYFbls9R3J/fLUjyVVhSCeQTb9369/UYOWAYIunPGktImMI8D
	 sExKIM2iCRyNrte5XDr+7Gd37Hz00KxXst1G5azd/8AMeMn1FZOY/efqmxomd6PbOd
	 4aW9HrtJ+hxXh/8PPuMoLXS7NiXBHaNRKfsn5gkP9t5f0De2COyegVkauIrBoRVxxp
	 QIdFf+lTsuBHaF7JAF7D5tlRseprg4DuGdOkyewbxol5UwwtmvP72cGSIM2C8QbTK2
	 GR/zYMGuH2/Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375236066D;
	Sat,  7 Nov 2026 18:25:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B223132A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA52400A9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2pA6KuBkHsm for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 18:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E8BB24009B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8BB24009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:25:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D6A188725; Sat,  7 Nov 2026 18:24:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 19:09:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b45aee7843533b5e813e28b51553104e9b020671
X-Git-Newrev: 261a30b253068338d8c4f1548828eddef754ffe0
X-Patchwork-Hint: ignore
Message-Id: <20261107182409.8D6A188725@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/piglit: bump version to git commit
 37b7926902
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/261a30b253068338d8c4f1548828eddef754ffe0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Added patch 0001 to fix build errors introduced by the bump of python3
to version 3.14.9 caused buildroot commit
1af96e786ef1d420bdb66c285a77d18df97db689 which is not part of any LTS
branches. No autobuilder errors were recorded.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lizer-reproducible_mtime-should-be-an-int.patch | 33 ++++++++++++++++++++++
 package/piglit/piglit.hash                         |  2 +-
 package/piglit/piglit.mk                           |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch b/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
new file mode 100644
index 0000000000..0a30d8bfe3
--- /dev/null
+++ b/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
@@ -0,0 +1,33 @@
+From 4c98e386fd91fa7306ba88d609748d21902c7eea Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Oct 2026 14:09:08 +0100
+Subject: [PATCH] tests/serializer: reproducible_mtime should be an int
+
+The mtime argument is an integer not a string, so parse it with int().
+
+Passing a string breaks piglit with Python 3.14.9, which does integer
+bound checks on the specified mtime.
+
+Upstream: https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1269
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ tests/serializer.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/serializer.py b/tests/serializer.py
+index 5ee9a1578..f7fdadf43 100644
+--- a/tests/serializer.py
++++ b/tests/serializer.py
+@@ -140,7 +140,7 @@ def serializer(name, profile, outfile):
+     tree = et.ElementTree(root)
+     reproducible_mtime = None
+     if 'SOURCE_DATE_EPOCH' in os.environ:
+-        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
++        reproducible_mtime=int(os.environ['SOURCE_DATE_EPOCH'])
+     with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
+         tree.write(f, encoding='utf-8', xml_declaration=True)
+ 
+-- 
+2.47.3
+
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 83c4c1fa3f..eec163e17a 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b7892506de63d4f5b62c6e5dbb0c7e0d14497cc4617f8784e4e446bfe81941ec  piglit-ec0fc2fef0755b1595c3799ab25129174a4b2007-git4.tar.gz
+sha256  9b9e1ca74351e32627c74a95ae3e18c47feb953b5b32c5c65aa2b275a5bbee4a  piglit-37b792690245fb543d9e9a84a6484d6d8cc99ec8-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index c4c004c824..24119ac10c 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = ec0fc2fef0755b1595c3799ab25129174a4b2007
+PIGLIT_VERSION = 37b792690245fb543d9e9a84a6484d6d8cc99ec8
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
