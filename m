From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:52:31 +0100
Subject: [Buildroot] [git commit] pakage/erlang: fix host build without
	termcap (curses) library
Message-ID: <20141118210108.6179EB48E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e08ea03eb83261c04f1a9863f02df6658c9c9959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not need termcap (curses) support in the host variant of erlang.

Fixes a bunch of autobuild failures;
    http://autobuild.buildroot.net/results/4be/4bef658b6815929058c769037211f7e0fc8d1f9c/
    http://autobuild.buildroot.net/results/726/72619ed15590a3a5a41b7c398d973766ecab0a2e/
    http://autobuild.buildroot.net/results/366/366439438549d5f7656be72f71dae3bb5f99c6b2/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nathaniel Roach <nroach44@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index e6899de..ef0e0a2 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -27,6 +27,8 @@ ERLANG_CONF_OPTS = --without-javac
 HOST_ERLANG_DEPENDENCIES = host-openssl
 HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)/usr
 
+HOST_ERLANG_CONF_OPTS += --without-termcap
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 ERLANG_CONF_OPTS += --with-termcap
 ERLANG_DEPENDENCIES += ncurses
