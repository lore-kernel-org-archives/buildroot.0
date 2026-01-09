Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B62DD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1AE140B2A;
	Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id treOpZCPcqZR; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2D640B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333233;
	bh=l7sjlSYBHY7+mZf+Buf7/rAoCpZ60+5IyeXPZdmc8yM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kU4zIRwRv+2/slYkCNIq17StUSSx3oVE2Ac/GzCXPJifvIGNCopOU4pbGoYWn1TMh
	 y1nAIbum4WI9JQPxfr4WMHCK5kXyXGJxgRRiDaIVqCaKE34UOjus3KuMYIZ0S4ZOYX
	 Evx8L3PPVq242xK+qRvgxQzIx0fk0dfbToo0bsXCtwbLQv9YqTs4pUzvVxkYrCoxkU
	 UzxWTN9H/1nWdVntScmJrbtsrTea2VP0ptekRNXsJQ1fjiNhzS2sCPXnKG1Q2HHLrp
	 Z9ETOvp+pZkwVOqIJiOJ/7/LfalHjS0rI+MG+NV2GFHWq6soE2gSNSfMrg4Ko2TVtK
	 274ZAhF2XcauQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C2D640B29;
	Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 804A4231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70FF040B29
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xK9DjSDx5ogw for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B378840B25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B378840B25
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96F5B88557; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 15:58:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 37992e0766be050ac1efc0656926a0d427490009
X-Git-Newrev: 5eca2fdcad6d42ae1ea9f57d63b681bbd1289a0d
X-Patchwork-Hint: ignore
Message-Id: <20260113194031.96F5B88557@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/linux-tools:
 perf: build with libtraceevent support when it is selected
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
Content-Type: multipart/mixed; boundary="===============5120835238380519218=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5120835238380519218==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5eca2fdcad6d42ae1ea9f57d63b681bbd1289a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

When trying to perform a custom uprobe recording on a target with perf
built by buildroot, the recording step fails as perf can not record
uprobes without libtraceevent support:

  $ perf probe -x linked_list insert_name index
  Target program is compiled without optimization. Skipping prologue.
  Probe on address 0x808 to force probing at the function entry.

  Added new event:
    probe_linked_list:insert_name (on insert_name in /root/gdb/linked_list with index)

  perf is not linked with libtraceevent, to use the new probe you can use tracefs:

          cd /sys/kernel/tracing/
          echo 1 > events/probe_linked_list/insert_name/enable
          echo 1 > tracing_on
          cat trace_pipe
          Before removing the probe, echo 0 > events/probe_linked_list/insert_name/enable
  $ perf record -e probe_linked_list:insert_name ./linked_list
  event syntax error: 'probe_linked_list:insert_name'
                       \___ unsupported tracepoint

  libtraceevent is necessary for tracepoint support
  Run 'perf list' for a list of valid events

   Usage: perf record [<options>] [<command>]
      or: perf record [<options>] -- <command> [<options>]

      -e, --event <event>   event selector. use 'perf list' to list available events

libtraceevent support for perf has been disabled with commit
b4ab45a5c1db ("package/linux-tools: disable libtracevent detection")
because there was no libtraceevent package in buildroot to replace the
former libtraceevent removed from the kernel sources. Since then, commit
1474f1b34b17 ("package/libtraceevent: new package") has introduced a
libtraceevent package. We can then expose again the possibility to build
perf with libtraceevent support.

Make buildroot perf makefile detect if libtraceevent package has been
enabled, and if so, allow to build perf with libtraceevent support.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5396f730d7f77c572a67993ef139ed735650398f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d67318571a..1e19ee7f1c 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -28,7 +28,6 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
-	NO_LIBTRACEEVENT=1 \
 	NO_SHELLCHECK=1
 
 # We need to pass an argument to ld for setting the emulation when
@@ -128,6 +127,12 @@ PERF_MAKE_FLAGS += CORESIGHT=1
 # bare "ifdef CORESIGHT" constructs.
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTRACEEVENT),y)
+PERF_DEPENDENCIES += libtraceevent
+else
+PERF_MAKE_FLAGS += NO_LIBTRACEEVENT=1
+endif
+
 # We really do not want to build the perf documentation, because it
 # has stringent requirement on the documentation generation tools,
 # like xmlto and asciidoc), which may be lagging behind on some

--===============5120835238380519218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5120835238380519218==--
