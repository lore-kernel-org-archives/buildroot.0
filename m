Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qi5MiYN4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4677581167;
	Fri, 30 Oct 2026 20:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFG9s2AT9TUM; Fri, 30 Oct 2026 20:43:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DEB9880FF2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793393039;
	b=Tbrk0dEj1OeD6XXbF9ammrbXyu/W+DT8VImVmo939qXtic2L14q1zDvblSoLOlbobvL7
	 zJiwbdILFfSICWqDgzRwFiZx499Lue3i+R+xTl62cpDQacJRyA0v330oFFUcIA31F6/AU
	 uwjfbeh5fyBxdUjZAYyuVKh+uMtg8M659YvJle9/V/XYdnAPOt76Y3EvdVFFj4zY+EJJt
	 9NjqZLvV4GI/ecXlOSUBgUz836G/O6H7/pXx0F7ToTKYbrHxIdjJsntjJCkkVWaL7dIHD
	 RhPVbih/xKei2Vqe9TtddkZzzVSMbiNwyYZmiCuEEMP4w9Yz7cU/xLb//UNfSih7QRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793393039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H/xkVvxWBXHsYq2m8yKnzPernZwXjIcO1JbA5kUVb1Q=;
	b=MCfXDLOhJiaoI0yobAukSQ8wWyMjZAV2apdBjx4hE62EF2eYahG/PLhJ6GsmoCiH1pN0
	 ILkah37RjC53vSuOkk0ixqQfAD7geUz+rBUCJfd1O/k54cfs+8lm782txhMbKDq3d2l/y
	 HvS1TCKhsbDMJIAhiwxhTbnXh6VrUCjsJs/hd8aG0l06poV4Imf19962uMTBXCDk9nan6
	 OkXxXdG/yqQJB4wZdiDiMclIl5Y5spdJBn/P5iutSQuVo9B2YlhlHW7l+gjyalMI5CANQ
	 +h+5HYDXGKwI40neqRk8bmdcpq20IX8/D55585RC7Tfy27IFsbJ4e530ywFz7aObV/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793393039;
	bh=H/xkVvxWBXHsYq2m8yKnzPernZwXjIcO1JbA5kUVb1Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qi5MiYN4AQLQVMOl8D0Nsvoiv8DqwXnOG8nWEY46JI03+cRCygN/TdZvDlJkngQxp
	 SiWyXBn6h2X8tw2jC+LJ6wRn08q0NaK5TMCE8827E73UoEJGqtDFHVyJ+qhsmvSkML
	 41+HXdWrJOmz6lFv2MbrRu8FmJ70VKMkmK4+5AEttWK47EIqeKJQFe3fZMg+tdphk1
	 EkG1JL8fa5JQYdQ71z2HgFJ8633DUbWLVRFwVUklFnKH347OOt8kwYBAFBxz0g+Iz+
	 l/tZeTR6IcgLPC22DRMxGrXgocK9r8cGyz9VcfjMeP06For4t5/6S798oIlOhxBJLZ
	 vigJ355Ayd1yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB9880FF2;
	Fri, 30 Oct 2026 20:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E305362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC9840B0F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QeuhrDiD3DJ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:43:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F137540B0E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793393035;
 b=rkjO8CtjUJ2Ku3hkqTOy05nQH38hENUjV+W2w8th0BfF/QN2LXxfqedrgbxRPquflGVd
 Ke0lw7ZbyEC5wmHvLLMgQuEzQH4/aLim87moaapkUP8RR0/psZPEwadTyj0EMtFgLlRUZ
 FctqKlD6BN+uQW0erpCHkst42CQe8LLZOTRJeUlCVjBINvNAdFzuiRBeZFkjFQPXiUlCT
 wVNCLmV2HdPl026YfRJJTHJj8Isig/uGGG7OWCbHL+I1KTvJAz3TN7bcyN1Aaqu+tDvQe
 BCH8CpRhwbOILR0q9kAbSvN0bE9CtM58fR32R84jrDUxFhLVAzgZhSFhN55fyDhr0Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793393035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MKSn7NHRAFrKgKl55UxYP5TsQbY9ICLQq47FPoOSQBU=;
 b=b1k1ImYYcp25kmGpAkklSJ8sUJwiLSHCrhuaZIckY/4ecpbroQsjE143omi9kAnQSeKl
 kYAZ7yo6fCbXWJ8k0ZH1AM0PLWjNVnphPLR75x5KEpvfeGaFHDf+9Dh0FzzkbSaLoJ/um
 T9RDxy+jV3Db8MEI6fjkxWIhzk7OIBRfKrvlaHK7IWdnQK6r61DqOf8/8CAbqA3XKDl7G
 4bdR62l2G6n7zje/wJrfZDFEcQxTOKgVekc4wZ4Fk7ELMlaQZUTNQWGF+ITeGpKGhN5Yl
 +w7BdZVic5EkLDQi26gOyOR9VBllVSAf7vGN6BhlG6xiadvG2rnez2qWk+xQYVr+7/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F137540B0E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:43:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FE179D3CD; Fri, 30 Oct 2026 20:42:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 21:28:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d1d3cc564e84180ca03696267efad068977c6b9
X-Git-Newrev: 4dab6840c8cf2bb6ddad96c39977a10564d45e47
X-Patchwork-Hint: ignore
Message-Id: <20261030204226.8FE179D3CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: bump to version 1.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4dab6840c8cf2bb6ddad96c39977a10564d45e47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop patches 0002 and 0003, merged upstream.

Regenerate patch 0001, as one of its context lines changed in the new
release and patches are applied with a fuzz factor of 0.

Release notes:
https://github.com/fail2ban/fail2ban/releases/tag/1.1.1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-setup.py-fix-data-relative-paths.patch    |  6 +++---
 ...hd-filter-for-openssh-9.8-new-daemon-name.patch | 24 ----------------------
 ...r.d-sshd.conf-ungroup-unneeded-for-daemon.patch | 24 ----------------------
 package/fail2ban/fail2ban.hash                     |  2 +-
 package/fail2ban/fail2ban.mk                       |  2 +-
 5 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch b/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
index 75bd9aafac..922df9c578 100644
--- a/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
+++ b/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
@@ -32,10 +32,10 @@ Upstream: N/A [breaks traditional setuptools installation]
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 91f71cf2..99ba2e32 100755
+index ee8f392..26181b5 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -238,26 +238,26 @@ setup(
+@@ -220,26 +220,26 @@ setup(
  				for f in w[2]]
  	} if with_tests else {},
  	data_files = [
@@ -68,7 +68,7 @@ index 91f71cf2..99ba2e32 100755
 +		('var/lib/fail2ban',
  			''
  		),
- 	] + data_files_extra,
+ 	] + data_files_extra
 -- 
 2.34.1
 
diff --git a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
deleted file mode 100644
index 9841d09240..0000000000
--- a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 2fed408c05ac5206b490368d94599869bd6a056d Mon Sep 17 00:00:00 2001
-From: Fabian Dellwing <fabian.dellwing@mbconnectline.de>
-Date: Tue, 2 Jul 2024 07:54:15 +0200
-Subject: [PATCH] Adjust sshd filter for OpenSSH 9.8 new daemon name
-
-Upstream: https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- config/filter.d/sshd.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
-index 1c8a02deb5..a1fd749aed 100644
---- a/config/filter.d/sshd.conf
-+++ b/config/filter.d/sshd.conf
-@@ -16,7 +16,7 @@ before = common.conf
-
- [DEFAULT]
-
--_daemon = sshd
-+_daemon = (?:sshd(?:-session)?)
-
- # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
- __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
deleted file mode 100644
index 521d899640..0000000000
--- a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a Mon Sep 17 00:00:00 2001
-From: "Sergey G. Brester" <serg.brester@sebres.de>
-Date: Wed, 3 Jul 2024 19:35:28 +0200
-Subject: [PATCH] filter.d/sshd.conf: ungroup (unneeded for _daemon)
-
-Upstream: https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- config/filter.d/sshd.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
-index a1fd749aed..3a84b1ba52 100644
---- a/config/filter.d/sshd.conf
-+++ b/config/filter.d/sshd.conf
-@@ -16,7 +16,7 @@ before = common.conf
-
- [DEFAULT]
-
--_daemon = (?:sshd(?:-session)?)
-+_daemon = sshd(?:-session)?
-
- # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
- __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 8627e01f05..abb1ca19b3 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  474fcc25afdaf929c74329d1e4d24420caabeea1ef2e041a267ce19269570bae  fail2ban-1.1.0.tar.gz
+sha256  4be0ea0488e32de260058462a44a040f0542cd26a9fb6fa6d2514f9dd8ec1609  fail2ban-1.1.1.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index a77e5fad6c..4b9188ad86 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 1.1.0
+FAIL2BAN_VERSION = 1.1.1
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
