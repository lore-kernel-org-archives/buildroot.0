From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 08:50:11 +0100
Subject: [Buildroot] [git commit] cppdb: new package
In-Reply-To: <20131111005852.635979BBAE@busybox.osuosl.org>
References: <20131111005852.635979BBAE@busybox.osuosl.org>
Message-ID: <abe97ff0-f147-45a4-ac15-ce0802dc12f6@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <peter@korsgaard.com> wrote:
>commit: http://git.buildroot.net/buildroot/commit/?id=0c14b6c9a66900e427e82326108ac63fe46dd483
>branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>---
> package/Config.in       |    1 +
> package/cppdb/Config.in |   15 +++++++++++++++
> package/cppdb/cppdb.mk  |   20 ++++++++++++++++++++
> 3 files changed, 36 insertions(+), 0 deletions(-)
>
>diff --git a/package/Config.in b/package/Config.in
>index d0db7d6..311cc6c 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -472,6 +472,7 @@ endmenu
> 
> menu "Database"
> source "package/berkeleydb/Config.in"
>+source "package/cppdb/Config.in"
> source "package/gdbm/Config.in"
> source "package/mysql_client/Config.in"
> source "package/redis/Config.in"
>diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
>new file mode 100644
>index 0000000..f0c48e3
>--- /dev/null
>+++ b/package/cppdb/Config.in
>@@ -0,0 +1,15 @@
>+config BR2_PACKAGE_CPPDB
>+	bool "cppdb"
>+	depends on BR2_INSTALL_LIBSTDCPP
>+	depends on BR2_TOOLCHAIN_HAS_THREADS
>+	# Can be built without them but it's useless
>+	depends on BR2_PACKAGE_MYSQL_CLIENT || BR2_PACKAGE_SQLITE

This dependency should also have been added on the comment, to make sure it is only shown when relevant...
