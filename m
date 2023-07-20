Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED068EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A390360736;
	Thu, 20 Jul 2023 21:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A390360736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJ6muVgr4ZaN; Thu, 20 Jul 2023 21:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F038A61290;
	Thu, 20 Jul 2023 21:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F038A61290
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC191BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7945161289
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7945161289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_I7oqNE1t5h for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39E346129B
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E346129B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3822C8742E; Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:08:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f36e336ee57d9264b035bc3b108fd19440b2a2ce
X-Git-Newrev: fd29a61f019146b52e0056c7ae8a2bb9bd7c086c
X-Patchwork-Hint: ignore
Message-Id: <20230720211020.3822C8742E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ejabberd: bump version to 23.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd29a61f019146b52e0056c7ae8a2bb9bd7c086c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patches, added sha256 hash provided by upstream, switched tarball
to tar.gz.

Added make target "all" because the default make target "compile" in
pkg-rebar.mk does not build ejabberdctl.example after upstream commit
https://github.com/processone/ejabberd/commit/93f994d50a243698f0eedf25ecfc9a3d8e233fda

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-do-not-download-or-compile-dependencies.patch |  12 +-
 package/ejabberd/0002-fix-ejabberdctl.patch        |   4 +-
 package/ejabberd/0003-correct-includes.patch       | 362 ++++++++++++---------
 package/ejabberd/ejabberd.hash                     |   3 +-
 package/ejabberd/ejabberd.mk                       |   6 +-
 5 files changed, 225 insertions(+), 162 deletions(-)

diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
index 58213ed2e6..abcc8975b2 100644
--- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
@@ -4,6 +4,8 @@ Date: Fri, 13 May 2022 14:22:37 +0200
 Subject: [PATCH] Makefile.in: do not download or compile dependencies
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+[Bernd: updated for version 23.04]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -12,17 +14,17 @@ diff --git a/Makefile.in b/Makefile.in
 index ab0e9d967..6e54168a7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -139,7 +139,7 @@ else
+@@ -155,7 +155,7 @@ else
  endif
  endif
  
--all: deps src
-+all: src
+-all: scripts deps src
++all: scripts src
  
  deps: $(DEPSDIR)/.got
  
-@@ -153,7 +153,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
- 	$(CONFIGURE_DEPS)
+@@ -169,7 +169,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
+ $(DEPSDIR)/.built: $(DEPSDIR)/.got
  	$(REBAR) compile && :> $(DEPSDIR)/.built
  
 -src: $(DEPSDIR)/.built
diff --git a/package/ejabberd/0002-fix-ejabberdctl.patch b/package/ejabberd/0002-fix-ejabberdctl.patch
index e7fc9315c0..ae28f3a632 100644
--- a/package/ejabberd/0002-fix-ejabberdctl.patch
+++ b/package/ejabberd/0002-fix-ejabberdctl.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] fix ejabberdctl
 Change default values so ejabberdctl run commands as ejabberd user.
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+[Bernd: updated for version 23.04]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  ejabberdctl.template | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -14,7 +16,7 @@ diff --git a/ejabberdctl.template b/ejabberdctl.template
 index a940c3df7..5166e5a27 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -15,7 +15,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
+@@ -17,7 +17,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
  ERL="{{erl}}"
  IEX="{{bindir}}/iex"
  EPMD="{{epmd}}"
diff --git a/package/ejabberd/0003-correct-includes.patch b/package/ejabberd/0003-correct-includes.patch
index 4ff02b5741..338aa28fd2 100644
--- a/package/ejabberd/0003-correct-includes.patch
+++ b/package/ejabberd/0003-correct-includes.patch
@@ -1,4 +1,4 @@
-From 6d6b6441774b00a6903c79d9e9d14047969d40ae Mon Sep 17 00:00:00 2001
+From 710b6f7c0cfc9ab300d03f12538da3e26c35207b Mon Sep 17 00:00:00 2001
 From: Philipp Huebner <debalance@debian.org>
 Date: Tue, 31 May 2022 10:30:52 +0200
 Subject: [PATCH] correct includes
@@ -10,6 +10,8 @@ includes must be adjusted for the corresponding libraries to be found.
 Author: Philipp Huebner <debalance@debian.org>
 Original: https://salsa.debian.org/ejabberd-packaging-team/ejabberd/-/blob/master/debian/patches/src.includes.patch
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+[Bernd: updated for version 23.04]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/ejabberd_auth.erl             | 2 +-
  src/ejabberd_auth_anonymous.erl   | 2 +-
@@ -38,6 +40,7 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  src/ejabberd_web_admin.erl        | 2 +-
  src/ejabberd_websocket.erl        | 2 +-
  src/ejabberd_xmlrpc.erl           | 2 +-
+ src/ext_mod.erl                   | 2 +-
  src/gen_iq_handler.erl            | 2 +-
  src/gen_pubsub_node.erl           | 2 +-
  src/gen_pubsub_nodetree.erl       | 2 +-
@@ -61,6 +64,7 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  src/mod_delegation.erl            | 2 +-
  src/mod_disco.erl                 | 2 +-
  src/mod_fail2ban.erl              | 2 +-
+ src/mod_host_meta.erl             | 2 +-
  src/mod_http_api.erl              | 2 +-
  src/mod_http_upload.erl           | 2 +-
  src/mod_http_upload_quota.erl     | 2 +-
@@ -73,6 +77,7 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  src/mod_metrics.erl               | 2 +-
  src/mod_mix.erl                   | 2 +-
  src/mod_mix_pam.erl               | 2 +-
+ src/mod_mqtt_bridge_session.erl   | 2 +-
  src/mod_mqtt_session.erl          | 2 +-
  src/mod_mqtt_ws.erl               | 2 +-
  src/mod_muc.erl                   | 2 +-
@@ -80,6 +85,7 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  src/mod_muc_log.erl               | 2 +-
  src/mod_muc_mnesia.erl            | 2 +-
  src/mod_muc_room.erl              | 2 +-
+ src/mod_muc_rtbl.erl              | 2 +-
  src/mod_muc_sql.erl               | 2 +-
  src/mod_multicast.erl             | 2 +-
  src/mod_offline.erl               | 2 +-
@@ -134,13 +140,13 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  src/pubsub_subscription_sql.erl   | 2 +-
  test/suite.hrl                    | 8 ++++----
  tools/xml_compress_gen.erl        | 2 +-
- 123 files changed, 128 insertions(+), 128 deletions(-)
+ 127 files changed, 132 insertions(+), 132 deletions(-)
 
 diff --git a/src/ejabberd_auth.erl b/src/ejabberd_auth.erl
-index 35e4921b7..7e3e05a4e 100644
+index 027983e61..06150f34a 100644
 --- a/src/ejabberd_auth.erl
 +++ b/src/ejabberd_auth.erl
-@@ -48,7 +48,7 @@
+@@ -50,7 +50,7 @@
  
  -export([auth_modules/1, convert_to_scram/1]).
  
@@ -150,7 +156,7 @@ index 35e4921b7..7e3e05a4e 100644
  
  -define(SALT_LENGTH, 16).
 diff --git a/src/ejabberd_auth_anonymous.erl b/src/ejabberd_auth_anonymous.erl
-index dd7ff28eb..ee56ec5b0 100644
+index 056d475f8..9284c10f6 100644
 --- a/src/ejabberd_auth_anonymous.erl
 +++ b/src/ejabberd_auth_anonymous.erl
 @@ -45,7 +45,7 @@
@@ -163,7 +169,7 @@ index dd7ff28eb..ee56ec5b0 100644
  start(Host) ->
      ejabberd_hooks:add(sm_register_connection_hook, Host,
 diff --git a/src/ejabberd_auth_jwt.erl b/src/ejabberd_auth_jwt.erl
-index 6df742305..a8024d587 100644
+index e4b251a03..8074d8612 100644
 --- a/src/ejabberd_auth_jwt.erl
 +++ b/src/ejabberd_auth_jwt.erl
 @@ -36,7 +36,7 @@
@@ -176,7 +182,7 @@ index 6df742305..a8024d587 100644
  
  %%%----------------------------------------------------------------------
 diff --git a/src/ejabberd_auth_mnesia.erl b/src/ejabberd_auth_mnesia.erl
-index 168ee76f5..5e75ddae2 100644
+index d52dde868..468ae4b19 100644
 --- a/src/ejabberd_auth_mnesia.erl
 +++ b/src/ejabberd_auth_mnesia.erl
 @@ -37,7 +37,7 @@
@@ -189,7 +195,7 @@ index 168ee76f5..5e75ddae2 100644
  
  -record(reg_users_counter, {vhost = <<"">> :: binary(),
 diff --git a/src/ejabberd_auth_sql.erl b/src/ejabberd_auth_sql.erl
-index 50cc1902e..29de0cd7c 100644
+index 566152695..a730d61bc 100644
 --- a/src/ejabberd_auth_sql.erl
 +++ b/src/ejabberd_auth_sql.erl
 @@ -35,7 +35,7 @@
@@ -202,7 +208,7 @@ index 50cc1902e..29de0cd7c 100644
  -include("ejabberd_sql_pt.hrl").
  -include("ejabberd_auth.hrl").
 diff --git a/src/ejabberd_bosh.erl b/src/ejabberd_bosh.erl
-index e9d2f0c0a..0bcc9dac0 100644
+index 06aaacda9..e0c72f74b 100644
 --- a/src/ejabberd_bosh.erl
 +++ b/src/ejabberd_bosh.erl
 @@ -43,7 +43,7 @@
@@ -215,10 +221,10 @@ index e9d2f0c0a..0bcc9dac0 100644
  -include("bosh.hrl").
  
 diff --git a/src/ejabberd_c2s.erl b/src/ejabberd_c2s.erl
-index 3218cce51..d09f3a9b5 100644
+index d7b3a3340..670e57516 100644
 --- a/src/ejabberd_c2s.erl
 +++ b/src/ejabberd_c2s.erl
-@@ -47,7 +47,7 @@
+@@ -51,7 +51,7 @@
  	 reply/2, copy_state/2, set_timeout/2, route/2, format_reason/2,
  	 host_up/1, host_down/1, send_ws_ping/1, bounce_message_queue/2]).
  
@@ -228,7 +234,7 @@ index 3218cce51..d09f3a9b5 100644
  -include("mod_roster.hrl").
  -include("translate.hrl").
 diff --git a/src/ejabberd_captcha.erl b/src/ejabberd_captcha.erl
-index 343a8e54e..f3efd5026 100644
+index 12ab5abb8..e2d400a48 100644
 --- a/src/ejabberd_captcha.erl
 +++ b/src/ejabberd_captcha.erl
 @@ -42,7 +42,7 @@
@@ -241,7 +247,7 @@ index 343a8e54e..f3efd5026 100644
  -include("ejabberd_http.hrl").
  -include("translate.hrl").
 diff --git a/src/ejabberd_http.erl b/src/ejabberd_http.erl
-index d577a10d5..bc8e15620 100644
+index f29f36063..34ac89190 100644
 --- a/src/ejabberd_http.erl
 +++ b/src/ejabberd_http.erl
 @@ -37,7 +37,7 @@
@@ -251,10 +257,10 @@ index d577a10d5..bc8e15620 100644
 --include_lib("xmpp/include/xmpp.hrl").
 +-include_lib("p1_xmpp/include/xmpp.hrl").
  -include("ejabberd_http.hrl").
+ -include("ejabberd_stacktrace.hrl").
  -include_lib("kernel/include/file.hrl").
- 
 diff --git a/src/ejabberd_http_ws.erl b/src/ejabberd_http_ws.erl
-index eb2100a42..632eaa5c9 100644
+index e14ca69e6..83986a69b 100644
 --- a/src/ejabberd_http_ws.erl
 +++ b/src/ejabberd_http_ws.erl
 @@ -36,7 +36,7 @@
@@ -267,7 +273,7 @@ index eb2100a42..632eaa5c9 100644
  -include("ejabberd_http.hrl").
  
 diff --git a/src/ejabberd_iq.erl b/src/ejabberd_iq.erl
-index 249c53294..2a0e1dce2 100644
+index b4957dd55..53f476962 100644
 --- a/src/ejabberd_iq.erl
 +++ b/src/ejabberd_iq.erl
 @@ -34,7 +34,7 @@
@@ -280,7 +286,7 @@ index 249c53294..2a0e1dce2 100644
  -include("ejabberd_stacktrace.hrl").
  
 diff --git a/src/ejabberd_local.erl b/src/ejabberd_local.erl
-index 6dfef9d01..80f1fdbda 100644
+index 5147a7481..7376acbd7 100644
 --- a/src/ejabberd_local.erl
 +++ b/src/ejabberd_local.erl
 @@ -47,7 +47,7 @@
@@ -293,7 +299,7 @@ index 6dfef9d01..80f1fdbda 100644
  -include("translate.hrl").
  
 diff --git a/src/ejabberd_oauth.erl b/src/ejabberd_oauth.erl
-index 9b2c517de..0197333ef 100644
+index ba369c1f2..6f4f6d9c8 100644
 --- a/src/ejabberd_oauth.erl
 +++ b/src/ejabberd_oauth.erl
 @@ -54,7 +54,7 @@
@@ -306,7 +312,7 @@ index 9b2c517de..0197333ef 100644
  -include("ejabberd_http.hrl").
  -include("ejabberd_web_admin.hrl").
 diff --git a/src/ejabberd_oauth_rest.erl b/src/ejabberd_oauth_rest.erl
-index b968c9263..47d13f05e 100644
+index 1a18e2655..36301cfaf 100644
 --- a/src/ejabberd_oauth_rest.erl
 +++ b/src/ejabberd_oauth_rest.erl
 @@ -36,7 +36,7 @@
@@ -319,7 +325,7 @@ index b968c9263..47d13f05e 100644
  init() ->
      rest:start(ejabberd_config:get_myname()),
 diff --git a/src/ejabberd_oauth_sql.erl b/src/ejabberd_oauth_sql.erl
-index 25be737f0..11d4483a5 100644
+index ecb1625c7..8513a430b 100644
 --- a/src/ejabberd_oauth_sql.erl
 +++ b/src/ejabberd_oauth_sql.erl
 @@ -37,7 +37,7 @@
@@ -332,7 +338,7 @@ index 25be737f0..11d4483a5 100644
  
  init() ->
 diff --git a/src/ejabberd_piefxis.erl b/src/ejabberd_piefxis.erl
-index d62efb300..fba76f62a 100644
+index 01fa24852..5ce3077d5 100644
 --- a/src/ejabberd_piefxis.erl
 +++ b/src/ejabberd_piefxis.erl
 @@ -38,9 +38,9 @@
@@ -348,7 +354,7 @@ index d62efb300..fba76f62a 100644
  -include("mod_roster.hrl").
  
 diff --git a/src/ejabberd_router.erl b/src/ejabberd_router.erl
-index 492beb6d3..ee2ddcba9 100644
+index 3a2c6f318..b80e893cc 100644
 --- a/src/ejabberd_router.erl
 +++ b/src/ejabberd_router.erl
 @@ -69,7 +69,7 @@
@@ -361,7 +367,7 @@ index 492beb6d3..ee2ddcba9 100644
  
  -callback init() -> any().
 diff --git a/src/ejabberd_router_multicast.erl b/src/ejabberd_router_multicast.erl
-index e97ccb837..7ef026fa1 100644
+index 773a3788e..ab341df09 100644
 --- a/src/ejabberd_router_multicast.erl
 +++ b/src/ejabberd_router_multicast.erl
 @@ -42,7 +42,7 @@
@@ -374,7 +380,7 @@ index e97ccb837..7ef026fa1 100644
  -record(route_multicast, {domain = <<"">> :: binary() | '_',
  			  pid = self() :: pid()}).
 diff --git a/src/ejabberd_s2s.erl b/src/ejabberd_s2s.erl
-index 04490071c..0d345e947 100644
+index 378a55a43..a31e2d14d 100644
 --- a/src/ejabberd_s2s.erl
 +++ b/src/ejabberd_s2s.erl
 @@ -52,7 +52,7 @@
@@ -387,7 +393,7 @@ index 04490071c..0d345e947 100644
  -include_lib("stdlib/include/ms_transform.hrl").
  -include("ejabberd_stacktrace.hrl").
 diff --git a/src/ejabberd_s2s_in.erl b/src/ejabberd_s2s_in.erl
-index 8177a7333..fcffcb7b0 100644
+index ab8bb4503..7e8aa79b0 100644
 --- a/src/ejabberd_s2s_in.erl
 +++ b/src/ejabberd_s2s_in.erl
 @@ -41,7 +41,7 @@
@@ -400,7 +406,7 @@ index 8177a7333..fcffcb7b0 100644
  
  -type state() :: xmpp_stream_in:state().
 diff --git a/src/ejabberd_s2s_out.erl b/src/ejabberd_s2s_out.erl
-index f057705ed..4139b0fe7 100644
+index b9ae1abb3..dadd50a6f 100644
 --- a/src/ejabberd_s2s_out.erl
 +++ b/src/ejabberd_s2s_out.erl
 @@ -39,7 +39,7 @@
@@ -413,7 +419,7 @@ index f057705ed..4139b0fe7 100644
  -include("translate.hrl").
  
 diff --git a/src/ejabberd_service.erl b/src/ejabberd_service.erl
-index b854bcb2b..3cc939679 100644
+index 3afa64f37..14c0259df 100644
 --- a/src/ejabberd_service.erl
 +++ b/src/ejabberd_service.erl
 @@ -35,7 +35,7 @@
@@ -426,7 +432,7 @@ index b854bcb2b..3cc939679 100644
  -include("translate.hrl").
  
 diff --git a/src/ejabberd_sm.erl b/src/ejabberd_sm.erl
-index afb95c10b..e5011ed23 100644
+index c9317b81c..6464801fe 100644
 --- a/src/ejabberd_sm.erl
 +++ b/src/ejabberd_sm.erl
 @@ -85,7 +85,7 @@
@@ -439,7 +445,7 @@ index afb95c10b..e5011ed23 100644
  -include("ejabberd_sm.hrl").
  -include("ejabberd_stacktrace.hrl").
 diff --git a/src/ejabberd_web.erl b/src/ejabberd_web.erl
-index 5cfbb93aa..8a6b0fcd4 100644
+index 5152e2b38..a2cf3c682 100644
 --- a/src/ejabberd_web.erl
 +++ b/src/ejabberd_web.erl
 @@ -33,7 +33,7 @@
@@ -452,7 +458,7 @@ index 5cfbb93aa..8a6b0fcd4 100644
  -include("ejabberd_http.hrl").
  
 diff --git a/src/ejabberd_web_admin.erl b/src/ejabberd_web_admin.erl
-index ee50a0031..f97357f2f 100644
+index ac3d4ec9b..e63231a46 100644
 --- a/src/ejabberd_web_admin.erl
 +++ b/src/ejabberd_web_admin.erl
 @@ -35,7 +35,7 @@
@@ -465,10 +471,10 @@ index ee50a0031..f97357f2f 100644
  -include("ejabberd_http.hrl").
  
 diff --git a/src/ejabberd_websocket.erl b/src/ejabberd_websocket.erl
-index 5f9d284a6..db7c53768 100644
+index 21123eb23..b9df5304b 100644
 --- a/src/ejabberd_websocket.erl
 +++ b/src/ejabberd_websocket.erl
-@@ -45,7 +45,7 @@
+@@ -46,7 +46,7 @@
  
  -include("logger.hrl").
  
@@ -478,7 +484,7 @@ index 5f9d284a6..db7c53768 100644
  -include("ejabberd_http.hrl").
  
 diff --git a/src/ejabberd_xmlrpc.erl b/src/ejabberd_xmlrpc.erl
-index 1a1ec63f4..a76216963 100644
+index 741bf8422..78f001d24 100644
 --- a/src/ejabberd_xmlrpc.erl
 +++ b/src/ejabberd_xmlrpc.erl
 @@ -39,7 +39,7 @@
@@ -490,8 +496,21 @@ index 1a1ec63f4..a76216963 100644
  
  -record(state,
  	{auth = noauth        :: noauth | map(),
+diff --git a/src/ext_mod.erl b/src/ext_mod.erl
+index 32f1f6fc8..066b40935 100644
+--- a/src/ext_mod.erl
++++ b/src/ext_mod.erl
+@@ -46,7 +46,7 @@
+ -include("ejabberd_web_admin.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(REPOS, "https://github.com/processone/ejabberd-contrib").
+ 
 diff --git a/src/gen_iq_handler.erl b/src/gen_iq_handler.erl
-index 29057435d..4fee8caf7 100644
+index 72fc0ae30..27c517493 100644
 --- a/src/gen_iq_handler.erl
 +++ b/src/gen_iq_handler.erl
 @@ -35,7 +35,7 @@
@@ -504,7 +523,7 @@ index 29057435d..4fee8caf7 100644
  -include("ejabberd_stacktrace.hrl").
  
 diff --git a/src/gen_pubsub_node.erl b/src/gen_pubsub_node.erl
-index 3f83fe48f..5545d51de 100644
+index baf0ae444..5b3fd426a 100644
 --- a/src/gen_pubsub_node.erl
 +++ b/src/gen_pubsub_node.erl
 @@ -25,7 +25,7 @@
@@ -517,7 +536,7 @@ index 3f83fe48f..5545d51de 100644
  -type(host() :: mod_pubsub:host()).
  -type(nodeId() :: mod_pubsub:nodeId()).
 diff --git a/src/gen_pubsub_nodetree.erl b/src/gen_pubsub_nodetree.erl
-index b6b73b8cb..8c2a2a4fa 100644
+index 1fd198208..821cdac45 100644
 --- a/src/gen_pubsub_nodetree.erl
 +++ b/src/gen_pubsub_nodetree.erl
 @@ -36,7 +36,7 @@
@@ -530,7 +549,7 @@ index b6b73b8cb..8c2a2a4fa 100644
  -callback terminate(Host :: host(), ServerHost :: binary()) -> atom().
  
 diff --git a/src/jd2ejd.erl b/src/jd2ejd.erl
-index 279dd6e0d..ec0b2f083 100644
+index 1a8dbb87a..390abcc8a 100644
 --- a/src/jd2ejd.erl
 +++ b/src/jd2ejd.erl
 @@ -31,7 +31,7 @@
@@ -543,10 +562,10 @@ index 279dd6e0d..ec0b2f083 100644
  %%%----------------------------------------------------------------------
  %%% API
 diff --git a/src/misc.erl b/src/misc.erl
-index 474fad615..489052bd1 100644
+index c08610524..d812865ba 100644
 --- a/src/misc.erl
 +++ b/src/misc.erl
-@@ -50,7 +50,7 @@
+@@ -51,7 +51,7 @@
  	     {encode_base64, 1}]).
  
  -include("logger.hrl").
@@ -556,7 +575,7 @@ index 474fad615..489052bd1 100644
  
  -type distance_cache() :: #{{string(), string()} => non_neg_integer()}.
 diff --git a/src/mod_adhoc.erl b/src/mod_adhoc.erl
-index 73c7d82af..6cbc99aec 100644
+index 3075366c4..2ad402cd7 100644
 --- a/src/mod_adhoc.erl
 +++ b/src/mod_adhoc.erl
 @@ -39,7 +39,7 @@
@@ -569,7 +588,7 @@ index 73c7d82af..6cbc99aec 100644
  
  start(Host, _Opts) ->
 diff --git a/src/mod_admin_extra.erl b/src/mod_admin_extra.erl
-index 9834acf01..e199f7d30 100644
+index 9b88176fb..c49d5400b 100644
 --- a/src/mod_admin_extra.erl
 +++ b/src/mod_admin_extra.erl
 @@ -85,7 +85,7 @@
@@ -582,10 +601,10 @@ index 9834acf01..e199f7d30 100644
  %%%
  %%% gen_mod
 diff --git a/src/mod_admin_update_sql.erl b/src/mod_admin_update_sql.erl
-index 02beb4bf8..9225d2bf0 100644
+index 74d30b3e3..5d7528fc5 100644
 --- a/src/mod_admin_update_sql.erl
 +++ b/src/mod_admin_update_sql.erl
-@@ -37,7 +37,7 @@
+@@ -39,7 +39,7 @@
  
  -include("logger.hrl").
  -include("ejabberd_commands.hrl").
@@ -595,7 +614,7 @@ index 02beb4bf8..9225d2bf0 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_announce.erl b/src/mod_announce.erl
-index 21213615c..d5fb38596 100644
+index 7f6df0df5..56db12f0b 100644
 --- a/src/mod_announce.erl
 +++ b/src/mod_announce.erl
 @@ -51,7 +51,7 @@
@@ -608,7 +627,7 @@ index 21213615c..d5fb38596 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_announce_mnesia.erl b/src/mod_announce_mnesia.erl
-index 068406e01..074bebc90 100644
+index e0ef13907..c5ec48921 100644
 --- a/src/mod_announce_mnesia.erl
 +++ b/src/mod_announce_mnesia.erl
 @@ -31,7 +31,7 @@
@@ -621,7 +640,7 @@ index 068406e01..074bebc90 100644
  -include("logger.hrl").
  
 diff --git a/src/mod_announce_sql.erl b/src/mod_announce_sql.erl
-index bc79fc77a..4c3052f16 100644
+index 20ec78295..2aa8b112c 100644
 --- a/src/mod_announce_sql.erl
 +++ b/src/mod_announce_sql.erl
 @@ -32,7 +32,7 @@
@@ -634,7 +653,7 @@ index bc79fc77a..4c3052f16 100644
  -include("ejabberd_sql_pt.hrl").
  -include("logger.hrl").
 diff --git a/src/mod_avatar.erl b/src/mod_avatar.erl
-index 09329853d..9f5e54e22 100644
+index 58b4a8af6..1d01e867a 100644
 --- a/src/mod_avatar.erl
 +++ b/src/mod_avatar.erl
 @@ -31,7 +31,7 @@
@@ -647,7 +666,7 @@ index 09329853d..9f5e54e22 100644
  -include("pubsub.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_block_strangers.erl b/src/mod_block_strangers.erl
-index 92f52236d..59cd8cce5 100644
+index 8595b4aa0..ba01af0f9 100644
 --- a/src/mod_block_strangers.erl
 +++ b/src/mod_block_strangers.erl
 @@ -34,7 +34,7 @@
@@ -660,7 +679,7 @@ index 92f52236d..59cd8cce5 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_blocking.erl b/src/mod_blocking.erl
-index 7d4b1bff5..853d40fe4 100644
+index 75f9aa0b9..42e7281a4 100644
 --- a/src/mod_blocking.erl
 +++ b/src/mod_blocking.erl
 @@ -33,7 +33,7 @@
@@ -673,7 +692,7 @@ index 7d4b1bff5..853d40fe4 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_bosh.erl b/src/mod_bosh.erl
-index 37a7fa809..ce57faac2 100644
+index dfe7482e3..6f5db9417 100644
 --- a/src/mod_bosh.erl
 +++ b/src/mod_bosh.erl
 @@ -40,7 +40,7 @@
@@ -686,7 +705,7 @@ index 37a7fa809..ce57faac2 100644
  -include("bosh.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_caps.erl b/src/mod_caps.erl
-index bc48dac6f..fd3b3a1ad 100644
+index 65287826c..58c573502 100644
 --- a/src/mod_caps.erl
 +++ b/src/mod_caps.erl
 @@ -54,7 +54,7 @@
@@ -699,7 +718,7 @@ index bc48dac6f..fd3b3a1ad 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_carboncopy.erl b/src/mod_carboncopy.erl
-index a4e3a7999..e53b573c8 100644
+index c9fe73b0a..ad9524428 100644
 --- a/src/mod_carboncopy.erl
 +++ b/src/mod_carboncopy.erl
 @@ -42,7 +42,7 @@
@@ -712,7 +731,7 @@ index a4e3a7999..e53b573c8 100644
  
  -type direction() :: sent | received.
 diff --git a/src/mod_client_state.erl b/src/mod_client_state.erl
-index 3585ec3a4..5ac4ad845 100644
+index 5b38560e3..5fa594eff 100644
 --- a/src/mod_client_state.erl
 +++ b/src/mod_client_state.erl
 @@ -42,7 +42,7 @@
@@ -725,7 +744,7 @@ index 3585ec3a4..5ac4ad845 100644
  
  -define(CSI_QUEUE_MAX, 100).
 diff --git a/src/mod_configure.erl b/src/mod_configure.erl
-index 32c7ebb31..b6ab8cdfe 100644
+index 3aec8e106..624e6ee8e 100644
 --- a/src/mod_configure.erl
 +++ b/src/mod_configure.erl
 @@ -39,7 +39,7 @@
@@ -738,7 +757,7 @@ index 32c7ebb31..b6ab8cdfe 100644
  -include("translate.hrl").
  -include_lib("stdlib/include/ms_transform.hrl").
 diff --git a/src/mod_conversejs.erl b/src/mod_conversejs.erl
-index 8683d60ab..2d3dfb63b 100644
+index 64e2a48d0..6b40d1ee4 100644
 --- a/src/mod_conversejs.erl
 +++ b/src/mod_conversejs.erl
 @@ -32,7 +32,7 @@
@@ -751,7 +770,7 @@ index 8683d60ab..2d3dfb63b 100644
  -include("ejabberd_http.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_delegation.erl b/src/mod_delegation.erl
-index 3ae3b8a51..93c1e78d6 100644
+index 919c53a7b..c84d4a062 100644
 --- a/src/mod_delegation.erl
 +++ b/src/mod_delegation.erl
 @@ -42,7 +42,7 @@
@@ -764,7 +783,7 @@ index 3ae3b8a51..93c1e78d6 100644
  
  -type route_type() :: ejabberd_sm | ejabberd_local.
 diff --git a/src/mod_disco.erl b/src/mod_disco.erl
-index deb9d15a2..c8788a77c 100644
+index 2b77cf762..0d8cd4749 100644
 --- a/src/mod_disco.erl
 +++ b/src/mod_disco.erl
 @@ -42,7 +42,7 @@
@@ -777,7 +796,7 @@ index deb9d15a2..c8788a77c 100644
  -include("mod_roster.hrl").
  
 diff --git a/src/mod_fail2ban.erl b/src/mod_fail2ban.erl
-index 8751653d8..901f71fc2 100644
+index cd5fb07fc..8d09b2f15 100644
 --- a/src/mod_fail2ban.erl
 +++ b/src/mod_fail2ban.erl
 @@ -42,7 +42,7 @@
@@ -789,12 +808,25 @@ index 8751653d8..901f71fc2 100644
  -include("translate.hrl").
  
  -define(CLEAN_INTERVAL, timer:minutes(10)).
+diff --git a/src/mod_host_meta.erl b/src/mod_host_meta.erl
+index e1f7f141b..357dc7661 100644
+--- a/src/mod_host_meta.erl
++++ b/src/mod_host_meta.erl
+@@ -38,7 +38,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
 diff --git a/src/mod_http_api.erl b/src/mod_http_api.erl
-index 427833584..6ee1fcb72 100644
+index 514a8632c..62030a16f 100644
 --- a/src/mod_http_api.erl
 +++ b/src/mod_http_api.erl
-@@ -32,7 +32,7 @@
- -export([start/2, stop/1, reload/3, process/2, depends/2,
+@@ -33,7 +33,7 @@
+          format_arg/2,
  	 mod_options/1, mod_doc/0]).
  
 --include_lib("xmpp/include/xmpp.hrl").
@@ -803,7 +835,7 @@ index 427833584..6ee1fcb72 100644
  -include("ejabberd_http.hrl").
  -include("ejabberd_stacktrace.hrl").
 diff --git a/src/mod_http_upload.erl b/src/mod_http_upload.erl
-index 1ff94eb4a..ce1a667e2 100644
+index 4efce9c5c..53072cd1e 100644
 --- a/src/mod_http_upload.erl
 +++ b/src/mod_http_upload.erl
 @@ -87,7 +87,7 @@
@@ -816,7 +848,7 @@ index 1ff94eb4a..ce1a667e2 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_http_upload_quota.erl b/src/mod_http_upload_quota.erl
-index 5ed7fcefb..4fc591ca5 100644
+index 7c2742280..b803e34e0 100644
 --- a/src/mod_http_upload_quota.erl
 +++ b/src/mod_http_upload_quota.erl
 @@ -51,7 +51,7 @@
@@ -829,7 +861,7 @@ index 5ed7fcefb..4fc591ca5 100644
  -include("translate.hrl").
  -include_lib("kernel/include/file.hrl").
 diff --git a/src/mod_jidprep.erl b/src/mod_jidprep.erl
-index c666f8544..b533a2f4f 100644
+index c1b2ad1ec..029be581d 100644
 --- a/src/mod_jidprep.erl
 +++ b/src/mod_jidprep.erl
 @@ -41,7 +41,7 @@
@@ -842,7 +874,7 @@ index c666f8544..b533a2f4f 100644
  %%--------------------------------------------------------------------
  %% gen_mod callbacks.
 diff --git a/src/mod_last.erl b/src/mod_last.erl
-index a7d36c791..649a94698 100644
+index be7abd561..a23346f1a 100644
 --- a/src/mod_last.erl
 +++ b/src/mod_last.erl
 @@ -38,7 +38,7 @@
@@ -855,7 +887,7 @@ index a7d36c791..649a94698 100644
  -include("mod_last.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_legacy_auth.erl b/src/mod_legacy_auth.erl
-index 2b29b4cd2..ba13a24a8 100644
+index 98daa18ad..d2239ce2b 100644
 --- a/src/mod_legacy_auth.erl
 +++ b/src/mod_legacy_auth.erl
 @@ -29,7 +29,7 @@
@@ -868,12 +900,12 @@ index 2b29b4cd2..ba13a24a8 100644
  
  -type c2s_state() :: ejabberd_c2s:state().
 diff --git a/src/mod_mam.erl b/src/mod_mam.erl
-index 9bf154f58..444655727 100644
+index 7c40b17fc..3ba1448e8 100644
 --- a/src/mod_mam.erl
 +++ b/src/mod_mam.erl
-@@ -45,7 +45,7 @@
- 	 is_empty_for_user/2, is_empty_for_room/3, check_create_room/4,
- 	 process_iq/3, store_mam_message/7, make_id/0, wrap_as_mucsub/2, select/7]).
+@@ -48,7 +48,7 @@
+ 	 delete_old_messages_batch/5, delete_old_messages_status/1, delete_old_messages_abort/1,
+ 	 remove_message_from_archive/3]).
  
 --include_lib("xmpp/include/xmpp.hrl").
 +-include_lib("p1_xmpp/include/xmpp.hrl").
@@ -881,11 +913,11 @@ index 9bf154f58..444655727 100644
  -include("mod_muc_room.hrl").
  -include("ejabberd_commands.hrl").
 diff --git a/src/mod_mam_mnesia.erl b/src/mod_mam_mnesia.erl
-index d21d0e6ce..9dfc6d9e0 100644
+index f9e366860..c7340d0a9 100644
 --- a/src/mod_mam_mnesia.erl
 +++ b/src/mod_mam_mnesia.erl
 @@ -32,7 +32,7 @@
- 	 is_empty_for_user/2, is_empty_for_room/3]).
+ 	 is_empty_for_user/2, is_empty_for_room/3, delete_old_messages_batch/5]).
  
  -include_lib("stdlib/include/ms_transform.hrl").
 --include_lib("xmpp/include/xmpp.hrl").
@@ -894,11 +926,11 @@ index d21d0e6ce..9dfc6d9e0 100644
  -include("mod_mam.hrl").
  
 diff --git a/src/mod_mam_sql.erl b/src/mod_mam_sql.erl
-index 269b4c963..b81da5b0c 100644
+index b21e84a7b..626b87d65 100644
 --- a/src/mod_mam_sql.erl
 +++ b/src/mod_mam_sql.erl
-@@ -33,7 +33,7 @@
- 	 is_empty_for_user/2, is_empty_for_room/3, select_with_mucsub/6]).
+@@ -34,7 +34,7 @@
+ 	 delete_old_messages_batch/4, count_messages_to_delete/3]).
  
  -include_lib("stdlib/include/ms_transform.hrl").
 --include_lib("xmpp/include/xmpp.hrl").
@@ -907,7 +939,7 @@ index 269b4c963..b81da5b0c 100644
  -include("logger.hrl").
  -include("ejabberd_sql_pt.hrl").
 diff --git a/src/mod_metrics.erl b/src/mod_metrics.erl
-index d42f79112..de32aebef 100644
+index e3dd397f7..df333038a 100644
 --- a/src/mod_metrics.erl
 +++ b/src/mod_metrics.erl
 @@ -29,7 +29,7 @@
@@ -920,7 +952,7 @@ index d42f79112..de32aebef 100644
  
  -export([start/2, stop/1, mod_opt_type/1, mod_options/1, depends/2, reload/3]).
 diff --git a/src/mod_mix.erl b/src/mod_mix.erl
-index 002ef5696..57de16a7a 100644
+index 7066911b9..51ed5e1fb 100644
 --- a/src/mod_mix.erl
 +++ b/src/mod_mix.erl
 @@ -41,7 +41,7 @@
@@ -933,20 +965,33 @@ index 002ef5696..57de16a7a 100644
  -include("translate.hrl").
  -include("ejabberd_stacktrace.hrl").
 diff --git a/src/mod_mix_pam.erl b/src/mod_mix_pam.erl
-index 1fa5c1861..e27578028 100644
+index 7bd6f2a71..a5bc5860f 100644
 --- a/src/mod_mix_pam.erl
 +++ b/src/mod_mix_pam.erl
-@@ -33,7 +33,7 @@
- 	 remove_user/2,
- 	 process_iq/1]).
+@@ -36,7 +36,7 @@
+ 	 webadmin_user/4,
+ 	 webadmin_page/3]).
  
 --include_lib("xmpp/include/xmpp.hrl").
 +-include_lib("p1_xmpp/include/xmpp.hrl").
  -include("logger.hrl").
+ -include("mod_roster.hrl").
  -include("translate.hrl").
+diff --git a/src/mod_mqtt_bridge_session.erl b/src/mod_mqtt_bridge_session.erl
+index 7d38632d4..0627fb55f 100644
+--- a/src/mod_mqtt_bridge_session.erl
++++ b/src/mod_mqtt_bridge_session.erl
+@@ -28,7 +28,7 @@
  
+ -include("logger.hrl").
+ -include("mqtt.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("public_key/include/public_key.hrl").
+ 
+ -type error_reason() ::
 diff --git a/src/mod_mqtt_session.erl b/src/mod_mqtt_session.erl
-index ca025e3d2..a541e1fb0 100644
+index 37ea8ce02..e88ea64fa 100644
 --- a/src/mod_mqtt_session.erl
 +++ b/src/mod_mqtt_session.erl
 @@ -28,7 +28,7 @@
@@ -955,11 +1000,11 @@ index ca025e3d2..a541e1fb0 100644
  -include("mqtt.hrl").
 --include_lib("xmpp/include/xmpp.hrl").
 +-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("public_key/include/public_key.hrl").
  
  -record(state, {vsn = ?VSN            :: integer(),
-                 version               :: undefined | mqtt_version(),
 diff --git a/src/mod_mqtt_ws.erl b/src/mod_mqtt_ws.erl
-index 01f182d30..b0a2ecdbd 100644
+index 236f0b2d7..7c1f91561 100644
 --- a/src/mod_mqtt_ws.erl
 +++ b/src/mod_mqtt_ws.erl
 @@ -29,7 +29,7 @@
@@ -972,10 +1017,10 @@ index 01f182d30..b0a2ecdbd 100644
  -include("logger.hrl").
  
 diff --git a/src/mod_muc.erl b/src/mod_muc.erl
-index b2ebc5c61..59c856466 100644
+index e1da09a7e..3a8c45108 100644
 --- a/src/mod_muc.erl
 +++ b/src/mod_muc.erl
-@@ -77,7 +77,7 @@
+@@ -79,7 +79,7 @@
  	 mod_opt_type/1, mod_options/1, depends/2]).
  
  -include("logger.hrl").
@@ -985,11 +1030,11 @@ index b2ebc5c61..59c856466 100644
  -include("mod_muc_room.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_muc_admin.erl b/src/mod_muc_admin.erl
-index ce4665d7e..ef3f5dcc3 100644
+index 234f065d3..3c10fecaf 100644
 --- a/src/mod_muc_admin.erl
 +++ b/src/mod_muc_admin.erl
-@@ -44,7 +44,7 @@
- 	 web_page_host/3, mod_options/1, get_commands_spec/0, find_hosts/1]).
+@@ -49,7 +49,7 @@
+ 	 get_room_pid/2, get_room_history/2]).
  
  -include("logger.hrl").
 --include_lib("xmpp/include/xmpp.hrl").
@@ -998,7 +1043,7 @@ index ce4665d7e..ef3f5dcc3 100644
  -include("mod_muc_room.hrl").
  -include("ejabberd_http.hrl").
 diff --git a/src/mod_muc_log.erl b/src/mod_muc_log.erl
-index 8bcbc8bc0..36d9a5206 100644
+index 9e724de32..24d57a343 100644
 --- a/src/mod_muc_log.erl
 +++ b/src/mod_muc_log.erl
 @@ -42,7 +42,7 @@
@@ -1011,7 +1056,7 @@ index 8bcbc8bc0..36d9a5206 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_muc_mnesia.erl b/src/mod_muc_mnesia.erl
-index c822acc68..3847add23 100644
+index 4a5192d2f..ba45a2775 100644
 --- a/src/mod_muc_mnesia.erl
 +++ b/src/mod_muc_mnesia.erl
 @@ -44,7 +44,7 @@
@@ -1024,10 +1069,10 @@ index c822acc68..3847add23 100644
  
  -record(state, {}).
 diff --git a/src/mod_muc_room.erl b/src/mod_muc_room.erl
-index e8b0d1bce..7b1f5ff4c 100644
+index f66e32036..6a5189efa 100644
 --- a/src/mod_muc_room.erl
 +++ b/src/mod_muc_room.erl
-@@ -68,7 +68,7 @@
+@@ -71,7 +71,7 @@
  	 code_change/4]).
  
  -include("logger.hrl").
@@ -1036,11 +1081,24 @@ index e8b0d1bce..7b1f5ff4c 100644
  -include("translate.hrl").
  -include("mod_muc_room.hrl").
  -include("ejabberd_stacktrace.hrl").
+diff --git a/src/mod_muc_rtbl.erl b/src/mod_muc_rtbl.erl
+index d5fe3bbfd..e2c501e7c 100644
+--- a/src/mod_muc_rtbl.erl
++++ b/src/mod_muc_rtbl.erl
+@@ -27,7 +27,7 @@
+ 
+ -behaviour(gen_mod).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ -include("mod_muc_room.hrl").
 diff --git a/src/mod_muc_sql.erl b/src/mod_muc_sql.erl
-index 1310cde7b..2c8b87d7e 100644
+index 1c72a5bd2..6f8425241 100644
 --- a/src/mod_muc_sql.erl
 +++ b/src/mod_muc_sql.erl
-@@ -42,7 +42,7 @@
+@@ -43,7 +43,7 @@
  -export([set_affiliation/6, set_affiliations/4, get_affiliation/5,
  	 get_affiliations/3, search_affiliation/4]).
  
@@ -1050,7 +1108,7 @@ index 1310cde7b..2c8b87d7e 100644
  -include("logger.hrl").
  -include("ejabberd_sql_pt.hrl").
 diff --git a/src/mod_multicast.erl b/src/mod_multicast.erl
-index fa076da70..b9ea7ce32 100644
+index 9b418049a..5f84feb33 100644
 --- a/src/mod_multicast.erl
 +++ b/src/mod_multicast.erl
 @@ -45,7 +45,7 @@
@@ -1063,7 +1121,7 @@ index fa076da70..b9ea7ce32 100644
  -record(multicastc, {rserver :: binary(),
  		     response,
 diff --git a/src/mod_offline.erl b/src/mod_offline.erl
-index 1d367eb72..2a7a623e2 100644
+index 4840ced5f..629b4d15a 100644
 --- a/src/mod_offline.erl
 +++ b/src/mod_offline.erl
 @@ -69,7 +69,7 @@
@@ -1076,11 +1134,11 @@ index 1d367eb72..2a7a623e2 100644
  -include("ejabberd_http.hrl").
  
 diff --git a/src/mod_offline_mnesia.erl b/src/mod_offline_mnesia.erl
-index a3c902fb3..4cb328d2a 100644
+index 2cd511dfa..a7bb30812 100644
 --- a/src/mod_offline_mnesia.erl
 +++ b/src/mod_offline_mnesia.erl
-@@ -32,7 +32,7 @@
- 	 remove_all_messages/2, count_messages/2, import/1]).
+@@ -33,7 +33,7 @@
+ 	 remove_old_messages_batch/4]).
  -export([need_transform/1, transform/1]).
  
 --include_lib("xmpp/include/xmpp.hrl").
@@ -1089,12 +1147,12 @@ index a3c902fb3..4cb328d2a 100644
  -include("logger.hrl").
  
 diff --git a/src/mod_offline_sql.erl b/src/mod_offline_sql.erl
-index 4e8441b7f..9d4170725 100644
+index a3b9d0545..bad4e45f2 100644
 --- a/src/mod_offline_sql.erl
 +++ b/src/mod_offline_sql.erl
 @@ -32,7 +32,7 @@
  	 read_message/3, remove_message/3, read_all_messages/2,
- 	 remove_all_messages/2, count_messages/2, import/1, export/1]).
+ 	 remove_all_messages/2, count_messages/2, import/1, export/1, remove_old_messages_batch/3]).
  
 --include_lib("xmpp/include/xmpp.hrl").
 +-include_lib("p1_xmpp/include/xmpp.hrl").
@@ -1102,7 +1160,7 @@ index 4e8441b7f..9d4170725 100644
  -include("logger.hrl").
  -include("ejabberd_sql_pt.hrl").
 diff --git a/src/mod_ping.erl b/src/mod_ping.erl
-index f233b2ae8..b528040d1 100644
+index 9ac6e9bad..7b50b68c8 100644
 --- a/src/mod_ping.erl
 +++ b/src/mod_ping.erl
 @@ -35,7 +35,7 @@
@@ -1115,7 +1173,7 @@ index f233b2ae8..b528040d1 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_pres_counter.erl b/src/mod_pres_counter.erl
-index 77f42961f..066e5ce4f 100644
+index 7359260bc..3772f2a9c 100644
 --- a/src/mod_pres_counter.erl
 +++ b/src/mod_pres_counter.erl
 @@ -32,7 +32,7 @@
@@ -1128,7 +1186,7 @@ index 77f42961f..066e5ce4f 100644
  -record(pres_counter,
  	{dir, start, count, logged = false}).
 diff --git a/src/mod_privacy.erl b/src/mod_privacy.erl
-index 5ac26c2f5..e8971af65 100644
+index 37f1eb8bc..e2d0ee04d 100644
 --- a/src/mod_privacy.erl
 +++ b/src/mod_privacy.erl
 @@ -41,7 +41,7 @@
@@ -1141,7 +1199,7 @@ index 5ac26c2f5..e8971af65 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_privacy_mnesia.erl b/src/mod_privacy_mnesia.erl
-index 2f9cb0027..d90f30eb8 100644
+index 78eeb9b82..cf0cbc754 100644
 --- a/src/mod_privacy_mnesia.erl
 +++ b/src/mod_privacy_mnesia.erl
 @@ -32,7 +32,7 @@
@@ -1154,7 +1212,7 @@ index 2f9cb0027..d90f30eb8 100644
  -include("logger.hrl").
  
 diff --git a/src/mod_privacy_sql.erl b/src/mod_privacy_sql.erl
-index b27442724..234e59061 100644
+index 10ec92e0b..241fa6792 100644
 --- a/src/mod_privacy_sql.erl
 +++ b/src/mod_privacy_sql.erl
 @@ -34,7 +34,7 @@
@@ -1167,7 +1225,7 @@ index b27442724..234e59061 100644
  -include("logger.hrl").
  -include("ejabberd_sql_pt.hrl").
 diff --git a/src/mod_private.erl b/src/mod_private.erl
-index 436aae222..56bfd4b07 100644
+index 52768291d..304dc5c25 100644
 --- a/src/mod_private.erl
 +++ b/src/mod_private.erl
 @@ -40,7 +40,7 @@
@@ -1180,7 +1238,7 @@ index 436aae222..56bfd4b07 100644
  -include("ejabberd_commands.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_private_mnesia.erl b/src/mod_private_mnesia.erl
-index b5617d96e..fd4ba657b 100644
+index e3619dc2a..3828989d7 100644
 --- a/src/mod_private_mnesia.erl
 +++ b/src/mod_private_mnesia.erl
 @@ -31,7 +31,7 @@
@@ -1193,7 +1251,7 @@ index b5617d96e..fd4ba657b 100644
  -include("logger.hrl").
  
 diff --git a/src/mod_private_sql.erl b/src/mod_private_sql.erl
-index 08a13e8a4..511cd5c63 100644
+index a1bb38c82..07772c036 100644
 --- a/src/mod_private_sql.erl
 +++ b/src/mod_private_sql.erl
 @@ -29,7 +29,7 @@
@@ -1206,7 +1264,7 @@ index 08a13e8a4..511cd5c63 100644
  -include("ejabberd_sql_pt.hrl").
  -include("logger.hrl").
 diff --git a/src/mod_privilege.erl b/src/mod_privilege.erl
-index 353a8da27..50be843ac 100644
+index 3862b33c7..9d6b290c9 100644
 --- a/src/mod_privilege.erl
 +++ b/src/mod_privilege.erl
 @@ -41,7 +41,7 @@
@@ -1219,7 +1277,7 @@ index 353a8da27..50be843ac 100644
  
  -type roster_permission() :: both | get | set.
 diff --git a/src/mod_proxy65_service.erl b/src/mod_proxy65_service.erl
-index 78a8d85d2..98d9987db 100644
+index 297c59bb6..124c47490 100644
 --- a/src/mod_proxy65_service.erl
 +++ b/src/mod_proxy65_service.erl
 @@ -38,7 +38,7 @@
@@ -1232,7 +1290,7 @@ index 78a8d85d2..98d9987db 100644
  -include("ejabberd_stacktrace.hrl").
  
 diff --git a/src/mod_pubsub.erl b/src/mod_pubsub.erl
-index 76092f1c6..0b55cd7fc 100644
+index b8f4c4905..071bb3327 100644
 --- a/src/mod_pubsub.erl
 +++ b/src/mod_pubsub.erl
 @@ -40,7 +40,7 @@
@@ -1245,7 +1303,7 @@ index 76092f1c6..0b55cd7fc 100644
  -include("mod_roster.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_push.erl b/src/mod_push.erl
-index 5477c5792..eab812226 100644
+index c911bb6ac..117c6bd49 100644
 --- a/src/mod_push.erl
 +++ b/src/mod_push.erl
 @@ -51,7 +51,7 @@
@@ -1258,7 +1316,7 @@ index 5477c5792..eab812226 100644
  
  -define(PUSH_CACHE, push_cache).
 diff --git a/src/mod_push_keepalive.erl b/src/mod_push_keepalive.erl
-index e0e83f1e1..c57f2404a 100644
+index 9463ec7d9..bcdfb516f 100644
 --- a/src/mod_push_keepalive.erl
 +++ b/src/mod_push_keepalive.erl
 @@ -36,7 +36,7 @@
@@ -1271,7 +1329,7 @@ index e0e83f1e1..c57f2404a 100644
  
  -define(PUSH_BEFORE_TIMEOUT_PERIOD, 120000). % 2 minutes.
 diff --git a/src/mod_push_mnesia.erl b/src/mod_push_mnesia.erl
-index 665ab48f2..0e17d11f2 100644
+index 4e3baa342..f982991f2 100644
 --- a/src/mod_push_mnesia.erl
 +++ b/src/mod_push_mnesia.erl
 @@ -35,7 +35,7 @@
@@ -1284,7 +1342,7 @@ index 665ab48f2..0e17d11f2 100644
  
  %%%-------------------------------------------------------------------
 diff --git a/src/mod_push_sql.erl b/src/mod_push_sql.erl
-index c024a12d1..a87f33f47 100644
+index 7a433a57d..43e8dbb19 100644
 --- a/src/mod_push_sql.erl
 +++ b/src/mod_push_sql.erl
 @@ -31,7 +31,7 @@
@@ -1297,7 +1355,7 @@ index c024a12d1..a87f33f47 100644
  -include("ejabberd_sql_pt.hrl").
  -include("mod_push.hrl").
 diff --git a/src/mod_register.erl b/src/mod_register.erl
-index b85efd57c..890852821 100644
+index 7b05d4fff..45dac2ca0 100644
 --- a/src/mod_register.erl
 +++ b/src/mod_register.erl
 @@ -40,7 +40,7 @@
@@ -1310,7 +1368,7 @@ index b85efd57c..890852821 100644
  
  start(Host, _Opts) ->
 diff --git a/src/mod_register_web.erl b/src/mod_register_web.erl
-index 0cf4bcff8..43a123ead 100644
+index 03e35cbf4..cea523fae 100644
 --- a/src/mod_register_web.erl
 +++ b/src/mod_register_web.erl
 @@ -34,7 +34,7 @@
@@ -1323,7 +1381,7 @@ index 0cf4bcff8..43a123ead 100644
  -include("ejabberd_http.hrl").
  
 diff --git a/src/mod_roster.erl b/src/mod_roster.erl
-index 94cae4950..8c9206e4b 100644
+index 7ea3dac81..1a9933a8f 100644
 --- a/src/mod_roster.erl
 +++ b/src/mod_roster.erl
 @@ -54,7 +54,7 @@
@@ -1336,7 +1394,7 @@ index 94cae4950..8c9206e4b 100644
  -include("ejabberd_http.hrl").
  -include("ejabberd_web_admin.hrl").
 diff --git a/src/mod_roster_mnesia.erl b/src/mod_roster_mnesia.erl
-index fa1d52f7c..ced28ce60 100644
+index 3ef93a4dc..d74cb7640 100644
 --- a/src/mod_roster_mnesia.erl
 +++ b/src/mod_roster_mnesia.erl
 @@ -37,7 +37,7 @@
@@ -1349,7 +1407,7 @@ index fa1d52f7c..ced28ce60 100644
  %%%===================================================================
  %%% API
 diff --git a/src/mod_roster_sql.erl b/src/mod_roster_sql.erl
-index ebfcde463..3510b4624 100644
+index 67d9697f7..a8462f5ff 100644
 --- a/src/mod_roster_sql.erl
 +++ b/src/mod_roster_sql.erl
 @@ -38,7 +38,7 @@
@@ -1362,7 +1420,7 @@ index ebfcde463..3510b4624 100644
  %%%===================================================================
  %%% API
 diff --git a/src/mod_s2s_dialback.erl b/src/mod_s2s_dialback.erl
-index 05747e3bc..e2bdc847e 100644
+index cd0a9b8f6..2ddd8a9f5 100644
 --- a/src/mod_s2s_dialback.erl
 +++ b/src/mod_s2s_dialback.erl
 @@ -33,7 +33,7 @@
@@ -1375,7 +1433,7 @@ index 05747e3bc..e2bdc847e 100644
  -include("translate.hrl").
  
 diff --git a/src/mod_service_log.erl b/src/mod_service_log.erl
-index f5f23eeb0..e8beaac9a 100644
+index c387ce04c..4cc818434 100644
 --- a/src/mod_service_log.erl
 +++ b/src/mod_service_log.erl
 @@ -34,7 +34,7 @@
@@ -1388,7 +1446,7 @@ index f5f23eeb0..e8beaac9a 100644
  start(Host, _Opts) ->
      ejabberd_hooks:add(user_send_packet, Host, ?MODULE,
 diff --git a/src/mod_shared_roster.erl b/src/mod_shared_roster.erl
-index 13ff90466..46fbbd535 100644
+index 579992739..700b0c89c 100644
 --- a/src/mod_shared_roster.erl
 +++ b/src/mod_shared_roster.erl
 @@ -43,7 +43,7 @@
@@ -1401,7 +1459,7 @@ index 13ff90466..46fbbd535 100644
  -include("mod_roster.hrl").
  
 diff --git a/src/mod_shared_roster_ldap.erl b/src/mod_shared_roster_ldap.erl
-index 08fbe8793..8f6cff118 100644
+index 7c97ce011..5aaf6ff53 100644
 --- a/src/mod_shared_roster_ldap.erl
 +++ b/src/mod_shared_roster_ldap.erl
 @@ -43,7 +43,7 @@
@@ -1414,7 +1472,7 @@ index 08fbe8793..8f6cff118 100644
  -include("eldap.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_shared_roster_mnesia.erl b/src/mod_shared_roster_mnesia.erl
-index 484df0cd5..60a45941a 100644
+index 447fa174d..8d700bbe7 100644
 --- a/src/mod_shared_roster_mnesia.erl
 +++ b/src/mod_shared_roster_mnesia.erl
 @@ -37,7 +37,7 @@
@@ -1427,7 +1485,7 @@ index 484df0cd5..60a45941a 100644
  %%%===================================================================
  %%% API
 diff --git a/src/mod_shared_roster_sql.erl b/src/mod_shared_roster_sql.erl
-index 0d44dce69..0aacf03e8 100644
+index d921e5474..a4f3cfb03 100644
 --- a/src/mod_shared_roster_sql.erl
 +++ b/src/mod_shared_roster_sql.erl
 @@ -35,7 +35,7 @@
@@ -1440,7 +1498,7 @@ index 0d44dce69..0aacf03e8 100644
  -include("mod_shared_roster.hrl").
  -include("ejabberd_sql_pt.hrl").
 diff --git a/src/mod_sic.erl b/src/mod_sic.erl
-index 4eeb8fd08..2ad4ce5a6 100644
+index 94f82e10b..5a2389e7c 100644
 --- a/src/mod_sic.erl
 +++ b/src/mod_sic.erl
 @@ -35,7 +35,7 @@
@@ -1453,7 +1511,7 @@ index 4eeb8fd08..2ad4ce5a6 100644
  
  start(Host, _Opts) ->
 diff --git a/src/mod_sip.erl b/src/mod_sip.erl
-index 6ea2a408f..3bc901035 100644
+index 13fcfa6c4..7abdf1023 100644
 --- a/src/mod_sip.erl
 +++ b/src/mod_sip.erl
 @@ -55,7 +55,7 @@ mod_doc() ->
@@ -1466,7 +1524,7 @@ index 6ea2a408f..3bc901035 100644
  %%%===================================================================
  %%% API
 diff --git a/src/mod_sip_proxy.erl b/src/mod_sip_proxy.erl
-index ddfefb1ad..e1c8a734f 100644
+index dbd17a9d6..70d861e12 100644
 --- a/src/mod_sip_proxy.erl
 +++ b/src/mod_sip_proxy.erl
 @@ -39,7 +39,7 @@
@@ -1479,7 +1537,7 @@ index ddfefb1ad..e1c8a734f 100644
  -define(SIGN_LIFETIME, 300). %% in seconds.
  
 diff --git a/src/mod_sip_registrar.erl b/src/mod_sip_registrar.erl
-index 5079aebf0..73a5a5168 100644
+index 970a45256..825478840 100644
 --- a/src/mod_sip_registrar.erl
 +++ b/src/mod_sip_registrar.erl
 @@ -41,7 +41,7 @@
@@ -1492,7 +1550,7 @@ index 5079aebf0..73a5a5168 100644
  -define(CALL_TIMEOUT, timer:seconds(30)).
  -define(DEFAULT_EXPIRES, 3600).
 diff --git a/src/mod_stats.erl b/src/mod_stats.erl
-index c61fe6175..b73227582 100644
+index 492a486b9..79163f03a 100644
 --- a/src/mod_stats.erl
 +++ b/src/mod_stats.erl
 @@ -35,7 +35,7 @@
@@ -1505,7 +1563,7 @@ index c61fe6175..b73227582 100644
  
  start(Host, _Opts) ->
 diff --git a/src/mod_stream_mgmt.erl b/src/mod_stream_mgmt.erl
-index f60f6722b..b5d2def60 100644
+index 7b02b2e48..737f81219 100644
 --- a/src/mod_stream_mgmt.erl
 +++ b/src/mod_stream_mgmt.erl
 @@ -37,7 +37,7 @@
@@ -1518,7 +1576,7 @@ index f60f6722b..b5d2def60 100644
  -include_lib("p1_utils/include/p1_queue.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_stun_disco.erl b/src/mod_stun_disco.erl
-index 6e7592453..203ac735e 100644
+index 9f77cc1a8..085048017 100644
 --- a/src/mod_stun_disco.erl
 +++ b/src/mod_stun_disco.erl
 @@ -55,7 +55,7 @@
@@ -1531,7 +1589,7 @@ index 6e7592453..203ac735e 100644
  -define(STUN_MODULE, ejabberd_stun).
  
 diff --git a/src/mod_time.erl b/src/mod_time.erl
-index 4ec3cd64e..9b2072ad5 100644
+index c954761c2..659c767fa 100644
 --- a/src/mod_time.erl
 +++ b/src/mod_time.erl
 @@ -36,7 +36,7 @@
@@ -1544,10 +1602,10 @@ index 4ec3cd64e..9b2072ad5 100644
  
  start(Host, _Opts) ->
 diff --git a/src/mod_vcard.erl b/src/mod_vcard.erl
-index 8e0d32a4a..e4687c61e 100644
+index 87bb22080..a6bc0fa0f 100644
 --- a/src/mod_vcard.erl
 +++ b/src/mod_vcard.erl
-@@ -44,7 +44,7 @@
+@@ -45,7 +45,7 @@
  -export([route/1]).
  
  -include("logger.hrl").
@@ -1557,7 +1615,7 @@ index 8e0d32a4a..e4687c61e 100644
  -include("translate.hrl").
  -include("ejabberd_stacktrace.hrl").
 diff --git a/src/mod_vcard_ldap.erl b/src/mod_vcard_ldap.erl
-index bc6e7ebca..955489475 100644
+index b07a83cfc..29dcb5226 100644
 --- a/src/mod_vcard_ldap.erl
 +++ b/src/mod_vcard_ldap.erl
 @@ -40,7 +40,7 @@
@@ -1570,7 +1628,7 @@ index bc6e7ebca..955489475 100644
  
  -define(PROCNAME, ejabberd_mod_vcard_ldap).
 diff --git a/src/mod_vcard_mnesia.erl b/src/mod_vcard_mnesia.erl
-index ad4be701c..d0dafc10d 100644
+index f877f91bd..0bbe993c0 100644
 --- a/src/mod_vcard_mnesia.erl
 +++ b/src/mod_vcard_mnesia.erl
 @@ -33,7 +33,7 @@
@@ -1583,7 +1641,7 @@ index ad4be701c..d0dafc10d 100644
  -include("logger.hrl").
  -include("translate.hrl").
 diff --git a/src/mod_vcard_sql.erl b/src/mod_vcard_sql.erl
-index 620c1b4b5..8e8ea10ff 100644
+index 7d1c00e11..d770baa6a 100644
 --- a/src/mod_vcard_sql.erl
 +++ b/src/mod_vcard_sql.erl
 @@ -32,7 +32,7 @@
@@ -1596,7 +1654,7 @@ index 620c1b4b5..8e8ea10ff 100644
  -include("logger.hrl").
  -include("ejabberd_sql_pt.hrl").
 diff --git a/src/mod_vcard_xupdate.erl b/src/mod_vcard_xupdate.erl
-index 59ebc7f71..fd75decd4 100644
+index d169b78f4..4f244c587 100644
 --- a/src/mod_vcard_xupdate.erl
 +++ b/src/mod_vcard_xupdate.erl
 @@ -37,7 +37,7 @@
@@ -1609,7 +1667,7 @@ index 59ebc7f71..fd75decd4 100644
  
  -define(VCARD_XUPDATE_CACHE, vcard_xupdate_cache).
 diff --git a/src/mod_version.erl b/src/mod_version.erl
-index 9aa93829d..aa89e8253 100644
+index 64b7ba278..5caa4231d 100644
 --- a/src/mod_version.erl
 +++ b/src/mod_version.erl
 @@ -35,7 +35,7 @@
@@ -1622,7 +1680,7 @@ index 9aa93829d..aa89e8253 100644
  
  start(Host, _Opts) ->
 diff --git a/src/node_flat.erl b/src/node_flat.erl
-index 55dea0d8d..0dada8e22 100644
+index c64adb3ef..d94a84734 100644
 --- a/src/node_flat.erl
 +++ b/src/node_flat.erl
 @@ -34,7 +34,7 @@
@@ -1635,7 +1693,7 @@ index 55dea0d8d..0dada8e22 100644
  -export([init/3, terminate/2, options/0, features/0,
      create_node_permission/6, create_node/2, delete_node/1,
 diff --git a/src/node_flat_sql.erl b/src/node_flat_sql.erl
-index f9c8a209d..9d33f0376 100644
+index 9a98fed65..66c690bf7 100644
 --- a/src/node_flat_sql.erl
 +++ b/src/node_flat_sql.erl
 @@ -35,7 +35,7 @@
@@ -1648,7 +1706,7 @@ index f9c8a209d..9d33f0376 100644
  -include("translate.hrl").
  
 diff --git a/src/nodetree_tree.erl b/src/nodetree_tree.erl
-index 853c1fb93..28ad2520d 100644
+index ea8d35c50..361a3734b 100644
 --- a/src/nodetree_tree.erl
 +++ b/src/nodetree_tree.erl
 @@ -41,7 +41,7 @@
@@ -1661,7 +1719,7 @@ index 853c1fb93..28ad2520d 100644
  
  -export([init/3, terminate/2, options/0, set_node/1,
 diff --git a/src/nodetree_tree_sql.erl b/src/nodetree_tree_sql.erl
-index 402c50901..d5f82c88c 100644
+index ccb2b0e2a..6722cf44f 100644
 --- a/src/nodetree_tree_sql.erl
 +++ b/src/nodetree_tree_sql.erl
 @@ -39,7 +39,7 @@
@@ -1674,7 +1732,7 @@ index 402c50901..d5f82c88c 100644
  -include("translate.hrl").
  
 diff --git a/src/prosody2ejabberd.erl b/src/prosody2ejabberd.erl
-index 3992a4034..d0d186015 100644
+index 951993cc0..8582d4537 100644
 --- a/src/prosody2ejabberd.erl
 +++ b/src/prosody2ejabberd.erl
 @@ -27,8 +27,8 @@
@@ -1689,7 +1747,7 @@ index 3992a4034..d0d186015 100644
  -include("mod_roster.hrl").
  -include("mod_offline.hrl").
 diff --git a/src/pubsub_subscription.erl b/src/pubsub_subscription.erl
-index 92d6d314d..716a29962 100644
+index db947bb64..23e87e054 100644
 --- a/src/pubsub_subscription.erl
 +++ b/src/pubsub_subscription.erl
 @@ -38,7 +38,7 @@
@@ -1702,7 +1760,7 @@ index 92d6d314d..716a29962 100644
  
  -define(PUBSUB_DELIVER, <<"pubsub#deliver">>).
 diff --git a/src/pubsub_subscription_sql.erl b/src/pubsub_subscription_sql.erl
-index c36934f50..8eb6f4db1 100644
+index 839d1589c..dc336a340 100644
 --- a/src/pubsub_subscription_sql.erl
 +++ b/src/pubsub_subscription_sql.erl
 @@ -34,7 +34,7 @@
@@ -1732,7 +1790,7 @@ index d8ea3e23b..9c6bc3f42 100644
  
  -define(STREAM_TRAILER, <<"</stream:stream>">>).
 diff --git a/tools/xml_compress_gen.erl b/tools/xml_compress_gen.erl
-index 5b43c5925..087a6c13b 100644
+index c3c494c8c..80ff83f79 100644
 --- a/tools/xml_compress_gen.erl
 +++ b/tools/xml_compress_gen.erl
 @@ -24,7 +24,7 @@
@@ -1745,5 +1803,5 @@ index 5b43c5925..087a6c13b 100644
  %% API
  -export([archive_analyze/3, process_stats/1, gen_code/3]).
 -- 
-2.35.3
+2.39.2
 
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 53a7402f77..15e879be19 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,3 +1,4 @@
+# From https://static.process-one.net/ejabberd/downloads/23.04/ejabberd-23.04.tar.gz.sum
+sha256  6ff1d41a1ff6261a0c846193647d8ec143e82142859bf1cfdc62299022ceb2ad  ejabberd-23.04.tar.gz
 # Locally computed
-sha256  b6e6739947d3678525b14ee280cedb1a04280c83ea17a4741795aac99fbdad47  ejabberd-21.12.tgz
 sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 5b8ed3edd0..3f79860a3d 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 21.12
-EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
+EJABBERD_VERSION = 23.04
+EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tar.gz
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
@@ -40,7 +40,7 @@ EJABBERD_CONF_OPTS = \
 	--disable-erlang-version-check
 
 define EJABBERD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) all install -C $(@D)
 endef
 
 # Replace HOST_DIR prefix to /usr in environment variables of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
