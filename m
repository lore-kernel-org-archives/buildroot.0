Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFDBE77191
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C2640541;
	Sun, 29 Dec 2024 12:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1Ei_8j7h9e8; Sun, 29 Dec 2024 12:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FBAF4055C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FBAF4055C;
	Sun, 29 Dec 2024 12:00:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7C2FC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D8940555
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y47HhM444BIw for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F7D40531
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98F7D40531
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53B1580250; Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 12:43:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f74ee11b484b55b4d314195b4e5abf2f3625382
X-Git-Newrev: 0d08940ce6454066254204aa9126a5c65cad7628
X-Patchwork-Hint: ignore
Message-Id: <20241229120014.53B1580250@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.39
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4180749800825206650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4180749800825206650==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0d08940ce6454066254204aa9126a5c65cad7628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
c9972235833b3586c05a6e6c4145aef6df3f4281 ("build: install headers with
enums"), building wayland-protocols requires the wayland-scanner tool,
so we must add host-wayland to the dependencies of wayland-protocols.

1.36 -> 1.37
============

From
https://lists.freedesktop.org/archives/wayland-devel/2024-August/043774.html:

This release contains three new protocols:

 * xdg-toplevel-icon

Associate an icon with a toplevel window.

 * ext-image-capture-source
 * ext-image-copy-capture

A set of protocols that together allow capturing the pixel content of
outputs and toplevels.

Apart from this, it includes the usual protocol documentation
improvements and fixes, as well as clarification of existing protocol
review practices.

Enjoy!

Andri Yngvason (2):
      ext-image-capture-source-v1: new protocol
      ext-image-copy-capture-v1: new protocol

Derek Foreman (1):
      various: Fix definition of double-buffered state

Jonas Ådahl (1):
      build: Bump version to 1.37

Matthias Klumpp (1):
      staging: Add xdg-toplevel-icon protocol for dedicated toplevel icons

Nicolas Fella (1):
      tablet-v2: Fix feedback description in mode_switch

PolyMeilex (1):
      Fix some trivial typos

Simon Ser (7):
      ci: don't run pipelines in forks
      readme: s/Makefile.am/meson.build/
      readme: use references for links
      readme: recommend using "Draft:" prefix for RFC protocols
      members: trim trailing comma
      governance: document review requirements
      xdg-toplevel-icon: add error for destroyed wl_buffer

Xaver Hugl (1):
      staging/tearing-control: clarify what happens after wl_surface destruction

YaoBing Xiao (1):
      pointer-gestures: Add punctuation to clarify gesture cycles

1.37 -> 1.38
============

From
https://lists.freedesktop.org/archives/wayland-devel/2024-October/043851.html:

This full packed release comes with three new staging protocols:

 * system bell - allowing e.g. terminal emulators to hand off system
   bell alerts to the compositor for among other things accessibility
   purposes

 * fifo - for implementing first in first out surface content update
   behavior

 * commit timing - for adding time constraints to surface content
   update

Other than this, the presentation timing protocol protocol got a version
minor bump describing how to deal with variable refresh rate.

Other protocols saw the regular clarifications and bug fixes, and some
deprecated events is now properly indicated as such in the XML. Please
see individual commits for details.

Since the last release, a new member was also added to MEMBERS.md: mesa.

Daniel Stone (3):
      protocols: Add GitLab contact information
      README: Suggest pinging protocol authors on changes
      presentation-time: Specify refresh bounds for VRR

Derek Foreman (2):
      fifo-v1: Add new protocol
      commit-timing-v1: Add new protocol

Jonas Ådahl (4):
      members: Update weston point-of-contact
      members: Add mesa as a member
      Add staging system bell protocol
      build: Bump version to 1.38

Julian Orth (1):
      security-context-v1: clarify close_fd behavior

Nick Diego Yamane (1):
      xdg-toplevel-drag: clarify offset is relative to geometry

Sebastian Wick (1):
      cursor-shape-v1: Make object inert when underlying cap is destroyed

Simon Ser (9):
      xdg-decoration: add invalid_mode error
      xdg-shell: clarify clients set their initial state before initial commit
      xdg-toplevel-icon: clarify that wl_buffer.release is unused
      ci: upgrade wayland to v1.23.1
      linux-dmabuf: mark format/modifier with deprecated-since attribute
      xdg-output: mark done event with deprecated-since attribute
      build: install headers with enums
      ext-image-copy-capture: fix typo
      governance: drop adoption website section

Simon Zeni (3):
      drm-lease-v1: specify existing lease status on withdrawn event
      drm-lease-v1: advertise connector again upon lease destruction
      drm-lease-v1: advertise connector again upon lease finished event

itycodes (1):
      ext-image-copy-capture-v1: Fix typo in ext_image_copy_capture_frame_v1::destroy

1.38 -> 1.39
============

From
https://lists.freedesktop.org/archives/wayland-devel/2024-December/043920.html:

This new release contains two new protocols:

  * ext-data-control - allow privileged clients to control data devices, e.g. a
  clipboard manager.

  * ext-workspace - receive events about and control workspaces, useful for
  e.g. workspace indicators.

This release also includes the recent governance workflow changes and
clarifications. Mesa is also listed as a member, Simon Zeni was added as a
drm-lease maintainer, and Nick Diego Yamane was added as a xdg-toplevel-drag
maintainer.

Daniel Stone (3):
      governance: Clarify 'member'
      governance: Specify how to change points of contact
      governance: Deprecate wayland-devel@

Heiko Becker (1):
      build: Raise required wayland-scanner version to 1.23.0 for tests

Jonas Ådahl (1):
      build: Bump version to 1.39

Mike Blumenkrantz (3):
      add experimental protocols and their requirements
      governance: introduce workflow improvements
      governance: update NACK usage/restrictions

Neal Gompa (1):
      Add ext-data-control protocol

Nick Diego Yamane (1):
      xdg-toplevel-drag: Add myself as co-maintainer

Simon Ser (1):
      drm-lease: nominate Simon Zeni as maintainer

Victoria Brekenfeld (1):
      Add ext-workspace

YaoBing Xiao (1):
      ext-image-copy-capture: fix the error in the protocol description

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 93d40a919c..645d6d8f25 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043581.html
-sha256  71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92  wayland-protocols-1.36.tar.xz
-sha512  5448b9aedc953ce6be0f378da900c195c8743cb6001f615823b5fc9cab3e3ee54271132055743278e10decef7f8e9dcdeef31593a2a12062575fb90eb0084be0  wayland-protocols-1.36.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-December/043920.html
+sha256  e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa  wayland-protocols-1.39.tar.xz
+sha512  480a195ec0846400d93160e3d0a7ba12948ed841835ee4661f54b0101ae0027affd9c0f660a73244786fecd70e4f609830489a6b95e00d750cf2379734aacbe0  wayland-protocols-1.39.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index c0dfe69401..b04693978d 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.36
+WAYLAND_PROTOCOLS_VERSION = 1.39
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
 WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
 WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
+# needs wayland-scanner
+WAYLAND_PROTOCOLS_DEPENDENCIES = host-wayland
 
 WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
 

--===============4180749800825206650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4180749800825206650==--
