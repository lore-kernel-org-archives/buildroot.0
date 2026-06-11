Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D78CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486A661115;
	Fri, 12 Jun 2026 11:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJkt0mNW_5yU; Fri, 12 Jun 2026 11:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3027061107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263470;
	bh=rKN5hG5p2fmA1J4IV4zuGmrPlO+sAhh05gQJENPd97g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aMXEe0y1/2ZAexqrF729+rqW7Tqmozlaavs7ta0bWoYf0bQtFgfC++cGYp25hR/qs
	 /59g2qKJ7KOq5vgJefCP+3KyWsZDzAFxNRPLDjI1HjFittwH6jp5aPr7xcfQkqF212
	 QJFbzEe5Vi31Ld/fJe0FgaTlRekgMZ4+jQ+zQxXy6OSJCOEtTJAutUZEUU0bCfOsaE
	 EmsAQJ6Y9MKz7cvB0/qlSKxPRHldtByjFeeFU/jcW+IoVGxrUjFSQ24x0nJEuxorwu
	 /uYDgdKHd3wL9BrxgHpkCuZ0vTOudv6nKQ/a2lzYN97HI/P5R5qaSOOHP/MUUMjX0h
	 keEQ/blJHxi8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3027061107;
	Fri, 12 Jun 2026 11:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D24F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46D3740655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RYO2Rrt1-ZI for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1E440657
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1E440657
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C4A6880EA; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:06:32 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: dd2469fa708256ae7a3380c0cda256fc57e892fb
X-Git-Newrev: ee9086f30c6632308bee20e2eae853d2e1e0a4a0
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.1C4A6880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing: TestXfs:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee9086f30c6632308bee20e2eae853d2e1e0a4a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
