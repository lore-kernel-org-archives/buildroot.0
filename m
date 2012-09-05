From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Sep 2012 07:23:15 +0200
Subject: [Buildroot] [git commit] erlang: fix host version dependencies
Message-ID: <20120905052407.75B2C9956F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebb2e058b0c1bdb988fd8340efa46e4cf067d5ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8816fe16534062cdf0d3a682a7408f9adbea2985

The host version of erlang does not need to enable support for & depend on
host versions of ncurses/openssl/zlib, even if the target version does.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/erlang/erlang.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 6b90627..63c655b 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -8,6 +8,7 @@ ERLANG_VERSION = R15B01
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
+HOST_ERLANG_DEPENDENCIES =
 
 ERLANG_LICENSE = EPL
 ERLANG_LICENSE_FILES = EPLICENCE
