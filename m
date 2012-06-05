From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 05 Jun 2012 21:22:11 +0200
Subject: [Buildroot] [PATCH 0 of 6] Improve support for custom external
 toolchains (and related changes)
Message-ID: <patchbomb.1338924131@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main intention for this patch series is to allow downloading a custom
external toolchain. I had previously added this functionality to buildroot
(did not make it to mainstream, I should have followed it up better) and
have been using it for about a year now.
I have now lined it up with current buildroot, updated based on the
comments of ThomasP, and fixed some related problems I found along the
way.

Thomas De Schampheleire (6):
        pkg-download.mk: allow using localfiles outside of package infrastructure
        pkg-download.mk: use stripurischeme function in localfiles download method
        pkg-download.mk: support detection of URI schemes in DOWNLOAD
        toolchain-external/Config.in: fix indentation
        toolchain-external: allow downloading a custom toolchain
        toolchain-external: line up comments with reality


 package/pkg-download.mk                  |   15 +++-
 toolchain/toolchain-external/Config.in   |  371 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------------------
 toolchain/toolchain-external/ext-tool.mk |   19 ++++--
 3 files changed, 215 insertions(+), 190 deletions(-)
