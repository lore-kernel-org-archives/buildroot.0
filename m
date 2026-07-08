Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C1C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5981C409B4;
	Fri, 10 Jul 2026 13:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dnw3Qd3tqs1z; Fri, 10 Jul 2026 13:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 155984092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690997;
	bh=HtvVPs/5WzIGEB1vSRUfW7aUyr3nZonclIxC+BrG0WI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KLSPLnfmVQUeqvtZ6+LU5xQitpER3t8idFDg8mHqxWf6LqTVygejtQ1HpS5tjuNK3
	 j5S7SIRRPxNQ0HEeQo7B8fcnQzxdahkIvJ0UJiCobt5ixlfwvSKuEhu1arytZxecpG
	 Xa4/q9evH6x1c9XwxFNfF4+IjIIs/l9AdEXFmE/xEtQjdKZyO6B4fkDSGjX9HU5UK1
	 iO/i6djiz+gFmSwaiPm2ne4tGPgNEBTpsuShKlPRteG5lTHSk3+zWfnAKYCWK85o/a
	 7QwkwGOWMB+G6gCLGaS3Gl3utjDnAfhvNC0Es9kN/jvxAtk89uj8q5T5sPylO6A7o3
	 YQDUhTtoKdCHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155984092B;
	Fri, 10 Jul 2026 13:43:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C369FFD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B588380FF5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrGThbNEPAvY for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08C9810B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C08C9810B5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 026968867A; Fri, 10 Jul 2026 13:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:59:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7508b24b8f1b5788b27863c17f9383035ca4f364
X-Git-Newrev: 413158f39b9d070983821f6157f7abb20de6790c
X-Patchwork-Hint: ignore
Message-Id: <20260710134218.026968867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/avahi: upstream
 patch for CVE-2026-34933
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/413158f39b9d070983821f6157f7abb20de6790c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:

- CVE-2026-34933:
    Avahi is a system which facilitates service discovery on a local
    network via the mDNS/DNS-SD protocol suite. Prior to version 0.9-rc4,
    any unprivileged local user can crash avahi-daemon by sending a single
    D-Bus method call with conflicting publish flags. This issue has been
    patched in version 0.9-rc4.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-34933
  - https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 88f3b8366ba8b7272e3e0b4c901a9aab75c9304a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...here-both-wide-area-and-multicast-are-set.patch | 106 +++++++++++++++++++++
 package/avahi/avahi.mk                             |   3 +
 2 files changed, 109 insertions(+)

diff --git a/package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch b/package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch
new file mode 100644
index 0000000000..de359b7d22
--- /dev/null
+++ b/package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch
@@ -0,0 +1,106 @@
+From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 1 Apr 2026 05:31:58 +0000
+Subject: [PATCH] core: refuse to accept publish flags where both wide_area and
+ multicast are set
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon via D-Bus by calling EntryGroup methods accepting
+flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and
+AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was
+invoked like that avahi-daemon crashed with
+```
+dbus-entry-group.c: interface=org.freedesktop.Avahi.EntryGroup, path=/Client0/EntryGroup1, member=AddRecord
+avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion `!((*flags & AVAHI_PUBLISH_USE_MULTICAST) && (*flags & AVAHI_PUBLISH_USE_WIDE_AREA))' failed.
+==84944==
+==84944== Process terminating with default action of signal 6 (SIGABRT)
+==84944==    at 0x4B353BC: __pthread_kill_implementation (pthread_kill.c:44)
+==84944==    by 0x4ADE941: raise (raise.c:26)
+==84944==    by 0x4AC64AB: abort (abort.c:77)
+==84944==    by 0x4AC641F: __assert_fail_base.cold (assert.c:118)
+==84944==    by 0x48A9404: transport_flags_from_domain (entry.c:57)
+==84944==    by 0x48A9F8F: server_add_internal (entry.c:224)
+==84944==    by 0x48AA49F: avahi_server_add (entry.c:324)
+==84944==    by 0x401A670: avahi_dbus_msg_entry_group_impl (dbus-entry-group.c:348)
+==84944==    by 0x4A70741: ??? (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x4A5FB22: dbus_connection_dispatch (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x401D01D: dispatch_timeout_callback (dbus-watch-glue.c:105)
+==84944==    by 0x488E3AE: timeout_callback (simple-watch.c:447)
+==84944==
+```
+It's a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where
+those flags were introduced and consistent with the other places
+where wide_area/multicast flags are used.
+
+It was discovered by
+Guillaume Meunier - Head of Vulnerability Operations Center France - Orange Cyberdefense
+
+https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc
+
+CVE: CVE-2026-34933
+Upstream: https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/entry.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/avahi-core/entry.c b/avahi-core/entry.c
+index 0d862133d..06eb12076 100644
+--- a/avahi-core/entry.c
++++ b/avahi-core/entry.c
+@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(
+                                          AVAHI_PUBLISH_UPDATE|
+                                          AVAHI_PUBLISH_USE_WIDE_AREA|
+                                          AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_domain_name(r->key->name), AVAHI_ERR_INVALID_HOST_NAME);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r->ttl != 0, AVAHI_ERR_INVALID_TTL);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_pattern(r->key), AVAHI_ERR_IS_PATTERN);
+@@ -454,6 +455,7 @@ int avahi_server_add_address(
+                                               AVAHI_PUBLISH_UPDATE|
+                                               AVAHI_PUBLISH_USE_WIDE_AREA|
+                                               AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     /* Prepare the host naem */
+@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_UPDATE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_NO_COOKIE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_PROTO_VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(
+     assert(name);
+ 
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(
+     AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) && AVAHI_PROTO_VALID(address->proto), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b3d95f3d79..d01dc0cd87 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -60,6 +60,9 @@ AVAHI_IGNORE_CVES += CVE-2025-68471
 # 0016-core-fix-uncontrolled-recursion-bug-using-a-simple-loop-detection-algorithm.patch
 AVAHI_IGNORE_CVES += CVE-2026-24401
 
+# 0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch
+AVAHI_IGNORE_CVES += CVE-2026-34933
+
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
