Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B61DCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBF718064D;
	Fri, 10 Oct 2025 16:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICPpLcmLRNfy; Fri, 10 Oct 2025 16:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A28180648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A28180648;
	Fri, 10 Oct 2025 16:35:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B54226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09BCD40165
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQDWMaznjFY6 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3059540164
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3059540164
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:35:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EBD586FAF; Fri, 10 Oct 2025 16:35:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 18:28:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef59937699242f86926787ac883398b73c507dad
X-Git-Newrev: 762ddee71c0e5bbda72c11dc32898b5d9fd01ef8
X-Patchwork-Hint: ignore
Message-Id: <20251010163556.1EBD586FAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: security bump to v7.2.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=762ddee71c0e5bbda72c11dc32898b5d9fd01ef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For more details on the version bump, see:
  - https://www.zabbix.com/rn/rn7.2.13
  - https://www.zabbix.com/rn/rn7.2.12
  - https://www.zabbix.com/rn/rn7.2.11
  - https://www.zabbix.com/rn/rn7.2.10
  - https://www.zabbix.com/rn/rn7.2.9
  - https://www.zabbix.com/rn/rn7.2.8
  - https://www.zabbix.com/rn/rn7.2.7
  - https://www.zabbix.com/rn/rn7.2.6

Fixes the following vulnerabilities:

- CVE-2025-27231

    The LDAP 'Bind password' value cannot be read after saving, but a
    Super Admin account can leak it by changing LDAP 'Host' to a rogue
    LDAP server. To mitigate this, the 'Bind password' value is now
    reset on 'Host' change.

For more information, see:
  - https://support.zabbix.com/browse/ZBX-27062
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27231

- CVE-2025-27236

    A regular Zabbix user can search other users in their user group via
    Zabbix API by select fields the user does not have access to view.
    This allows data-mining some field values the user does not have
    access to.

For more information, see:
  - https://support.zabbix.com/browse/ZBX-27060
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27236

- CVE-2025-27238

    Due to a bug in Zabbix API, the hostprototype.get method lists all
    host prototypes to users that do not have any user groups assigned
    to them.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27238
  - https://support.zabbix.com/browse/ZBX-26988

- CVE-2025-49641

    A regular Zabbix user with no permission to the Monitoring ->
    Problems view is still able to call the problem.view.refresh action
    and therefore still retrieve a list of active problems.

For more information, see:
  - https://support.zabbix.com/browse/ZBX-27063
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49641

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zabbix/zabbix.hash | 2 +-
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 979b6c8e3f..787a0acfe9 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d01b393dd22b2a60b36fb37a98fcf1081c683ad98832a2ddd87943a1200839e  zabbix-7.2.5.tar.gz
+sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 3e685f1ea2..caa69fda38 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).5
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
