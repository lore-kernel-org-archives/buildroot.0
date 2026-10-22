Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0975F606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MnqQ7ED0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A67814A9;
	Fri, 23 Oct 2026 12:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GPsuVNC6krx; Fri, 23 Oct 2026 12:25:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A3443812DB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758301;
	b=OWatxG47uBPqfTi4GgzFC5e57fBK7ApvjSJ7vYATOwDN54V63FAjgijk5UOGw+NKpiBd
	 ShHDR1PRIulfwft+8XJe2WfpI4w8Q7wrfVGIznBdFbdY9yBNQkI3squQ2iVMS671nEDv2
	 ssTTJW8zMWAJ6ePuAA4ClLIGnxAiOR1gxpbwmgOXo3t2TD9kepMYN7hd0A0DOznmS7W1B
	 cV4B0yvG3bl8ro/jKtspr24SYDO2gM8Sg7sW6cE6E5fZeHl3gDPhh9BmazkiwGNolOOO0
	 HbCf1hUMAFqY/wK1dW/VHhZY7E1Ep/c9bAgCRtf6YB7yGuysD9G9zYWCVhkAbhlibyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758301;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=B9A/TuJZvYlzsiy0VEl9ZFec6qGySJTcCTaMQxdEVrc=;
	b=kNpP9F+mf++XWrS6NqO72ZvlXj2cdm7R0wiCNdipPqw2xfIBQ4jLlKdoAt/eTJxv1BL0
	 qznyxr0Je9dxvaCOUkuIEy3/ITyapFsU6Rygf+CMZ2uUivSinT1WpXiJak0d0sV5ZJmnE
	 HKNdZy0JIw9hqIl4CV92VIFhb9+PdgpIOFjLssoTd8qDV6H+ph7GvUETC9957olkW0Wz0
	 SzMeXMIeb+BDMM+ED5ql/I0F0Dyr+qRTmQdzLKE9trMXPYy0X5TMWDyWk4W7vg6Xi158C
	 Beh6VaVi3yxPJwIAOhzBdM9Axbf72CCoHddFKFflcWNm2qLRy/NVN217WmcDHD+sU4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758301;
	bh=B9A/TuJZvYlzsiy0VEl9ZFec6qGySJTcCTaMQxdEVrc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MnqQ7ED04C2g3x4j3YGEDI1SRBx2xI9eYx+Unw1YxuocUMjFwbWQPa0urlYJ55tPg
	 RmsGhqwuNIPuhhS9Ag6M6bnF2CEfNMyLMGkNHVh11z2gnnIkBaTq6WWPwSH2nnw+Yp
	 g+drDncV2qs80bNoKHuQuS9rBhiLCWCtJI2xFEvQvOLezKCI95EblzbasXW0D+Ie+n
	 XYIUlHx/8eWxInShSz/BE3s8U6NsN6uFRfQawPItfR13OnTMPJ2TJjHhM+T23TnGtm
	 u+Sy88Ug6WkmQaqtxTJjb6eLDqKWA6lq3cUlDXSufzO6Yw7Q721nBuYfqsH2ZsjoY3
	 584lqPN/BwVQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3443812DB;
	Fri, 23 Oct 2026 12:25:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D03D2739
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EBDF60633
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESB1OvGUL0Xi for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD73660618
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758282;
 b=q72Wi40vaLzZJ7PtG09d53JOIcRw55LAqbXfbP2MUgSi1tLVlkx6T7I4SS6plEBzb82F
 ZHw63/QiFPqRVlhLicy+3jiad5j/kaswCsImVVY/PwbTyxUGqRRpb7D4FXbdA6JfNQ83r
 7DVTVC3jX7U/WFKJ0D2g6Z54VR+7OsaTJR/q+Km3q+E7Bfi96u1nh31p+zCsUC6YWE5ap
 2TIjMQ8xZvWoLSmJta3zeAUvA6nlbnt/Cp/td4lPVa4I0mo5MIb+Mz3w33uWQIl4A3TQR
 TOcmUm9PLWKy39MyNFCbN8n6RxxKSWbqT0mkhf6gmeQkHIn2g+iF9Q7SsZqrRGfrtww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758282;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NsPI7Pv21JfyedwYIfeDx72Q39TSoLc0WQAR5/f58oE=;
 b=rdnz4H6MPTQGeGkN2PcHHgA1KBbSMaaFUfhr+hP+eeP8FXUZegNFhn/cDYyyOB0PVZua
 uDKpic8PypLhyng/QL5+S2s5IWfL9oABzhm3cGFwaYy8GTIdwv7bpEp52oKdyNqIwOT8P
 zYJjJ84JGLcYX41Ms2PXzf4nKDojC3piGv9K0DkyZ53LDQt8VZFB8AOgXxkbv9PpmHmgD
 D6YFk9S/j3FAvSMfEUWw4NB+4/AkOLUf90EumoLd7mb7oS+npVlrDy8+euEDjuv7i/GMi
 j5myqb05PDbLjv+BltQSpF2/pHA5Ur17PvCHARtNVwIwq7vFepxnm6BHuE6MOI3Em0w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD73660618
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 649049C66A; Fri, 23 Oct 2026 12:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f9b94b567edd26d2e53cd59877133ed9f5383cab
X-Git-Newrev: 0a9b75673ad0bd68d913cdfcb55676a44e448159
X-Patchwork-Hint: ignore
Message-Id: <20261023122318.649049C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/firewalld: fix
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
Content-Type: multipart/mixed; boundary="===============3338727235537185824=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3338727235537185824==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a9b75673ad0bd68d913cdfcb55676a44e448159
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The setZoneSettings2 and setPolicySettings D-Bus methods are guarded
by the polkit "config.info" action instead of "config".  The desktop
polkit policy shipped with firewalld grants "config.info" to any user,
so a local unprivileged user can change the runtime firewall
configuration.

Backport of the upstream fix from firewalld v2.5.0, g5fb3914.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
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
index eae8afc27f..d2c87267c6 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -9,6 +9,8 @@ FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
 FIREWALLD_CPE_ID_VENDOR = firewalld
+# 0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
+FIREWALLD_IGNORE_CVES = CVE-2026-4948
 FIREWALLD_AUTORECONF = YES
 
 FIREWALLD_DEPENDENCIES = \

--===============3338727235537185824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3338727235537185824==--
