Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5195CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 17:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B41E404EE;
	Mon,  1 Jun 2026 17:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdzRyGtoRkPe; Mon,  1 Jun 2026 17:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A2D40507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780334261;
	bh=q95lqP8LT9ZY64j80uA9e6adYb+kyVoux4gS4nl8320=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MmE1akVuzfq++ZW2CipkQa+oHsJuZun+doZK3pU5XdGJ/UhAY0BUpEIk6JG3NHEDo
	 KVhOxTkq42prvWcEaz2BaYCWH/u5TxsW3jTQ3kL7NFgAot6nND+Si7wjYb26xebqNe
	 5GxhVQiwANit2AvvO9G7WGGaOz9a1BuVZktXdN2umVFHLXL8gnUepHngWE9p7VnyUD
	 muR6KNpgp6axozxqCmb1PM4TsOWjbL1bLv02KPEKx8X8Cq/iGZW73IYC/jwJrOKqB1
	 0HKDO4wMwgpqyQsi1533hAlCrR/cznd9pGfo/EADMpuju+/ZILMpm2G1KY8TTGqrjH
	 3jcY5jyje2ZGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A2D40507;
	Mon,  1 Jun 2026 17:17:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92C12F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78B5C60606
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2LM9dXsaeEp for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 17:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9E860604
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E9E860604
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:17:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EBBC877EB; Mon,  1 Jun 2026 17:17:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 19:16:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db75a8eea0bda678e651fe2b2ba85c3e0b2bed31
X-Git-Newrev: 0a9bc387b64e3f946f782af04418a15e43404225
X-Patchwork-Hint: ignore
Message-Id: <20260601171724.4EBBC877EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestXfs: fix build on
 Gitlab runners
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a9bc387b64e3f946f782af04418a15e43404225
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
