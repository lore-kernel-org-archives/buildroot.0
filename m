Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79330C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F1C40C88;
	Mon, 30 May 2022 21:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwX78xqsqi0L; Mon, 30 May 2022 21:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28A540138;
	Mon, 30 May 2022 21:35:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68DA41BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6115240138
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBQgfxlW1JXJ for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:35:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2F9840022
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:35:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o9so7069670wmd.0
 for <buildroot@buildroot.org>; Mon, 30 May 2022 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QK6FpAx6tCdJ8L/QQ2UzHVYLttVxDT2bKq+OzqkJyF0=;
 b=NSUEmpB3hhd0UQ8dhUA8SiPMJLAqsDuA2zRcSuBLNNICnw9tH3IdoRY4/owjzO5mhI
 ie1AHq65AYG4P9pIHjTEZ7Pn03DXBsCvoFxb5/EBh4IbmWJm8+eyMq1+Kxm87yt+WKCY
 qwr4jLEGvkit5uSvGSwe3enUw8zgPkaaaSGJEg3UpUuJgsPN/HmxXpg0K99V2lw3pkBX
 gKobCsekdmOU7VKNj+Nx2T6bD0WFBTZ/PpZFHbgJH2CnpKfjg184xraOKfrxNl/Rqics
 TCLNyNlEBbh6d0vCpLkxWFk6fMuR8F/DGVwy7luDlq2XZ/CSOGa5zo0GJ7g58hYqHGge
 RGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QK6FpAx6tCdJ8L/QQ2UzHVYLttVxDT2bKq+OzqkJyF0=;
 b=AI06+jQtqkm9UA0E2CWIUIdIHx+DIR0WwnrX1MRqW7jrMGEwJO/QraZyiwAsxIu4CV
 YCqCSqmpxQOiQ/j9Ysj21PutYTJJyrZYxLDwGHQjksGNUtlpbT8mwoCxr6Qn/yF+CRPw
 SIDEf8Jsa0wPuz1ZjaZihv6HLdgnkvpWNpnj7Fq/A9k/cUkzXlMnYDq3qe0BZjTA9ts/
 s/m8TrVDC8eNHHNzyQe3ghGTRrNIIDwwEozHm58VWmlk2gQGqUW/lBDM/BZ1Uq2E83VW
 +4f3s9gfT+YWEKJmpWU024QsW3jmuKhbHAxYxd67xYyO+2qKAfGfozQ6aY5FDqS19c7F
 54NA==
X-Gm-Message-State: AOAM530wFyeTnqpPz4oYOEkg0wxsZ+3ma22tGUZThsHaTB9mA+IF+FkF
 jGdr6HBJgSI8nCIPSr/KoWrYM4dNFgY=
X-Google-Smtp-Source: ABdhPJyOspNiF2x9Ycs678LUzIVALA2UhgdVyXCjtTwbhUR+aXB33vVhGzrBQVTzzyO2ZxmJesaSjA==
X-Received: by 2002:a7b:c401:0:b0:397:26fb:ebf7 with SMTP id
 k1-20020a7bc401000000b0039726fbebf7mr21297573wmi.90.1653946553711; 
 Mon, 30 May 2022 14:35:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g12-20020adfd1ec000000b0020c5253d8f2sm6651869wrd.62.2022.05.30.14.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 14:35:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:33:24 +0200
Message-Id: <20220530213324.3067408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/pipewire: fix uclibc build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
/home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Backport correct upstream fix (previous one was broken)

 .../0002-fix-detection-of-reallocarray.patch  | 287 ++++++++++++++++++
 1 file changed, 287 insertions(+)
 create mode 100644 package/pipewire/0002-fix-detection-of-reallocarray.patch

diff --git a/package/pipewire/0002-fix-detection-of-reallocarray.patch b/package/pipewire/0002-fix-detection-of-reallocarray.patch
new file mode 100644
index 0000000000..8cb80c8672
--- /dev/null
+++ b/package/pipewire/0002-fix-detection-of-reallocarray.patch
@@ -0,0 +1,287 @@
+From 85ca67b9275780cc40bee08f92954db9184cad56 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 May 2022 15:00:17 +0200
+Subject: [PATCH] fix detection of reallocarray
+
+Fix detection of reallocarray (e.g. on glibc) raised since commit
+0708a39b439cec2871cfe3b705191028397e5b8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/85ca67b9275780cc40bee08f92954db9184cad56]
+---
+ meson.build                                            |  1 +
+ pipewire-jack/src/metadata.c                           |  2 +-
+ spa/plugins/bluez5/bluez5-dbus.c                       |  5 +++++
+ src/modules/module-client-node/client-node.c           |  2 +-
+ src/modules/module-client-node/remote-node.c           |  4 ++--
+ src/modules/module-client-node/v0/client-node.c        |  4 ++--
+ .../client-endpoint/endpoint-stream.c                  |  4 ++--
+ .../module-session-manager/client-endpoint/endpoint.c  |  4 ++--
+ .../client-session/endpoint-link.c                     |  4 ++--
+ .../module-session-manager/client-session/session.c    |  4 ++--
+ src/pipewire/introspect.c                              |  6 +++---
+ src/pipewire/utils.c                                   | 10 ++++++++++
+ src/pipewire/utils.h                                   |  5 ++---
+ 13 files changed, 35 insertions(+), 20 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 314091779..e6bc29ba4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -375,6 +375,7 @@ check_functions = [
+   ['gettid', '#include <unistd.h>', ['-D_GNU_SOURCE'], []],
+   ['memfd_create', '#include <sys/mman.h>', ['-D_GNU_SOURCE'], []],
+   ['getrandom', '#include <stddef.h>\n#include <sys/random.h>', ['-D_GNU_SOURCE'], []],
++  ['reallocarray', '#include <stdlib.h>', ['-D_GNU_SOURCE'], []],
+   ['sigabbrev_np', '#include <string.h>', ['-D_GNU_SOURCE'], []],
+   ['XSetIOErrorExitHandler', '#include <X11/Xlib.h>', [], [x11_dep]],
+ ]
+diff --git a/pipewire-jack/src/metadata.c b/pipewire-jack/src/metadata.c
+index 8ccb5a348..d50948ff4 100644
+--- a/pipewire-jack/src/metadata.c
++++ b/pipewire-jack/src/metadata.c
+@@ -120,7 +120,7 @@ static jack_property_t *add_property(jack_description_t *desc, const char *key,
+ 
+ 	if (desc->property_cnt == desc->property_size) {
+ 		ns = desc->property_size > 0 ? desc->property_size * 2 : 8;
+-		np = reallocarray(desc->properties, ns, sizeof(*prop));
++		np = pw_reallocarray(desc->properties, ns, sizeof(*prop));
+ 		if (np == NULL)
+ 			return NULL;
+ 		desc->property_size = ns;
+diff --git a/spa/plugins/bluez5/bluez5-dbus.c b/spa/plugins/bluez5/bluez5-dbus.c
+index 98bf05df1..c2e4a7ba7 100644
+--- a/spa/plugins/bluez5/bluez5-dbus.c
++++ b/spa/plugins/bluez5/bluez5-dbus.c
+@@ -50,6 +50,7 @@
+ #include <spa/utils/string.h>
+ #include <spa/utils/json.h>
+ 
++#include "config.h"
+ #include "codec-loader.h"
+ #include "player.h"
+ #include "defs.h"
+@@ -1579,7 +1580,11 @@ const struct a2dp_codec **spa_bt_device_get_supported_a2dp_codecs(struct spa_bt_
+ 		if (j >= size) {
+ 			const struct a2dp_codec **p;
+ 			size = size * 2;
++#ifdef HAVE_REALLOCARRRAY
+ 			p = reallocarray(supported_codecs, size, sizeof(const struct a2dp_codec *));
++#else
++			p = realloc(supported_codecs, size * sizeof(const struct a2dp_codec *));
++#endif
+ 			if (p == NULL) {
+ 				free(supported_codecs);
+ 				return NULL;
+diff --git a/src/modules/module-client-node/client-node.c b/src/modules/module-client-node/client-node.c
+index 2533c360c..9357d03da 100644
+--- a/src/modules/module-client-node/client-node.c
++++ b/src/modules/module-client-node/client-node.c
+@@ -191,7 +191,7 @@ static int update_params(struct params *p, uint32_t n_params, const struct spa_p
+ 		p->params = NULL;
+ 	} else {
+ 		struct spa_pod **np;
+-		np = reallocarray(p->params, p->n_params, sizeof(struct spa_pod *));
++		np = pw_reallocarray(p->params, p->n_params, sizeof(struct spa_pod *));
+ 		if (np == NULL) {
+ 			pw_log_error("%p: can't realloc: %m", p);
+ 			free(p->params);
+diff --git a/src/modules/module-client-node/remote-node.c b/src/modules/module-client-node/remote-node.c
+index c04273e95..c0af9a21f 100644
+--- a/src/modules/module-client-node/remote-node.c
++++ b/src/modules/module-client-node/remote-node.c
+@@ -318,7 +318,7 @@ static int add_node_update(struct node_data *data, uint32_t change_mask, uint32_
+ 							id, &idx, NULL, &param, &b.b);
+ 				if (res == 1) {
+ 					void *p;
+-					p = reallocarray(params, n_params + 1, sizeof(struct spa_pod *));
++					p = pw_reallocarray(params, n_params + 1, sizeof(struct spa_pod *));
+ 					if (p == NULL) {
+ 						res = -errno;
+ 						pw_log_error("realloc failed: %m");
+@@ -384,7 +384,7 @@ static int add_port_update(struct node_data *data, struct pw_impl_port *port, ui
+ 							id, &idx, NULL, &param, &b.b);
+ 				if (res == 1) {
+ 					void *p;
+-					p = reallocarray(params, n_params + 1, sizeof(struct spa_pod*));
++					p = pw_reallocarray(params, n_params + 1, sizeof(struct spa_pod*));
+ 					if (p == NULL) {
+ 						res = -errno;
+ 						pw_log_error("realloc failed: %m");
+diff --git a/src/modules/module-client-node/v0/client-node.c b/src/modules/module-client-node/v0/client-node.c
+index e71abbb14..aeb5931c6 100644
+--- a/src/modules/module-client-node/v0/client-node.c
++++ b/src/modules/module-client-node/v0/client-node.c
+@@ -476,7 +476,7 @@ do_update_port(struct node *this,
+ 			port->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(port->params, port->n_params, sizeof(struct spa_pod *));
++			p = pw_reallocarray(port->params, port->n_params, sizeof(struct spa_pod *));
+ 			if (p == NULL) {
+ 				pw_log_error("%p: port %u can't realloc: %m", this, port_id);
+ 				free(port->params);
+@@ -1049,7 +1049,7 @@ client_node0_update(void *data,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, this->n_params, sizeof(struct spa_pod *));
++			p = pw_reallocarray(this->params, this->n_params, sizeof(struct spa_pod *));
+ 			if (p == NULL) {
+ 				pw_log_error("%p: can't realloc: %m", this);
+ 				free(this->params);
+diff --git a/src/modules/module-session-manager/client-endpoint/endpoint-stream.c b/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
+index 8d7f2da2b..8dde6f749 100644
+--- a/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
++++ b/src/modules/module-session-manager/client-endpoint/endpoint-stream.c
+@@ -196,7 +196,7 @@ int endpoint_stream_update(struct endpoint_stream *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -227,7 +227,7 @@ int endpoint_stream_update(struct endpoint_stream *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/modules/module-session-manager/client-endpoint/endpoint.c b/src/modules/module-session-manager/client-endpoint/endpoint.c
+index 8a7863ee1..aa13989b6 100644
+--- a/src/modules/module-session-manager/client-endpoint/endpoint.c
++++ b/src/modules/module-session-manager/client-endpoint/endpoint.c
+@@ -213,7 +213,7 @@ int endpoint_update(struct endpoint *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -245,7 +245,7 @@ int endpoint_update(struct endpoint *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/modules/module-session-manager/client-session/endpoint-link.c b/src/modules/module-session-manager/client-session/endpoint-link.c
+index 9048fe30c..0bdbfc946 100644
+--- a/src/modules/module-session-manager/client-session/endpoint-link.c
++++ b/src/modules/module-session-manager/client-session/endpoint-link.c
+@@ -209,7 +209,7 @@ int endpoint_link_update(struct endpoint_link *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -241,7 +241,7 @@ int endpoint_link_update(struct endpoint_link *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/modules/module-session-manager/client-session/session.c b/src/modules/module-session-manager/client-session/session.c
+index 681c56118..87c1b96a7 100644
+--- a/src/modules/module-session-manager/client-session/session.c
++++ b/src/modules/module-session-manager/client-session/session.c
+@@ -196,7 +196,7 @@ int session_update(struct session *this,
+ 			this->params = NULL;
+ 		} else {
+ 			void *p;
+-			p = reallocarray(this->params, n_params, sizeof(struct spa_pod*));
++			p = pw_reallocarray(this->params, n_params, sizeof(struct spa_pod*));
+ 			if (p == NULL) {
+ 				free(this->params);
+ 				this->params = NULL;
+@@ -222,7 +222,7 @@ int session_update(struct session *this,
+ 				this->info.params = NULL;
+ 			} else {
+ 				void *p;
+-				p = reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
++				p = pw_reallocarray(this->info.params, info->n_params, sizeof(struct spa_param_info));
+ 				if (p == NULL) {
+ 					free(this->info.params);
+ 					this->info.params = NULL;
+diff --git a/src/pipewire/introspect.c b/src/pipewire/introspect.c
+index 35598a90d..2855009c0 100644
+--- a/src/pipewire/introspect.c
++++ b/src/pipewire/introspect.c
+@@ -213,7 +213,7 @@ struct pw_node_info *pw_node_info_merge(struct pw_node_info *info,
+ 		uint32_t i, user, n_params = update->n_params;
+ 		void *np;
+ 
+-		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
++		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
+ 		if (np == NULL) {
+ 			free(info->params);
+ 			info->params = NULL;
+@@ -283,7 +283,7 @@ struct pw_port_info *pw_port_info_merge(struct pw_port_info *info,
+ 		uint32_t i, user, n_params = update->n_params;
+ 		void *np;
+ 
+-		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
++		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
+ 		if (np == NULL) {
+ 			free(info->params);
+ 			info->params = NULL;
+@@ -443,7 +443,7 @@ struct pw_device_info *pw_device_info_merge(struct pw_device_info *info,
+ 		uint32_t i, user, n_params = update->n_params;
+ 		void *np;
+ 
+-		np = reallocarray(info->params, n_params, sizeof(struct spa_param_info));
++		np = pw_reallocarray(info->params, n_params, sizeof(struct spa_param_info));
+ 		if (np == NULL) {
+ 			free(info->params);
+ 			info->params = NULL;
+diff --git a/src/pipewire/utils.c b/src/pipewire/utils.c
+index 2f3240faf..a644049fd 100644
+--- a/src/pipewire/utils.c
++++ b/src/pipewire/utils.c
+@@ -168,3 +168,13 @@ ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags)
+ 	close(fd);
+ 	return bytes;
+ }
++
++SPA_EXPORT
++void* pw_reallocarray(void *ptr, size_t nmemb, size_t size)
++{
++#ifdef HAVE_REALLOCARRAY
++	return reallocarray(ptr, nmemb, size);
++#else
++	return realloc(ptr, nmemb * size);
++#endif
++}
+diff --git a/src/pipewire/utils.h b/src/pipewire/utils.h
+index 8f8e002b7..b320db22f 100644
+--- a/src/pipewire/utils.h
++++ b/src/pipewire/utils.h
+@@ -88,6 +88,8 @@ pw_strip(char *str, const char *whitespace);
+ 
+ ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags);
+ 
++void* pw_reallocarray(void *ptr, size_t nmemb, size_t size);
++
+ /**
+  * \}
+  */
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
