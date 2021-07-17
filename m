Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289FAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:36:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9FE60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD9FE60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EB142235;
	Tue,  3 Aug 2021 23:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyhWXsO2t_eS; Tue,  3 Aug 2021 23:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C344220C;
	Tue,  3 Aug 2021 23:36:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 422BA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4598A40E85
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ME6VOv98IJbs for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE34140688
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1EA7986A84; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 12:02:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1352b59eb2e48162af13d37287c00c23776b02bb
X-Git-Newrev: dd7b9fa02bbac679540f50f69d175bac6af65904
X-Patchwork-Hint: ignore
Message-Id: <20210803211006.1EA7986A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/avahi: fix
 CVE-2021-36217
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dd7b9fa02bbac679540f50f69d175bac6af65904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Avahi 0.8 allows a local denial of service (NULL pointer dereference and
daemon crash) against avahi-daemon via the D-Bus interface or a "ping
.local" command.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-NULL-pointer-crashes-from-175.patch   | 152 +++++++++++++++++++++
 package/avahi/avahi.mk                             |   3 +
 2 files changed, 155 insertions(+)

diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
new file mode 100644
index 0000000000..7e191e8da7
--- /dev/null
+++ b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
@@ -0,0 +1,152 @@
+From 9d31939e55280a733d930b15ac9e4dda4497680c Mon Sep 17 00:00:00 2001
+From: Tommi Rantala <tommi.t.rantala@nokia.com>
+Date: Mon, 8 Feb 2021 11:04:43 +0200
+Subject: [PATCH] Fix NULL pointer crashes from #175
+
+avahi-daemon is crashing when running "ping .local".
+The crash is due to failing assertion from NULL pointer.
+Add missing NULL pointer checks to fix it.
+
+Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
+
+[Retrieved from:
+https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ avahi-core/browse-dns-server.c   | 5 ++++-
+ avahi-core/browse-domain.c       | 5 ++++-
+ avahi-core/browse-service-type.c | 3 +++
+ avahi-core/browse-service.c      | 3 +++
+ avahi-core/browse.c              | 3 +++
+ avahi-core/resolve-address.c     | 5 ++++-
+ avahi-core/resolve-host-name.c   | 5 ++++-
+ avahi-core/resolve-service.c     | 5 ++++-
+ 8 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/avahi-core/browse-dns-server.c b/avahi-core/browse-dns-server.c
+index 049752e9..c2d914fa 100644
+--- a/avahi-core/browse-dns-server.c
++++ b/avahi-core/browse-dns-server.c
+@@ -343,7 +343,10 @@ AvahiSDNSServerBrowser *avahi_s_dns_server_browser_new(
+         AvahiSDNSServerBrowser* b;
+ 
+         b = avahi_s_dns_server_browser_prepare(server, interface, protocol, domain, type, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_dns_server_browser_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-domain.c b/avahi-core/browse-domain.c
+index f145d56a..06fa70c0 100644
+--- a/avahi-core/browse-domain.c
++++ b/avahi-core/browse-domain.c
+@@ -253,7 +253,10 @@ AvahiSDomainBrowser *avahi_s_domain_browser_new(
+         AvahiSDomainBrowser *b;
+ 
+         b = avahi_s_domain_browser_prepare(server, interface, protocol, domain, type, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_domain_browser_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-service-type.c b/avahi-core/browse-service-type.c
+index fdd22dcd..b1fc7af8 100644
+--- a/avahi-core/browse-service-type.c
++++ b/avahi-core/browse-service-type.c
+@@ -171,6 +171,9 @@ AvahiSServiceTypeBrowser *avahi_s_service_type_browser_new(
+         AvahiSServiceTypeBrowser *b;
+ 
+         b = avahi_s_service_type_browser_prepare(server, interface, protocol, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_type_browser_start(b);
+ 
+         return b;
+diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
+index 5531360c..63e0275a 100644
+--- a/avahi-core/browse-service.c
++++ b/avahi-core/browse-service.c
+@@ -184,6 +184,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_new(
+         AvahiSServiceBrowser *b;
+ 
+         b = avahi_s_service_browser_prepare(server, interface, protocol, service_type, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_browser_start(b);
+ 
+         return b;
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e579..e8a915e9 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -634,6 +634,9 @@ AvahiSRecordBrowser *avahi_s_record_browser_new(
+         AvahiSRecordBrowser *b;
+ 
+         b = avahi_s_record_browser_prepare(server, interface, protocol, key, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_record_browser_start_query(b);
+ 
+         return b;
+diff --git a/avahi-core/resolve-address.c b/avahi-core/resolve-address.c
+index ac0b29b1..e61dd242 100644
+--- a/avahi-core/resolve-address.c
++++ b/avahi-core/resolve-address.c
+@@ -286,7 +286,10 @@ AvahiSAddressResolver *avahi_s_address_resolver_new(
+         AvahiSAddressResolver *b;
+ 
+         b = avahi_s_address_resolver_prepare(server, interface, protocol, address, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_address_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-host-name.c b/avahi-core/resolve-host-name.c
+index 808b0e72..4e8e5973 100644
+--- a/avahi-core/resolve-host-name.c
++++ b/avahi-core/resolve-host-name.c
+@@ -318,7 +318,10 @@ AvahiSHostNameResolver *avahi_s_host_name_resolver_new(
+         AvahiSHostNameResolver *b;
+ 
+         b = avahi_s_host_name_resolver_prepare(server, interface, protocol, host_name, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_host_name_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-service.c b/avahi-core/resolve-service.c
+index 66bf3cae..43771763 100644
+--- a/avahi-core/resolve-service.c
++++ b/avahi-core/resolve-service.c
+@@ -519,7 +519,10 @@ AvahiSServiceResolver *avahi_s_service_resolver_new(
+         AvahiSServiceResolver *b;
+ 
+         b = avahi_s_service_resolver_prepare(server, interface, protocol, name, type, domain, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b71fc189a0..9976df5357 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -15,6 +15,9 @@ AVAHI_INSTALL_STAGING = YES
 # part of the Debian packaging and not part of upstream avahi
 AVAHI_IGNORE_CVES += CVE-2021-26720
 
+# 0001-Fix-NULL-pointer-crashes-from-175.patch
+AVAHI_IGNORE_CVES += CVE-2021-36217
+
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
