Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95687606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KWRTQ8Gi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE2D8177A;
	Fri, 23 Oct 2026 12:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_ayZCVOzlUd; Fri, 23 Oct 2026 12:33:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A2E481770
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758779;
	b=oT/GGlWh/tqi11dXF4f/311YJA+dptEqwck0/9o1iBXxjs1MPKAIL3/ik3TIH3lLtbL4
	 Pa80QE3uRDwCtsT/m5V/lefeH2W5BDWsHmry/v8KqaGl85Lnr48xx4+ip2pH9ldnUAhkg
	 X45K/FxR+6ta/Ccy+NXFrOawlX7XlVgNtLf4P9aKtwMUCGRi55TA3HVbYwYZIvDDDwYD4
	 Id+YgOcYllbl77SGR3thg0s47Cim//f2R4R/S7fWVJcnCWFg0Js1EY7u6z0xo8TDnKjbb
	 FFYRyLKH1T/PgeIbfs+36hGXTRDNN5pfBFw6dMpPs7Kbu8lBKVgyKUCFMv8IiF4gc9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9w07sPXYBnCoKYOkkSm/t8WnHlEx/QfOTMV3CehVn6g=;
	b=mYTxH053ZqA0ph+3N25L9ugmZwdE4VxTyLxf/P1DEwUoDZmcCINWHhtJuIkk3mnTCT2X
	 vMZ+tzcji9MO0yJp+PYTfnQQHYi1V4UEN+qIjGa0C43vxdxZLLLqZFf6JBL6JAOPEW6tH
	 7J3mvxA0dULNMeTibBNLSAcQsoNdtskDTdmzPQIB927DmFKTokYaH7eiqyvgRRIWJQT/k
	 hu/yN/RW0vxK9Trul4Ox3uS6fWWEvdOtVDV2IhtpFYTlsscfTO2eGVlsBtkfeywoMB9+E
	 GFPJUf4ifXEI8s1ecQTrNaEzoHXlNuFBlQRjTQnc74YTLSMS2fDpUTfHXz6HGb8UTzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758779;
	bh=9w07sPXYBnCoKYOkkSm/t8WnHlEx/QfOTMV3CehVn6g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KWRTQ8GiueIVB6QB9J8+OyMp8QC+IEY/8CwBBWeds/0Y+3K/abRTFIU/gA9b5X3Gj
	 pGc6kNDduywB+4R/hUhGM3ibxQim09KHkJek57mT/VeaFYNkWo84K8ZPELB/uRERbD
	 f42B7arag+i369M3KfwN5FSMNBkHCzgmprBZ46Raxb0uQ3AvdCgEaAPtuCERcuUwyW
	 Cj784+u/FmZiID1wG1gBbmaWOL8pyvjnTXRKi9VibOKXXdUPozZHYusK3uVWNSUhkb
	 B9Kddv/7MKANp+Dz64jvtWjWsWphKC8ReWNfY0OZilj4mlaYi1z/wbXMCQ78qK6kBD
	 zcZ2MCnaqEy7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2E481770;
	Fri, 23 Oct 2026 12:32:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD8C712C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFE4F40928
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PyeeoUmaFro for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1089140933
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758734;
 b=gx9uPgGxq5GKwawy4N2Jb5gM7yibNnxrfQW3a2f33GIpDrIUeQZHjzKWBRvXTW0gUV+B
 ZBv81N1Pn2LVuc9Dz4buDyZNGwDS7hV21LW1qM1lXdQ7EloqOq9j3wRxcQXK/ta4pm9w7
 eXPR73psHiNmYNpHDvyJPgLx4Emblq+SoUf0kuaBLnpCUulqoGr0kSIY3iMKB24z5QUAN
 WUKmOc6JlB9NwlAAlKfgattfvXtaWwIl/hCWoZ2lLiwxpoDipTZyrPjP/qlXd9tKbDw5l
 pSIeFLpMw8VQkIct3Buju6AeAbocgKNSri0oviF5KxthQRNTpNtPDL2ld5ARZzLG7SQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758734;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2JNJgW4hxaFRWYjNTiAktWJoCK+yMs8/2w3vhqm2TCk=;
 b=aB43qhNhpzVYHaSm011hxJItL2UR8g+F5gt1K/QOfJkBeXpi0n0vHkYOARsnJ9obxmsg
 JavOIHih7NL+/0OkotfvsuChEg+wWEN3FXefNam6hdtzGnunp1YmpxY9cMaf5PN508zS2
 PLN4u+h7VL+Lerxy1IMSI+CHVYTUr2c2RKj0/ZcCtj3FbNfxL80thukQvkgUu7unEyWsE
 P5I9K/DIdfiKBbeuMpYsGVCDKLsQJs5KBch3IyeWOdfIIJLpZBrzMAug/LzUgCdnG98Rg
 kmpbRaFYbqnyG0/tP05U7yxknmk15MHSfrz6nkU4xcayEfbqyGK8UtZx77kDeotVepg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1089140933
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 791E99B9F8; Fri, 23 Oct 2026 12:30:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 21:02:03 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 64ca99d8b18169bad6fcaa57f5974acf28b7d359
X-Git-Newrev: 8b238854d909c9cce32ef9671d968b03e323b55d
X-Patchwork-Hint: ignore
Message-Id: <20261023123049.791E99B9F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/firewalld: fix
 CVE-2026-4948
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4540228839999405548=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4540228839999405548==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b238854d909c9cce32ef9671d968b03e323b55d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The setZoneSettings2 and setPolicySettings D-Bus methods are guarded
by the polkit "config.info" action instead of "config".  The desktop
polkit policy shipped with firewalld grants "config.info" to any user,
so a local unprivileged user can change the runtime firewall
configuration.

Backport of the upstream fix from firewalld v2.5.0, g5fb3914.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[raphael: resolve conflict with AUTORECONF]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch | 41 ++++++++++++++++++++++
 package/firewalld/firewalld.mk                     |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch b/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
new file mode 100644
index 0000000000..b875e69903
--- /dev/null
+++ b/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
@@ -0,0 +1,41 @@
+From 511a305c504e4c0928eda670598528309da3436d Mon Sep 17 00:00:00 2001
+From: Sizhe Zhao <prc.zhao@outlook.com>
+Date: Tue, 31 Mar 2026 20:46:50 +0800
+Subject: [PATCH] fix(policy): use PK_ACTION_CONFIG for
+ set{ZoneSettings2,PolicySettings}
+
+Reference: https://access.redhat.com/security/cve/cve-2026-4948
+
+Upstream: https://github.com/firewalld/firewalld/commit/5fb3914ad830feff6cb2b0670457c60a323c6c6c
+CVE: CVE-2026-4948
+[Joachim: backport to 2.0.2]
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+---
+ src/firewall/server/firewalld.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/firewall/server/firewalld.py b/src/firewall/server/firewalld.py
+index be53fbab..ceaa4322 100644
+--- a/src/firewall/server/firewalld.py
++++ b/src/firewall/server/firewalld.py
+@@ -946,7 +946,7 @@ class FirewallD(DbusServiceObject):
+         log.debug1("getZoneSettings2(%s)", zone)
+         return self.fw.zone.get_config_with_settings_dict(zone)
+ 
+-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
+     @dbus_service_method(config.dbus.DBUS_INTERFACE_ZONE, in_signature='sa{sv}')
+     @dbus_handle_exceptions
+     def setZoneSettings2(self, zone, settings, sender=None):
+@@ -970,7 +970,7 @@ class FirewallD(DbusServiceObject):
+         log.debug1("policy.getPolicySettings(%s)", policy)
+         return self.fw.policy.get_config_with_settings_dict(policy)
+ 
+-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
+     @dbus_service_method(config.dbus.DBUS_INTERFACE_POLICY, in_signature='sa{sv}')
+     @dbus_handle_exceptions
+     def setPolicySettings(self, policy, settings, sender=None):
+-- 
+2.43.0
+
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index c443ab3db4..c0167d40c7 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -10,6 +10,8 @@ FIREWALLD_SOURCE = firewalld-$(FIREWALLD_VERSION).tar.bz2
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
 FIREWALLD_CPE_ID_VENDOR = firewalld
+# 0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
+FIREWALLD_IGNORE_CVES = CVE-2026-4948
 
 FIREWALLD_DEPENDENCIES = \
 	host-intltool \

--===============4540228839999405548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4540228839999405548==--
