From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 09:48:24 +0200
Subject: [Buildroot] [git commit] boot/opensbi: move patches to 0.9/ subdir
 to only apply when the 0.9 version is selected
Message-ID: <20210513072035.D532C87499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ace8179deb7fdf8209c0314303674ad36b2e7a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the addition of support for custom opensbi version in commit
5c7166d387b (boot/opensbi: add support for version configuration), we can no
longer be sure that the Buildroot patches can be applied - So move them to a
0.9 subdir to ensure they are only applied when the _LATEST_VERSION is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/opensbi/{ => 0.9}/0001-Makefile-Don-t-specify-mabi-or-march.patch | 0
 boot/opensbi/{ => 0.9}/0002-Makefile-unconditionally-disable-SSP.patch | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
similarity index 100%
rename from boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
rename to boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
diff --git a/boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
similarity index 100%
rename from boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch
rename to boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
