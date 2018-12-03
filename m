From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:08:50 +0100
Subject: [Buildroot] [git commit] package/ejabberd: add a comment for
 runtime dependencies
Message-ID: <20181203210521.00DD07F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4073f2ae0e32e14981d47c6151274c3fd5ad9894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both p1_oauth2 and jiffy are runtime dependencies. Mark the
corresponding select in the Config.in file with a # runtime
comment.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ejabberd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 53b688b5d9..7d51d1de9e 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -3,11 +3,11 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_PACKAGE_ERLANG
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
-	select BR2_PACKAGE_ERLANG_JIFFY
+	select BR2_PACKAGE_ERLANG_JIFFY # runtime
 	select BR2_PACKAGE_ERLANG_LAGER
 	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
 	select BR2_PACKAGE_ERLANG_P1_ICONV
-	select BR2_PACKAGE_ERLANG_P1_OAUTH2
+	select BR2_PACKAGE_ERLANG_P1_OAUTH2 # runtime
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_STUN
