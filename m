From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 10:41:02 +0200
Subject: [Buildroot] [PATCH 1/2] boot/opensbi: move patches to 0.9/ subdir
 to only apply when the 0.9 version is selected
Message-ID: <20210512084104.26689-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the addition of support for custom opensbi version in commit
5c7166d387b (boot/opensbi: add support for version configuration), we can no
longer be sure that the Buildroot patches can be applied - So move them to a
0.9 subdir to ensure they are only applied when the _LATEST_VERSION is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{ => 0.9}/0001-Makefile-Don-t-specify-mabi-or-march.patch     | 0
 .../{ => 0.9}/0002-Makefile-unconditionally-disable-SSP.patch     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename boot/opensbi/{ => 0.9}/0001-Makefile-Don-t-specify-mabi-or-march.patch (100%)
 rename boot/opensbi/{ => 0.9}/0002-Makefile-unconditionally-disable-SSP.patch (100%)

diff --git a/boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
similarity index 100%
rename from boot/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
rename to boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
diff --git a/boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
similarity index 100%
rename from boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch
rename to boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
-- 
2.20.1
