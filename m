Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F16C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B0A82E22;
	Mon, 16 May 2022 13:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjnqPoS7S34q; Mon, 16 May 2022 13:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F84382EB5;
	Mon, 16 May 2022 13:18:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5021BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1931582C9C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qlisyu53_z1F for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1439882C8E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g17so2331791wrb.11
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7967ZaZOSXB3HkuOIHqUqQ+PgsPZU3j5R8Kw9SyxU24=;
 b=NH/T/B1NSw2b5eqvyS140FiceWLZ+nCq8HQt5On6pw87adnc4q52NDridGmtHyYzYH
 Vm0o9BftZZRANnAlBRM6iLTEnRR9U6m5hmRxr5aGLn0qZ6Cp9Fxk+OtS1VvfiSHrc3nr
 kox8iooEIs66N5oM/MWz2TYSg/2mMF8UOtNgcnAMJdvExCg5GFRmx2iPZGX9nxk9Muh2
 y7+y63W13BlmlUu077vd4SNPQXygFbBORQ59mnLafKoZd+zrrYUM5ENo6wG0NRUfisLj
 WJleFBTdL5Au4gSWbkIs3CdBQUOkAYN2IRXZuOwqBCTrhYUS+cUOKLQtAT4SEekm7Yjz
 cHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7967ZaZOSXB3HkuOIHqUqQ+PgsPZU3j5R8Kw9SyxU24=;
 b=aDcBIoAXszvTkitz1icJItSYeU99i6Olw4fzke3+KWYawpWp5HUQk5eVHJPf5oBrN8
 Qu0rJs5yL7wWstBHfURsYlrSiHZevbr4XtJf/T03wBMhU61LwjRAD05bOfbDTOYywq++
 ObGaTe9mUKjMTeNM+nLpyfsqrk40fq9+lNXz1fRmp6LgnoE37xZttiZundS2C2aAASDf
 juZxw855jRSjjFvW/YvY5Xe/RNJZbcYmG0bto7l1iP/57Pu8HGDXOJ84gO8V2ncAO6LE
 QRji5zVZ6pyLJuPTF0VO54/GjiorK2cHkh40uAEX6orV5FCcfIRzT8dPWgEcjQUG9oVD
 d4xQ==
X-Gm-Message-State: AOAM5312A7q59bkE1SQfAZl4WNaKUPOk1YEBC+cxc77pQr8Yp38ZGeJe
 BteZ5+zt7SfrZR4ee5xTREbnix2DJIM=
X-Google-Smtp-Source: ABdhPJzIysB1Iw27jiKpCkjvQllpD/nHWTETJ3T7lBtkEq2fftne1Jdn7HGbh43rVC0/C64oXP3ZeQ==
X-Received: by 2002:a5d:654b:0:b0:20d:e3e:7945 with SMTP id
 z11-20020a5d654b000000b0020d0e3e7945mr2104426wrv.113.1652706855782; 
 Mon, 16 May 2022 06:14:15 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:15 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:34 +0200
Message-Id: <20220516131334.1910858-21-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 20/20] package/ejabberd: bump version to 21.12
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And update the patches accordingly. Also add a patch to adjust the
includes to find the corresponding libraries.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...not-download-or-compile-dependencies.patch |   24 +-
 package/ejabberd/0003-fix-includes.patch      | 1614 +++++++++++++++++
 package/ejabberd/ejabberd.hash                |    2 +-
 package/ejabberd/ejabberd.mk                  |    5 +-
 4 files changed, 1630 insertions(+), 15 deletions(-)
 create mode 100644 package/ejabberd/0003-fix-includes.patch

diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
index ffacb6dafd..58213ed2e6 100644
--- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
@@ -1,6 +1,6 @@
-From cb583beba1acba55112fbb4636c1c73d9ae691a0 Mon Sep 17 00:00:00 2001
+From bf3571da4a68a6a857ab7ad8256f8276b3687a38 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Fri, 20 Nov 2020 00:33:30 +0100
+Date: Fri, 13 May 2022 14:22:37 +0200
 Subject: [PATCH] Makefile.in: do not download or compile dependencies
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
@@ -9,27 +9,27 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index abd64835..06f876bb 100644
+index ab0e9d967..6e54168a7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -97,7 +97,7 @@ ifneq ($(INSTALLGROUP),)
-   G_USER=-g $(INSTALLGROUP)
+@@ -139,7 +139,7 @@ else
+ endif
  endif
  
 -all: deps src
 +all: src
  
- deps: deps/.got
+ deps: $(DEPSDIR)/.got
  
-@@ -111,7 +111,7 @@ deps/.built: deps/.got
- 	$(REBAR) configure-deps
- 	$(REBAR) compile && :> deps/.built
+@@ -153,7 +153,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
+ 	$(CONFIGURE_DEPS)
+ 	$(REBAR) compile && :> $(DEPSDIR)/.built
  
--src: deps/.built
+-src: $(DEPSDIR)/.built
 +src:
- 	$(REBAR) skip_deps=true compile
+ 	$(REBAR) $(SKIPDEPS) compile
  
  update:
 -- 
-2.29.2
+2.34.1
 
diff --git a/package/ejabberd/0003-fix-includes.patch b/package/ejabberd/0003-fix-includes.patch
new file mode 100644
index 0000000000..825068db70
--- /dev/null
+++ b/package/ejabberd/0003-fix-includes.patch
@@ -0,0 +1,1614 @@
+Description: correct includes
+ Many parts of ejabberd code were moved into their own projects and are packaged
+ separately by me. To make the build process work, several includes must be
+ adjusted for the corresponding libraries to be found.
+Author: Philipp Huebner <debalance@debian.org>
+
+Index: ejabberd/src/ejabberd_auth.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_auth.erl
++++ ejabberd/src/ejabberd_auth.erl
+@@ -48,7 +48,7 @@
+ 
+ -export([auth_modules/1, convert_to_scram/1]).
+ 
+--include_lib("xmpp/include/scram.hrl").
++-include_lib("p1_xmpp/include/scram.hrl").
+ -include("logger.hrl").
+ 
+ -define(SALT_LENGTH, 16).
+Index: ejabberd/src/ejabberd_auth_anonymous.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_auth_anonymous.erl
++++ ejabberd/src/ejabberd_auth_anonymous.erl
+@@ -45,7 +45,7 @@
+ 	 plain_password_required/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ start(Host) ->
+     ejabberd_hooks:add(sm_register_connection_hook, Host,
+Index: ejabberd/src/ejabberd_auth_jwt.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_auth_jwt.erl
++++ ejabberd/src/ejabberd_auth_jwt.erl
+@@ -36,7 +36,7 @@
+ %% 'ejabberd_hooks' callback:
+ -export([check_decoded_jwt/5]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ %%%----------------------------------------------------------------------
+Index: ejabberd/src/ejabberd_auth_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_auth_mnesia.erl
++++ ejabberd/src/ejabberd_auth_mnesia.erl
+@@ -37,7 +37,7 @@
+ -export([need_transform/1, transform/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/scram.hrl").
++-include_lib("p1_xmpp/include/scram.hrl").
+ -include("ejabberd_auth.hrl").
+ 
+ -record(reg_users_counter, {vhost = <<"">> :: binary(),
+Index: ejabberd/src/ejabberd_auth_sql.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_auth_sql.erl
++++ ejabberd/src/ejabberd_auth_sql.erl
+@@ -35,7 +35,7 @@
+ 	 remove_user/2, store_type/1, plain_password_required/1,
+ 	 export/1, which_users_exists/2]).
+ 
+--include_lib("xmpp/include/scram.hrl").
++-include_lib("p1_xmpp/include/scram.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("ejabberd_auth.hrl").
+Index: ejabberd/src/ejabberd_bosh.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_bosh.erl
++++ ejabberd/src/ejabberd_bosh.erl
+@@ -43,7 +43,7 @@
+ 	 code_change/4]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_http.hrl").
+ -include("bosh.hrl").
+ 
+Index: ejabberd/src/ejabberd_c2s.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_c2s.erl
++++ ejabberd/src/ejabberd_c2s.erl
+@@ -47,7 +47,7 @@
+ 	 reply/2, copy_state/2, set_timeout/2, route/2, format_reason/2,
+ 	 host_up/1, host_down/1, send_ws_ping/1, bounce_message_queue/2]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_roster.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/ejabberd_captcha.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_captcha.erl
++++ ejabberd/src/ejabberd_captcha.erl
+@@ -42,7 +42,7 @@
+ 	 host_up/1, host_down/1,
+ 	 config_reloaded/0, process_iq/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_http.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/ejabberd_http.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_http.erl
++++ ejabberd/src/ejabberd_http.erl
+@@ -37,7 +37,7 @@
+ -export([init/3]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_http.hrl").
+ -include_lib("kernel/include/file.hrl").
+ 
+Index: ejabberd/src/ejabberd_http_ws.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_http_ws.erl
++++ ejabberd/src/ejabberd_http_ws.erl
+@@ -36,7 +36,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+Index: ejabberd/src/ejabberd_iq.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_iq.erl
++++ ejabberd/src/ejabberd_iq.erl
+@@ -34,7 +34,7 @@
+ -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
+ 	 terminate/2, code_change/3]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_stacktrace.hrl").
+ 
+Index: ejabberd/src/ejabberd_local.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_local.erl
++++ ejabberd/src/ejabberd_local.erl
+@@ -47,7 +47,7 @@
+ 
+ -include("logger.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_stacktrace.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/ejabberd_oauth.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_oauth.erl
++++ ejabberd/src/ejabberd_oauth.erl
+@@ -54,7 +54,7 @@
+          oauth_add_client_implicit/3,
+          oauth_remove_client/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_http.hrl").
+ -include("ejabberd_web_admin.hrl").
+Index: ejabberd/src/ejabberd_oauth_rest.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_oauth_rest.erl
++++ ejabberd/src/ejabberd_oauth_rest.erl
+@@ -36,7 +36,7 @@
+ 
+ -include("ejabberd_oauth.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ init() ->
+     rest:start(ejabberd_config:get_myname()),
+Index: ejabberd/src/ejabberd_oauth_sql.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_oauth_sql.erl
++++ ejabberd/src/ejabberd_oauth_sql.erl
+@@ -37,7 +37,7 @@
+ 
+ -include("ejabberd_oauth.hrl").
+ -include("ejabberd_sql_pt.hrl").
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("logger.hrl").
+ 
+ init() ->
+Index: ejabberd/src/ejabberd_piefxis.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_piefxis.erl
++++ ejabberd/src/ejabberd_piefxis.erl
+@@ -38,9 +38,9 @@
+ 
+ -define(CHUNK_SIZE, 1024*20). %20k
+ 
+--include_lib("xmpp/include/scram.hrl").
++-include_lib("p1_xmpp/include/scram.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("mod_roster.hrl").
+ 
+Index: ejabberd/src/ejabberd_router.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_router.erl
++++ ejabberd/src/ejabberd_router.erl
+@@ -69,7 +69,7 @@
+ 
+ -include("logger.hrl").
+ -include("ejabberd_router.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_stacktrace.hrl").
+ 
+ -callback init() -> any().
+Index: ejabberd/src/ejabberd_router_multicast.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_router_multicast.erl
++++ ejabberd/src/ejabberd_router_multicast.erl
+@@ -42,7 +42,7 @@
+ 	 terminate/2, code_change/3, update_to_in_wrapped/2]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(route_multicast, {domain = <<"">> :: binary() | '_',
+ 			  pid = self() :: pid()}).
+Index: ejabberd/src/ejabberd_s2s.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_s2s.erl
++++ ejabberd/src/ejabberd_s2s.erl
+@@ -52,7 +52,7 @@
+ -export([get_info_s2s_connections/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_commands.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("ejabberd_stacktrace.hrl").
+Index: ejabberd/src/ejabberd_s2s_in.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_s2s_in.erl
++++ ejabberd/src/ejabberd_s2s_in.erl
+@@ -41,7 +41,7 @@
+ -export([stop_async/1, close/1, close/2, send/2, update_state/2, establish/1,
+ 	 host_up/1, host_down/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -type state() :: xmpp_stream_in:state().
+Index: ejabberd/src/ejabberd_s2s_out.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_s2s_out.erl
++++ ejabberd/src/ejabberd_s2s_out.erl
+@@ -39,7 +39,7 @@
+ -export([start/3, start_link/3, connect/1, close/1, close/2, stop_async/1, send/2,
+ 	 route/2, establish/1, update_state/2, host_up/1, host_down/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/ejabberd_service.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_service.erl
++++ ejabberd/src/ejabberd_service.erl
+@@ -35,7 +35,7 @@
+ %% API
+ -export([send/2, close/1, close/2, stop_async/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/ejabberd_sm.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_sm.erl
++++ ejabberd/src/ejabberd_sm.erl
+@@ -85,7 +85,7 @@
+ 	 handle_info/2, terminate/2, code_change/3]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_commands.hrl").
+ -include("ejabberd_sm.hrl").
+ -include("ejabberd_stacktrace.hrl").
+Index: ejabberd/src/ejabberd_web.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_web.erl
++++ ejabberd/src/ejabberd_web.erl
+@@ -33,7 +33,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+Index: ejabberd/src/ejabberd_web_admin.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_web_admin.erl
++++ ejabberd/src/ejabberd_web_admin.erl
+@@ -35,7 +35,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+Index: ejabberd/src/ejabberd_websocket.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_websocket.erl
++++ ejabberd/src/ejabberd_websocket.erl
+@@ -45,7 +45,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+Index: ejabberd/src/ejabberd_xmlrpc.erl
+===================================================================
+--- ejabberd.orig/src/ejabberd_xmlrpc.erl
++++ ejabberd/src/ejabberd_xmlrpc.erl
+@@ -39,7 +39,7 @@
+ -include("ejabberd_http.hrl").
+ -include("mod_roster.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state,
+ 	{auth = noauth        :: noauth | map(),
+Index: ejabberd/src/gen_iq_handler.erl
+===================================================================
+--- ejabberd.orig/src/gen_iq_handler.erl
++++ ejabberd/src/gen_iq_handler.erl
+@@ -35,7 +35,7 @@
+ -deprecated([{add_iq_handler, 6}, {handle, 5}, {iqdisc, 1}]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ -include("ejabberd_stacktrace.hrl").
+ 
+Index: ejabberd/src/gen_pubsub_node.erl
+===================================================================
+--- ejabberd.orig/src/gen_pubsub_node.erl
++++ ejabberd/src/gen_pubsub_node.erl
+@@ -25,7 +25,7 @@
+ 
+ -module(gen_pubsub_node).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -type(host() :: mod_pubsub:host()).
+ -type(nodeId() :: mod_pubsub:nodeId()).
+Index: ejabberd/src/gen_pubsub_nodetree.erl
+===================================================================
+--- ejabberd.orig/src/gen_pubsub_nodetree.erl
++++ ejabberd/src/gen_pubsub_nodetree.erl
+@@ -36,7 +36,7 @@
+ 	ServerHost :: binary(),
+ 	Opts :: [any()]) -> atom().
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -callback terminate(Host :: host(), ServerHost :: binary()) -> atom().
+ 
+Index: ejabberd/src/jd2ejd.erl
+===================================================================
+--- ejabberd.orig/src/jd2ejd.erl
++++ ejabberd/src/jd2ejd.erl
+@@ -31,7 +31,7 @@
+ -export([import_file/1, import_dir/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%----------------------------------------------------------------------
+ %%% API
+Index: ejabberd/src/misc.erl
+===================================================================
+--- ejabberd.orig/src/misc.erl
++++ ejabberd/src/misc.erl
+@@ -50,7 +50,7 @@
+ 	     {encode_base64, 1}]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("kernel/include/file.hrl").
+ 
+ -type distance_cache() :: #{{string(), string()} => non_neg_integer()}.
+Index: ejabberd/src/mod_adhoc.erl
+===================================================================
+--- ejabberd.orig/src/mod_adhoc.erl
++++ ejabberd/src/mod_adhoc.erl
+@@ -39,7 +39,7 @@
+ 	 mod_options/1, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ start(Host, _Opts) ->
+Index: ejabberd/src/mod_admin_extra.erl
+===================================================================
+--- ejabberd.orig/src/mod_admin_extra.erl
++++ ejabberd/src/mod_admin_extra.erl
+@@ -85,7 +85,7 @@
+ -include("mod_roster.hrl").
+ -include("mod_privacy.hrl").
+ -include("ejabberd_sm.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%
+ %%% gen_mod
+Index: ejabberd/src/mod_admin_update_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_admin_update_sql.erl
++++ ejabberd/src/mod_admin_update_sql.erl
+@@ -37,7 +37,7 @@
+ 
+ -include("logger.hrl").
+ -include("ejabberd_commands.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_announce.erl
+===================================================================
+--- ejabberd.orig/src/mod_announce.erl
++++ ejabberd/src/mod_announce.erl
+@@ -51,7 +51,7 @@
+ 	 announce_all_hosts_motd_delete/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_announce_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_announce_mnesia.erl
++++ ejabberd/src/mod_announce_mnesia.erl
+@@ -31,7 +31,7 @@
+ 	 get_motd/1, is_motd_user/2, set_motd_user/2, import/3]).
+ -export([need_transform/1, transform/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ -include("logger.hrl").
+ 
+Index: ejabberd/src/mod_announce_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_announce_sql.erl
++++ ejabberd/src/mod_announce_sql.erl
+@@ -32,7 +32,7 @@
+ 	 get_motd/1, is_motd_user/2, set_motd_user/2, import/3,
+ 	 export/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("logger.hrl").
+Index: ejabberd/src/mod_avatar.erl
+===================================================================
+--- ejabberd.orig/src/mod_avatar.erl
++++ ejabberd/src/mod_avatar.erl
+@@ -31,7 +31,7 @@
+ -export([pubsub_publish_item/6, vcard_iq_convert/1, vcard_iq_publish/1,
+ 	 get_sm_features/5]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("pubsub.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_block_strangers.erl
+===================================================================
+--- ejabberd.orig/src/mod_block_strangers.erl
++++ ejabberd/src/mod_block_strangers.erl
+@@ -34,7 +34,7 @@
+ 
+ -export([filter_packet/1, filter_offline_msg/1, filter_subscription/2]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_blocking.erl
+===================================================================
+--- ejabberd.orig/src/mod_blocking.erl
++++ ejabberd/src/mod_blocking.erl
+@@ -33,7 +33,7 @@
+ 	 disco_features/5, mod_options/1, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_bosh.erl
+===================================================================
+--- ejabberd.orig/src/mod_bosh.erl
++++ ejabberd/src/mod_bosh.erl
+@@ -40,7 +40,7 @@
+ 
+ -include("logger.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_http.hrl").
+ -include("bosh.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_caps.erl
+===================================================================
+--- ejabberd.orig/src/mod_caps.erl
++++ ejabberd/src/mod_caps.erl
+@@ -54,7 +54,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_caps.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_carboncopy.erl
+===================================================================
+--- ejabberd.orig/src/mod_carboncopy.erl
++++ ejabberd/src/mod_carboncopy.erl
+@@ -42,7 +42,7 @@
+ -export([list/2]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -type direction() :: sent | received.
+Index: ejabberd/src/mod_client_state.erl
+===================================================================
+--- ejabberd.orig/src/mod_client_state.erl
++++ ejabberd/src/mod_client_state.erl
+@@ -42,7 +42,7 @@
+ 	 c2s_copy_session/2, c2s_session_resumed/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(CSI_QUEUE_MAX, 100).
+Index: ejabberd/src/mod_configure.erl
+===================================================================
+--- ejabberd.orig/src/mod_configure.erl
++++ ejabberd/src/mod_configure.erl
+@@ -39,7 +39,7 @@
+ 	 depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sm.hrl").
+ -include("translate.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+Index: ejabberd/src/mod_delegation.erl
+===================================================================
+--- ejabberd.orig/src/mod_delegation.erl
++++ ejabberd/src/mod_delegation.erl
+@@ -42,7 +42,7 @@
+ 	 disco_local_identity/5, disco_sm_identity/5]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -type route_type() :: ejabberd_sm | ejabberd_local.
+Index: ejabberd/src/mod_disco.erl
+===================================================================
+--- ejabberd.orig/src/mod_disco.erl
++++ ejabberd/src/mod_disco.erl
+@@ -42,7 +42,7 @@
+ 
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("mod_roster.hrl").
+ 
+Index: ejabberd/src/mod_fail2ban.erl
+===================================================================
+--- ejabberd.orig/src/mod_fail2ban.erl
++++ ejabberd/src/mod_fail2ban.erl
+@@ -42,7 +42,7 @@
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("ejabberd_commands.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(CLEAN_INTERVAL, timer:minutes(10)).
+Index: ejabberd/src/mod_http_api.erl
+===================================================================
+--- ejabberd.orig/src/mod_http_api.erl
++++ ejabberd/src/mod_http_api.erl
+@@ -32,7 +32,7 @@
+ -export([start/2, stop/1, reload/3, process/2, depends/2,
+ 	 mod_options/1, mod_doc/0]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_http.hrl").
+ -include("ejabberd_stacktrace.hrl").
+Index: ejabberd/src/mod_http_upload.erl
+===================================================================
+--- ejabberd.orig/src/mod_http_upload.erl
++++ ejabberd/src/mod_http_upload.erl
+@@ -87,7 +87,7 @@
+ 	 expand_host/2]).
+ 
+ -include("ejabberd_http.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_http_upload_quota.erl
+===================================================================
+--- ejabberd.orig/src/mod_http_upload_quota.erl
++++ ejabberd/src/mod_http_upload_quota.erl
+@@ -51,7 +51,7 @@
+ %% ejabberd_hooks callback.
+ -export([handle_slot_request/6]).
+ 
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ -include_lib("kernel/include/file.hrl").
+Index: ejabberd/src/mod_jidprep.erl
+===================================================================
+--- ejabberd.orig/src/mod_jidprep.erl
++++ ejabberd/src/mod_jidprep.erl
+@@ -41,7 +41,7 @@
+ 
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%--------------------------------------------------------------------
+ %% gen_mod callbacks.
+Index: ejabberd/src/mod_last.erl
+===================================================================
+--- ejabberd.orig/src/mod_last.erl
++++ ejabberd/src/mod_last.erl
+@@ -38,7 +38,7 @@
+ 	 register_user/2, depends/2, privacy_check_packet/4]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("mod_last.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_legacy_auth.erl
+===================================================================
+--- ejabberd.orig/src/mod_legacy_auth.erl
++++ ejabberd/src/mod_legacy_auth.erl
+@@ -29,7 +29,7 @@
+ %% hooks
+ -export([c2s_unauthenticated_packet/2, c2s_stream_features/2]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -type c2s_state() :: ejabberd_c2s:state().
+Index: ejabberd/src/mod_mam.erl
+===================================================================
+--- ejabberd.orig/src/mod_mam.erl
++++ ejabberd/src/mod_mam.erl
+@@ -45,7 +45,7 @@
+ 	 is_empty_for_user/2, is_empty_for_room/3, check_create_room/4,
+ 	 process_iq/3, store_mam_message/7, make_id/0, wrap_as_mucsub/2, select/7]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_muc_room.hrl").
+ -include("ejabberd_commands.hrl").
+Index: ejabberd/src/mod_mam_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_mam_mnesia.erl
++++ ejabberd/src/mod_mam_mnesia.erl
+@@ -32,7 +32,7 @@
+ 	 is_empty_for_user/2, is_empty_for_room/3]).
+ 
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_mam.hrl").
+ 
+Index: ejabberd/src/mod_mam_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_mam_sql.erl
++++ ejabberd/src/mod_mam_sql.erl
+@@ -33,7 +33,7 @@
+ 	 is_empty_for_user/2, is_empty_for_room/3, select_with_mucsub/6]).
+ 
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_mam.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+Index: ejabberd/src/mod_metrics.erl
+===================================================================
+--- ejabberd.orig/src/mod_metrics.erl
++++ ejabberd/src/mod_metrics.erl
+@@ -29,7 +29,7 @@
+ -behaviour(gen_mod).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -export([start/2, stop/1, mod_opt_type/1, mod_options/1, depends/2, reload/3]).
+Index: ejabberd/src/mod_mix.erl
+===================================================================
+--- ejabberd.orig/src/mod_mix.erl
++++ ejabberd/src/mod_mix.erl
+@@ -41,7 +41,7 @@
+ 	 process_mam_query/1,
+ 	 process_pubsub_query/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ -include("ejabberd_stacktrace.hrl").
+Index: ejabberd/src/mod_mix_pam.erl
+===================================================================
+--- ejabberd.orig/src/mod_mix_pam.erl
++++ ejabberd/src/mod_mix_pam.erl
+@@ -33,7 +33,7 @@
+ 	 remove_user/2,
+ 	 process_iq/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_mqtt_session.erl
+===================================================================
+--- ejabberd.orig/src/mod_mqtt_session.erl
++++ ejabberd/src/mod_mqtt_session.erl
+@@ -28,7 +28,7 @@
+ 
+ -include("logger.hrl").
+ -include("mqtt.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state, {vsn = ?VSN            :: integer(),
+                 version               :: undefined | mqtt_version(),
+Index: ejabberd/src/mod_mqtt_ws.erl
+===================================================================
+--- ejabberd.orig/src/mod_mqtt_ws.erl
++++ ejabberd/src/mod_mqtt_ws.erl
+@@ -29,7 +29,7 @@
+ -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
+ 	 terminate/2, code_change/3, format_status/2]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_http.hrl").
+ -include("logger.hrl").
+ 
+Index: ejabberd/src/mod_muc.erl
+===================================================================
+--- ejabberd.orig/src/mod_muc.erl
++++ ejabberd/src/mod_muc.erl
+@@ -77,7 +77,7 @@
+ 	 mod_opt_type/1, mod_options/1, depends/2]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_muc.hrl").
+ -include("mod_muc_room.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_muc_admin.erl
+===================================================================
+--- ejabberd.orig/src/mod_muc_admin.erl
++++ ejabberd/src/mod_muc_admin.erl
+@@ -44,7 +44,7 @@
+ 	 web_page_host/3, mod_options/1, get_commands_spec/0, find_hosts/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_muc.hrl").
+ -include("mod_muc_room.hrl").
+ -include("ejabberd_http.hrl").
+Index: ejabberd/src/mod_muc_log.erl
+===================================================================
+--- ejabberd.orig/src/mod_muc_log.erl
++++ ejabberd/src/mod_muc_log.erl
+@@ -42,7 +42,7 @@
+ 	 mod_opt_type/1, mod_options/1, depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_muc_room.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_muc_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_muc_mnesia.erl
++++ ejabberd/src/mod_muc_mnesia.erl
+@@ -44,7 +44,7 @@
+ 
+ -include("mod_muc.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+ 
+ -record(state, {}).
+Index: ejabberd/src/mod_muc_room.erl
+===================================================================
+--- ejabberd.orig/src/mod_muc_room.erl
++++ ejabberd/src/mod_muc_room.erl
+@@ -68,7 +68,7 @@
+ 	 code_change/4]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ -include("mod_muc_room.hrl").
+ -include("ejabberd_stacktrace.hrl").
+Index: ejabberd/src/mod_muc_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_muc_sql.erl
++++ ejabberd/src/mod_muc_sql.erl
+@@ -42,7 +42,7 @@
+ -export([set_affiliation/6, set_affiliations/4, get_affiliation/5,
+ 	 get_affiliations/3, search_affiliation/4]).
+ 
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_muc.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+Index: ejabberd/src/mod_multicast.erl
+===================================================================
+--- ejabberd.orig/src/mod_multicast.erl
++++ ejabberd/src/mod_multicast.erl
+@@ -45,7 +45,7 @@
+ 
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(multicastc, {rserver :: binary(),
+ 		     response,
+Index: ejabberd/src/mod_offline.erl
+===================================================================
+--- ejabberd.orig/src/mod_offline.erl
++++ ejabberd/src/mod_offline.erl
+@@ -69,7 +69,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+Index: ejabberd/src/mod_offline_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_offline_mnesia.erl
++++ ejabberd/src/mod_offline_mnesia.erl
+@@ -32,7 +32,7 @@
+ 	 remove_all_messages/2, count_messages/2, import/1]).
+ -export([need_transform/1, transform/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_offline.hrl").
+ -include("logger.hrl").
+ 
+Index: ejabberd/src/mod_offline_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_offline_sql.erl
++++ ejabberd/src/mod_offline_sql.erl
+@@ -32,7 +32,7 @@
+ 	 read_message/3, remove_message/3, read_all_messages/2,
+ 	 remove_all_messages/2, count_messages/2, import/1, export/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_offline.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+Index: ejabberd/src/mod_ping.erl
+===================================================================
+--- ejabberd.orig/src/mod_ping.erl
++++ ejabberd/src/mod_ping.erl
+@@ -35,7 +35,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_pres_counter.erl
+===================================================================
+--- ejabberd.orig/src/mod_pres_counter.erl
++++ ejabberd/src/mod_pres_counter.erl
+@@ -32,7 +32,7 @@
+ 
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(pres_counter,
+ 	{dir, start, count, logged = false}).
+Index: ejabberd/src/mod_privacy.erl
+===================================================================
+--- ejabberd.orig/src/mod_privacy.erl
++++ ejabberd/src/mod_privacy.erl
+@@ -41,7 +41,7 @@
+ 	 mod_opt_type/1, mod_options/1, depends/2]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_privacy_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_privacy_mnesia.erl
++++ ejabberd/src/mod_privacy_mnesia.erl
+@@ -32,7 +32,7 @@
+ 	 remove_list/3, use_cache/1, import/1]).
+ -export([need_transform/1, transform/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("logger.hrl").
+ 
+Index: ejabberd/src/mod_privacy_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_privacy_sql.erl
++++ ejabberd/src/mod_privacy_sql.erl
+@@ -34,7 +34,7 @@
+ 
+ -export([item_to_raw/1, raw_to_item/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+Index: ejabberd/src/mod_private.erl
+===================================================================
+--- ejabberd.orig/src/mod_private.erl
++++ ejabberd/src/mod_private.erl
+@@ -40,7 +40,7 @@
+ -export([get_commands_spec/0, bookmarks_to_pep/2]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ -include("ejabberd_commands.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_private_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_private_mnesia.erl
++++ ejabberd/src/mod_private_mnesia.erl
+@@ -31,7 +31,7 @@
+ 	 use_cache/1, import/3]).
+ -export([need_transform/1, transform/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ -include("logger.hrl").
+ 
+Index: ejabberd/src/mod_private_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_private_sql.erl
++++ ejabberd/src/mod_private_sql.erl
+@@ -29,7 +29,7 @@
+ -export([init/2, set_data/3, get_data/3, get_all_data/2, del_data/2,
+ 	 import/3, export/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("logger.hrl").
+Index: ejabberd/src/mod_privilege.erl
+===================================================================
+--- ejabberd.orig/src/mod_privilege.erl
++++ ejabberd/src/mod_privilege.erl
+@@ -41,7 +41,7 @@
+ 	 process_presence_out/1, process_presence_in/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -type roster_permission() :: both | get | set.
+Index: ejabberd/src/mod_proxy65_service.erl
+===================================================================
+--- ejabberd.orig/src/mod_proxy65_service.erl
++++ ejabberd/src/mod_proxy65_service.erl
+@@ -38,7 +38,7 @@
+ 	 delete_listener/1, route/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ -include("ejabberd_stacktrace.hrl").
+ 
+Index: ejabberd/src/mod_pubsub.erl
+===================================================================
+--- ejabberd.orig/src/mod_pubsub.erl
++++ ejabberd/src/mod_pubsub.erl
+@@ -40,7 +40,7 @@
+ -protocol({xep, 248, '0.2'}).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("pubsub.hrl").
+ -include("mod_roster.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_push.erl
+===================================================================
+--- ejabberd.orig/src/mod_push.erl
++++ ejabberd/src/mod_push.erl
+@@ -51,7 +51,7 @@
+ 
+ -include("ejabberd_commands.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(PUSH_CACHE, push_cache).
+Index: ejabberd/src/mod_push_keepalive.erl
+===================================================================
+--- ejabberd.orig/src/mod_push_keepalive.erl
++++ ejabberd/src/mod_push_keepalive.erl
+@@ -36,7 +36,7 @@
+ 	 c2s_handle_cast/2, c2s_handle_info/2, c2s_stanza/3]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(PUSH_BEFORE_TIMEOUT_PERIOD, 120000). % 2 minutes.
+Index: ejabberd/src/mod_push_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_push_mnesia.erl
++++ ejabberd/src/mod_push_mnesia.erl
+@@ -35,7 +35,7 @@
+ 
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_push.hrl").
+ 
+ %%%-------------------------------------------------------------------
+Index: ejabberd/src/mod_push_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_push_sql.erl
++++ ejabberd/src/mod_push_sql.erl
+@@ -31,7 +31,7 @@
+ 	 lookup_sessions/3, lookup_sessions/2, lookup_sessions/1,
+ 	 delete_session/3, delete_old_sessions/2, export/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("mod_push.hrl").
+Index: ejabberd/src/mod_register.erl
+===================================================================
+--- ejabberd.orig/src/mod_register.erl
++++ ejabberd/src/mod_register.erl
+@@ -40,7 +40,7 @@
+ -deprecated({try_register, 4}).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ start(Host, _Opts) ->
+Index: ejabberd/src/mod_register_web.erl
+===================================================================
+--- ejabberd.orig/src/mod_register_web.erl
++++ ejabberd/src/mod_register_web.erl
+@@ -34,7 +34,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+Index: ejabberd/src/mod_roster.erl
+===================================================================
+--- ejabberd.orig/src/mod_roster.erl
++++ ejabberd/src/mod_roster.erl
+@@ -54,7 +54,7 @@
+ 	 depends/2, set_item_and_notify_clients/3]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_roster.hrl").
+ -include("ejabberd_http.hrl").
+ -include("ejabberd_web_admin.hrl").
+Index: ejabberd/src/mod_roster_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_roster_mnesia.erl
++++ ejabberd/src/mod_roster_mnesia.erl
+@@ -37,7 +37,7 @@
+ 
+ -include("mod_roster.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%===================================================================
+ %%% API
+Index: ejabberd/src/mod_roster_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_roster_sql.erl
++++ ejabberd/src/mod_roster_sql.erl
+@@ -38,7 +38,7 @@
+ -include("mod_roster.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ %%%===================================================================
+ %%% API
+Index: ejabberd/src/mod_s2s_dialback.erl
+===================================================================
+--- ejabberd.orig/src/mod_s2s_dialback.erl
++++ ejabberd/src/mod_s2s_dialback.erl
+@@ -33,7 +33,7 @@
+ 	 s2s_in_features/2, s2s_out_init/2, s2s_out_closed/2,
+ 	 s2s_out_tls_verify/2]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/mod_service_log.erl
+===================================================================
+--- ejabberd.orig/src/mod_service_log.erl
++++ ejabberd/src/mod_service_log.erl
+@@ -34,7 +34,7 @@
+ 
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, _Opts) ->
+     ejabberd_hooks:add(user_send_packet, Host, ?MODULE,
+Index: ejabberd/src/mod_shared_roster.erl
+===================================================================
+--- ejabberd.orig/src/mod_shared_roster.erl
++++ ejabberd/src/mod_shared_roster.erl
+@@ -43,7 +43,7 @@
+ 
+ -include("logger.hrl").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("mod_roster.hrl").
+ 
+Index: ejabberd/src/mod_shared_roster_ldap.erl
+===================================================================
+--- ejabberd.orig/src/mod_shared_roster_ldap.erl
++++ ejabberd/src/mod_shared_roster_ldap.erl
+@@ -43,7 +43,7 @@
+ 	 depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_roster.hrl").
+ -include("eldap.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_shared_roster_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_shared_roster_mnesia.erl
++++ ejabberd/src/mod_shared_roster_mnesia.erl
+@@ -37,7 +37,7 @@
+ -include("mod_roster.hrl").
+ -include("mod_shared_roster.hrl").
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%===================================================================
+ %%% API
+Index: ejabberd/src/mod_shared_roster_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_shared_roster_sql.erl
++++ ejabberd/src/mod_shared_roster_sql.erl
+@@ -35,7 +35,7 @@
+ 	 add_user_to_group/3, remove_user_from_group/3, import/3,
+ 	 export/1]).
+ 
+--include_lib("xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_roster.hrl").
+ -include("mod_shared_roster.hrl").
+ -include("ejabberd_sql_pt.hrl").
+Index: ejabberd/src/mod_sic.erl
+===================================================================
+--- ejabberd.orig/src/mod_sic.erl
++++ ejabberd/src/mod_sic.erl
+@@ -35,7 +35,7 @@
+ 	 process_sm_iq/1, mod_options/1, depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ start(Host, _Opts) ->
+Index: ejabberd/src/mod_sip.erl
+===================================================================
+--- ejabberd.orig/src/mod_sip.erl
++++ ejabberd/src/mod_sip.erl
+@@ -55,7 +55,7 @@ mod_doc() ->
+ 	 locate/1, mod_opt_type/1, mod_options/1, depends/2,
+          mod_doc/0]).
+ 
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ %%%===================================================================
+ %%% API
+Index: ejabberd/src/mod_sip_proxy.erl
+===================================================================
+--- ejabberd.orig/src/mod_sip_proxy.erl
++++ ejabberd/src/mod_sip_proxy.erl
+@@ -39,7 +39,7 @@
+ 	 code_change/4]).
+ 
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ -define(SIGN_LIFETIME, 300). %% in seconds.
+ 
+Index: ejabberd/src/mod_sip_registrar.erl
+===================================================================
+--- ejabberd.orig/src/mod_sip_registrar.erl
++++ ejabberd/src/mod_sip_registrar.erl
+@@ -41,7 +41,7 @@
+ 	 terminate/2, code_change/3]).
+ 
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ -define(CALL_TIMEOUT, timer:seconds(30)).
+ -define(DEFAULT_EXPIRES, 3600).
+Index: ejabberd/src/mod_stats.erl
+===================================================================
+--- ejabberd.orig/src/mod_stats.erl
++++ ejabberd/src/mod_stats.erl
+@@ -35,7 +35,7 @@
+ 	 mod_options/1, depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ start(Host, _Opts) ->
+Index: ejabberd/src/mod_stream_mgmt.erl
+===================================================================
+--- ejabberd.orig/src/mod_stream_mgmt.erl
++++ ejabberd/src/mod_stream_mgmt.erl
+@@ -37,7 +37,7 @@
+ %% adjust pending session timeout / access queue
+ -export([get_resume_timeout/1, set_resume_timeout/2, queue_find/2]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include_lib("p1_utils/include/p1_queue.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_stun_disco.erl
+===================================================================
+--- ejabberd.orig/src/mod_stun_disco.erl
++++ ejabberd/src/mod_stun_disco.erl
+@@ -55,7 +55,7 @@
+ 
+ -include("logger.hrl").
+ -include("translate.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(STUN_MODULE, ejabberd_stun).
+ 
+Index: ejabberd/src/mod_time.erl
+===================================================================
+--- ejabberd.orig/src/mod_time.erl
++++ ejabberd/src/mod_time.erl
+@@ -36,7 +36,7 @@
+ 	 mod_options/1, depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ start(Host, _Opts) ->
+Index: ejabberd/src/mod_vcard.erl
+===================================================================
+--- ejabberd.orig/src/mod_vcard.erl
++++ ejabberd/src/mod_vcard.erl
+@@ -44,7 +44,7 @@
+ -export([route/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ -include("translate.hrl").
+ -include("ejabberd_stacktrace.hrl").
+Index: ejabberd/src/mod_vcard_ldap.erl
+===================================================================
+--- ejabberd.orig/src/mod_vcard_ldap.erl
++++ ejabberd/src/mod_vcard_ldap.erl
+@@ -40,7 +40,7 @@
+ 
+ -include("logger.hrl").
+ -include("eldap.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(PROCNAME, ejabberd_mod_vcard_ldap).
+Index: ejabberd/src/mod_vcard_mnesia.erl
+===================================================================
+--- ejabberd.orig/src/mod_vcard_mnesia.erl
++++ ejabberd/src/mod_vcard_mnesia.erl
+@@ -33,7 +33,7 @@
+ -export([need_transform/1, transform/1]).
+ -export([mod_opt_type/1, mod_options/1, mod_doc/0]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+Index: ejabberd/src/mod_vcard_sql.erl
+===================================================================
+--- ejabberd.orig/src/mod_vcard_sql.erl
++++ ejabberd/src/mod_vcard_sql.erl
+@@ -32,7 +32,7 @@
+ 	 search_fields/1, search_reported/1, import/3, export/1]).
+ -export([is_search_supported/1]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+Index: ejabberd/src/mod_vcard_xupdate.erl
+===================================================================
+--- ejabberd.orig/src/mod_vcard_xupdate.erl
++++ ejabberd/src/mod_vcard_xupdate.erl
+@@ -37,7 +37,7 @@
+ -export([compute_hash/1]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(VCARD_XUPDATE_CACHE, vcard_xupdate_cache).
+Index: ejabberd/src/mod_version.erl
+===================================================================
+--- ejabberd.orig/src/mod_version.erl
++++ ejabberd/src/mod_version.erl
+@@ -35,7 +35,7 @@
+ 	 mod_opt_type/1, mod_options/1, depends/2, mod_doc/0]).
+ 
+ -include("logger.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ start(Host, _Opts) ->
+Index: ejabberd/src/node_flat.erl
+===================================================================
+--- ejabberd.orig/src/node_flat.erl
++++ ejabberd/src/node_flat.erl
+@@ -34,7 +34,7 @@
+ -author('christophe.romain@process-one.net').
+ 
+ -include("pubsub.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([init/3, terminate/2, options/0, features/0,
+     create_node_permission/6, create_node/2, delete_node/1,
+Index: ejabberd/src/node_flat_sql.erl
+===================================================================
+--- ejabberd.orig/src/node_flat_sql.erl
++++ ejabberd/src/node_flat_sql.erl
+@@ -35,7 +35,7 @@
+ 
+ 
+ -include("pubsub.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/nodetree_tree.erl
+===================================================================
+--- ejabberd.orig/src/nodetree_tree.erl
++++ ejabberd/src/nodetree_tree.erl
+@@ -41,7 +41,7 @@
+ -include_lib("stdlib/include/ms_transform.hrl").
+ 
+ -include("pubsub.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -export([init/3, terminate/2, options/0, set_node/1,
+Index: ejabberd/src/nodetree_tree_sql.erl
+===================================================================
+--- ejabberd.orig/src/nodetree_tree_sql.erl
++++ ejabberd/src/nodetree_tree_sql.erl
+@@ -39,7 +39,7 @@
+ 
+ 
+ -include("pubsub.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("translate.hrl").
+ 
+Index: ejabberd/src/prosody2ejabberd.erl
+===================================================================
+--- ejabberd.orig/src/prosody2ejabberd.erl
++++ ejabberd/src/prosody2ejabberd.erl
+@@ -27,8 +27,8 @@
+ %% API
+ -export([from_dir/1]).
+ 
+--include_lib("xmpp/include/scram.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/scram.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_roster.hrl").
+ -include("mod_offline.hrl").
+Index: ejabberd/src/pubsub_subscription.erl
+===================================================================
+--- ejabberd.orig/src/pubsub_subscription.erl
++++ ejabberd/src/pubsub_subscription.erl
+@@ -38,7 +38,7 @@
+     read_subscription/3, write_subscription/4]).
+ 
+ -include("pubsub.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(PUBSUB_DELIVER, <<"pubsub#deliver">>).
+Index: ejabberd/src/pubsub_subscription_sql.erl
+===================================================================
+--- ejabberd.orig/src/pubsub_subscription_sql.erl
++++ ejabberd/src/pubsub_subscription_sql.erl
+@@ -34,7 +34,7 @@
+     get_options_xform/2, parse_options_xform/1]).
+ 
+ -include("pubsub.hrl").
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(PUBSUB_DELIVER, <<"pubsub#deliver">>).
+Index: ejabberd/test/suite.hrl
+===================================================================
+--- ejabberd.orig/test/suite.hrl
++++ ejabberd/test/suite.hrl
+@@ -1,8 +1,8 @@
+ -include_lib("common_test/include/ct.hrl").
+--include_lib("fast_xml/include/fxml.hrl").
+--include_lib("xmpp/include/jid.hrl").
+--include_lib("xmpp/include/ns.hrl").
+--include_lib("xmpp/include/xmpp_codec.hrl").
++-include_lib("p1_xml/include/fxml.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
++-include_lib("p1_xmpp/include/ns.hrl").
++-include_lib("p1_xmpp/include/xmpp_codec.hrl").
+ -include("mod_proxy65.hrl").
+ 
+ -define(STREAM_TRAILER, <<"</stream:stream>">>).
+Index: ejabberd/tools/xml_compress_gen.erl
+===================================================================
+--- ejabberd.orig/tools/xml_compress_gen.erl
++++ ejabberd/tools/xml_compress_gen.erl
+@@ -24,7 +24,7 @@
+ -module(xml_compress_gen).
+ -author("pawel@process-one.net").
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %% API
+ -export([archive_analyze/3, process_stats/1, gen_code/3]).
+Index: ejabberd/src/mod_conversejs.erl
+===================================================================
+--- ejabberd.orig/src/mod_conversejs.erl
++++ ejabberd/src/mod_conversejs.erl
+@@ -32,7 +32,7 @@
+ -export([start/2, stop/1, reload/3, process/2, depends/2,
+          mod_opt_type/1, mod_options/1, mod_doc/0]).
+ 
+--include_lib("xmpp/include/xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_http.hrl").
+ -include("translate.hrl").
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 0d57ada5bb..53a7402f77 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e922b938458ae9d72d4e5fdd2d08a1fbad651aae47c9a9d15b79d0bbd1e11f8  ejabberd-20.07.tgz
+sha256  b6e6739947d3678525b14ee280cedb1a04280c83ea17a4741795aac99fbdad47  ejabberd-21.12.tgz
 sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 2b23701ddf..5b8ed3edd0 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 20.07
+EJABBERD_VERSION = 21.12
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
@@ -16,7 +16,8 @@ EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
-# 0001-remove-make-targets-for-deps.patch updates Makefile.in
+# 0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+# updates Makefile.in
 EJABBERD_USE_AUTOCONF = YES
 EJABBERD_AUTORECONF = YES
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
