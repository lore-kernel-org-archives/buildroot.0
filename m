Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A726DCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E0B060F99;
	Fri, 12 Jun 2026 11:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ny8tFDp5Q5_j; Fri, 12 Jun 2026 11:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEDA860F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263364;
	bh=ta00W8UKTnmyIAFGj9b+XLQ7poj5GmqsfDbp3rqEqqw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IhAilGCUmbMyMgP4fLmiAkks1ZRVJcmJ62U0DOPQYuofy+8Z+RceVFI/5mmWvuoO0
	 2RfPzJsxZ3qLbRh/cNx0I1nCcL5FAh0bIka8QbOyHFODkAoWrp3cK6qKdxellkd49u
	 VX4oR6mbUi2Mxb+Z+a5TETkT+JN8AYBEL3PfAdrKJ+34w0ANNnpeaoY/AuUO0fQSm4
	 zjaYjJWWU2AupjIexNfUwfD9fbc2+eLv6SsDKrCRRvsIdzWTTzeB90BHBVslIMBKay
	 y6iHUJS4+4TsTyePnGw4E1rWSBWVL0TkGVIStKrdp49kVd8msZkUQHVC0ixwjXVBPE
	 ZRKIdSmkh76ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEDA860F8B;
	Fri, 12 Jun 2026 11:22:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13636394
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CEEE40655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9kSrT0vu3Ng for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71404403B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71404403B2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A515880E9; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:06:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c6c6ec9aa2a33b4b4ce89a568bb2c6f9f40d275b
X-Git-Newrev: e71002ad10362f5317664a4486a7ec230a7be060
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.3A515880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: TestXfs:
 fix build on Gitlab runners
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e71002ad10362f5317664a4486a7ec230a7be060
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Our CI uses "/builds/buildroot.org/buildroot" as build directory.
Unlikely the xfsprogs build system misbehave when a directory in
the path contain ".o".

While generating .ltdep, the sed command used to convert object file
(.o) to libtool object(.lo) replace buildroot.org by buildroot.lorg.

  .ltdep: $(CFILES) $(HFILES)
    $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep

Building libfrog
    [CC]     gen_crc32table
    [GENERATE] crc32table.h
gmake[4]: *** No rule to make target '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', needed by 'avl64.lo'.  Stop.

Update the sed command to avoid this effect.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0a9bc387b64e3f946f782af04418a15e43404225)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-include-buildrules-fix-ltdep.patch        | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch b/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
new file mode 100644
index 0000000000..f17dc51edb
--- /dev/null
+++ b/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
@@ -0,0 +1,48 @@
+From cddc06c0eef874c01293cdb6e60090771a347c56 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 31 May 2026 21:08:09 +0200
+Subject: [PATCH] include/buildrules: fix ltdep
+
+Our CI uses "/builds/buildroot.org/buildroot" as build directory.
+Unlikely the xfsprogs build system misbehave when a directory in
+the path contain ".o".
+
+While generating .ltdep, the sed command used to convert object file
+(.o) to libtool object (.lo) replace buildroot.org by buildroot.lorg.
+
+  .ltdep: $(CFILES) $(HFILES)
+    $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
+
+Building libfrog
+    [CC]     gen_crc32table
+    [GENERATE] crc32table.h
+gmake[4]: *** No rule to make target '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', needed by 'avl64.lo'.  Stop.
+
+Update the sed command to avoid this effect.
+
+Upstream: https://lore.kernel.org/linux-xfs/20260531194553.1378795-1-romain.naour@smile.fr/T/#u
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ include/buildrules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/buildrules b/include/buildrules
+index 871e92db..3fabbe5a 100644
+--- a/include/buildrules
++++ b/include/buildrules
+@@ -140,7 +140,7 @@ rmltdep:
+ 	$(Q)rm -f .ltdep
+ 
+ .ltdep: $(CFILES) $(HFILES)
+-	$(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
++	$(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o:,\1.lo:,' > .ltdep
+ 
+ depend: rmdep .dep
+ 
+-- 
+2.54.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
