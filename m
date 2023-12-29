Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8699C47074
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5743443706;
	Fri, 29 Dec 2023 21:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5743443706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtVQbLVQMwPb; Fri, 29 Dec 2023 21:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7EE843703;
	Fri, 29 Dec 2023 21:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7EE843703
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0DF41BF288
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96EC36068F
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EC36068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJcsIjc4-Ui8 for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:24:11 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E773E60670
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E773E60670
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B5074B0051B;
 Fri, 29 Dec 2023 22:24:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 22:24:05 +0100
Date: Fri, 29 Dec 2023 22:24:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZY849Tu9SCh-P7ed@landeda>
References: <20231227100158.124316-1-fontaine.fabrice@gmail.com>
 <20231227100158.124316-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227100158.124316-2-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703885048;
 bh=+LwTWEiR25dZ7IFqhxa4mZLBwC2l4r0dZXPS33JPNUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KuG8Rt+OODWSi6A6ZmAGMutmF9yOAmQSoTHKK+IMZ+QqKiqgngKHr9VMS1bTHKv2h
 nNDRamTzYKZXQG4qisYSVF6SMOzWQ6XKqyZZ+CVujqyUKYWUYXJR6Fc/KmEu48E68F
 ldceXimstQ12g1BYYqW8OnzEPt3pGE30f+VBw1xoO9aLMmkZVtAOnQkEwvj5VnwFAA
 Yt/9UQUihvEwPzoG623G5kSVC6S/6F9FRbBBteehzyFs+WTp94Sp9Oa8dpEc0Xqrdp
 FxAHAb5DHjN5w3YCqDpAntnTrf0LFJdx7uAQZQ6Hry9VNNrSs8fCJyp+9+yij4Ogx6
 3Ag8JYQROd4rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KuG8Rt+O
Subject: Re: [Buildroot] [PATCH 2/2] package/gupnp: bump to version 1.6.6
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-27 11:01 +0100, Fabrice Fontaine spake thusly:
> - Drop patches (already in version)
> - Add patch to fix build with libxml2 2.12
> 
> https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.6/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-all-Drop-xmlRecoverMemory.patch      | 113 ------------------
>  ...ix-compatibility-with-libxml2-2-12-x.patch |  84 +++++++++++++
>  ...properly-spell-provide-in-wrap-files.patch |  30 -----
>  package/gupnp/gupnp.hash                      |   4 +-
>  package/gupnp/gupnp.mk                        |   4 +-
>  5 files changed, 88 insertions(+), 147 deletions(-)
>  delete mode 100644 package/gupnp/0001-all-Drop-xmlRecoverMemory.patch
>  create mode 100644 package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
>  delete mode 100644 package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
> 
> diff --git a/package/gupnp/0001-all-Drop-xmlRecoverMemory.patch b/package/gupnp/0001-all-Drop-xmlRecoverMemory.patch
> deleted file mode 100644
> index 46e09c267e..0000000000
> --- a/package/gupnp/0001-all-Drop-xmlRecoverMemory.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From c3d084736cca81dd4ec05f7e4b634050eb6e8525 Mon Sep 17 00:00:00 2001
> -From: Jens Georg <mail@jensge.org>
> -Date: Thu, 4 May 2023 19:14:29 +0200
> -Subject: [PATCH] all: Drop xmlRecoverMemory
> -
> -use xmlReadMemory, also use NONET flat
> -
> -Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -[Bernd: backported to branch gupnp-1.4]
> ----
> - libgupnp/gupnp-control-point.c        | 7 +++++--
> - libgupnp/gupnp-service-info.c         | 8 ++++++--
> - libgupnp/gupnp-service-proxy-action.c | 7 +++++--
> - libgupnp/gupnp-service-proxy.c        | 7 +++++--
> - libgupnp/gupnp-service.c              | 7 +++++--
> - 5 files changed, 26 insertions(+), 10 deletions(-)
> -
> -diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-point.c
> -index deb4b42..17c485a 100644
> ---- a/libgupnp/gupnp-control-point.c
> -+++ b/libgupnp/gupnp-control-point.c
> -@@ -613,8 +613,11 @@ got_description_url (SoupSession           *session,
> -                 xmlDoc *xml_doc;
> - 
> -                 /* Parse response */
> --                xml_doc = xmlRecoverMemory (msg->response_body->data,
> --                                            msg->response_body->length);
> -+                xml_doc = xmlReadMemory (msg->response_body->data,
> -+                                         msg->response_body->length,
> -+                                         NULL,
> -+                                         NULL,
> -+                                         XML_PARSE_NONET | XML_PARSE_RECOVER);
> -                 if (xml_doc) {
> -                         doc = gupnp_xml_doc_new (xml_doc);
> - 
> -diff --git a/libgupnp/gupnp-service-info.c b/libgupnp/gupnp-service-info.c
> -index 9a9f4de..1c7489e 100644
> ---- a/libgupnp/gupnp-service-info.c
> -+++ b/libgupnp/gupnp-service-info.c
> -@@ -592,8 +592,12 @@ got_scpd_url (G_GNUC_UNUSED SoupSession *session,
> -         if (SOUP_STATUS_IS_SUCCESSFUL (msg->status_code)) {
> -                 xmlDoc *scpd;
> - 
> --                scpd = xmlRecoverMemory (msg->response_body->data,
> --                                         msg->response_body->length);
> -+                scpd = xmlReadMemory (msg->response_body->data,
> -+                                      msg->response_body->length,
> -+                                      NULL,
> -+                                      NULL,
> -+                                      XML_PARSE_NONET | XML_PARSE_RECOVER);
> -+
> -                 if (scpd) {
> -                         introspection = gupnp_service_introspection_new (scpd);
> - 
> -diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-service-proxy-action.c
> -index f089152..079219f 100644
> ---- a/libgupnp/gupnp-service-proxy-action.c
> -+++ b/libgupnp/gupnp-service-proxy-action.c
> -@@ -87,8 +87,11 @@ check_action_response (G_GNUC_UNUSED GUPnPServiceProxy *proxy,
> -         }
> - 
> -         /* Parse response */
> --        response = xmlRecoverMemory (action->msg->response_body->data,
> --                                     action->msg->response_body->length);
> -+        response = xmlReadMemory (action->msg->response_body->data,
> -+                                  action->msg->response_body->length,
> -+                                  NULL,
> -+                                  NULL,
> -+                                  XML_PARSE_NONET | XML_PARSE_RECOVER);
> - 
> -         if (!response) {
> -                 if (action->msg->status_code == SOUP_STATUS_OK) {
> -diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-proxy.c
> -index 5dd1bfc..eed9882 100644
> ---- a/libgupnp/gupnp-service-proxy.c
> -+++ b/libgupnp/gupnp-service-proxy.c
> -@@ -1561,8 +1561,11 @@ server_handler (G_GNUC_UNUSED SoupServer        *soup_server,
> -         }
> - 
> -         /* Parse the actual XML message content */
> --        doc = xmlRecoverMemory (msg->request_body->data,
> --                                msg->request_body->length);
> -+        doc = xmlReadMemory (msg->request_body->data,
> -+                             msg->request_body->length,
> -+                             NULL,
> -+                             NULL,
> -+                             XML_PARSE_NONET | XML_PARSE_RECOVER);
> -         if (doc == NULL) {
> -                 /* Failed */
> -                 g_warning ("Failed to parse NOTIFY message body");
> -diff --git a/libgupnp/gupnp-service.c b/libgupnp/gupnp-service.c
> -index 2794ebc..e82daaa 100644
> ---- a/libgupnp/gupnp-service.c
> -+++ b/libgupnp/gupnp-service.c
> -@@ -1002,8 +1002,11 @@ control_server_handler (SoupServer                      *server,
> -                 *end = '\0';
> - 
> -         /* Parse action_node */
> --        doc = xmlRecoverMemory (msg->request_body->data,
> --                                msg->request_body->length);
> -+        doc = xmlReadMemory (msg->request_body->data,
> -+                             msg->request_body->length,
> -+                             NULL,
> -+                             NULL,
> -+                             XML_PARSE_NONET | XML_PARSE_RECOVER);
> -         if (doc == NULL) {
> -                 soup_message_set_status (msg, SOUP_STATUS_BAD_REQUEST);
> - 
> --- 
> -2.39.2
> -
> diff --git a/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch b/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
> new file mode 100644
> index 0000000000..14f696ca80
> --- /dev/null
> +++ b/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
> @@ -0,0 +1,84 @@
> +From 00514fb62ebd341803fa44e26a6482a8c25dbd34 Mon Sep 17 00:00:00 2001
> +From: Jens Georg <mail@jensge.org>
> +Date: Sat, 25 Nov 2023 17:56:02 +0100
> +Subject: [PATCH] all: Fix compatibility with libxml2 2.12.x
> +
> +Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/00514fb62ebd341803fa44e26a6482a8c25dbd34
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libgupnp/gupnp-control-point.c        | 2 ++
> + libgupnp/gupnp-service-proxy-action.c | 2 ++
> + libgupnp/gupnp-service-proxy.c        | 2 ++
> + libgupnp/gupnp-xml-doc.c              | 3 +++
> + libgupnp/xml-util.h                   | 2 ++
> + 5 files changed, 11 insertions(+)
> +
> +diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-point.c
> +index d4b44721..4374f726 100644
> +--- a/libgupnp/gupnp-control-point.c
> ++++ b/libgupnp/gupnp-control-point.c
> +@@ -27,6 +27,8 @@
> + #include <config.h>
> + #include <string.h>
> + 
> ++#include <libxml/parser.h>
> ++
> + #include "gupnp-control-point.h"
> + #include "gupnp-context-private.h"
> + #include "gupnp-resource-factory-private.h"
> +diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-service-proxy-action.c
> +index b241d86c..6ea241ad 100644
> +--- a/libgupnp/gupnp-service-proxy-action.c
> ++++ b/libgupnp/gupnp-service-proxy-action.c
> +@@ -9,6 +9,8 @@
> + 
> + #include <config.h>
> + 
> ++#include <libxml/parser.h>
> ++
> + #include "gupnp-error.h"
> + #include "gupnp-service-proxy.h"
> + #include "gvalue-util.h"
> +diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-proxy.c
> +index adba5ab0..3f1a4454 100644
> +--- a/libgupnp/gupnp-service-proxy.c
> ++++ b/libgupnp/gupnp-service-proxy.c
> +@@ -16,6 +16,8 @@
> + #include <locale.h>
> + #include <errno.h>
> + 
> ++#include <libxml/globals.h>
> ++
> + #include "gena-protocol.h"
> + #include "gupnp-context-private.h"
> + #include "gupnp-error-private.h"
> +diff --git a/libgupnp/gupnp-xml-doc.c b/libgupnp/gupnp-xml-doc.c
> +index 627f1a28..66f9b3dd 100644
> +--- a/libgupnp/gupnp-xml-doc.c
> ++++ b/libgupnp/gupnp-xml-doc.c
> +@@ -15,6 +15,9 @@
> + #include <config.h>
> + #include <string.h>
> + #include <gio/gio.h>
> ++
> ++#include <libxml/parser.h>
> ++
> + #include "gupnp-xml-doc.h"
> + #include "gupnp-error.h"
> + 
> +diff --git a/libgupnp/xml-util.h b/libgupnp/xml-util.h
> +index a02eb3d4..d0dcaeba 100644
> +--- a/libgupnp/xml-util.h
> ++++ b/libgupnp/xml-util.h
> +@@ -10,6 +10,8 @@
> + #define GUPNP_XML_UTIL_H
> + 
> + #include <libxml/tree.h>
> ++#include <libxml/parser.h>
> ++
> + #include <stdarg.h>
> + #include <glib-object.h>
> + 
> +-- 
> +GitLab
> +
> diff --git a/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch b/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
> deleted file mode 100644
> index 0632469a98..0000000000
> --- a/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 884639bd29323cbb8fbd36bc69d08097a2ae2cd1 Mon Sep 17 00:00:00 2001
> -From: Jan Beich <jbeich@FreeBSD.org>
> -Date: Sun, 9 Jul 2023 03:30:47 +0000
> -Subject: [PATCH] build: properly spell [provide] in *.wrap files
> -
> -meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean "[provide]"?
> -
> -Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/884639bd29323cbb8fbd36bc69d08097a2ae2cd1
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -[Bernd: backported to branch gupnp-1.4]
> ----
> - subprojects/gssdp-1.6.wrap | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/subprojects/gssdp-1.6.wrap b/subprojects/gssdp-1.6.wrap
> -index b0b6504..8adc1a2 100644
> ---- a/subprojects/gssdp-1.2.wrap
> -+++ b/subprojects/gssdp-1.2.wrap
> -@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gssdp.git
> - revision = gssdp-1.4
> - depth = 1
> -  
> --[provides]
> -+[provide]
> - dependency_name = gssdp-1.2
> - 
> --- 
> -GitLab
> -
> diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
> index 823dbd7927..b8a3fa082e 100644
> --- a/package/gupnp/gupnp.hash
> +++ b/package/gupnp/gupnp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.3.sha256sum:
> -sha256  14eda777934da2df743d072489933bd9811332b7b5bf41626b8032efb28b33ba  gupnp-1.4.3.tar.xz
> +# Hash from: https://download.gnome.org/sources/gupnp/1.6/gupnp-1.6.6.sha256sum:
> +sha256  c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3dae2891e311a993a574f5a04f  gupnp-1.6.6.tar.xz
>  
>  # Hash for license file:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index f41f26d2dd..cfcc114189 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -GUPNP_VERSION_MAJOR = 1.4
> -GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).3
> +GUPNP_VERSION_MAJOR = 1.6
> +GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).6
>  GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
>  GUPNP_SITE = https://download.gnome.org/sources/gupnp/$(GUPNP_VERSION_MAJOR)
>  GUPNP_LICENSE = LGPL-2.1+
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
