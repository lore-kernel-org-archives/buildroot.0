Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF71CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4987A6126A;
	Wed, 22 Oct 2025 16:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UC-xf8PxnJ0A; Wed, 22 Oct 2025 16:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64E6612BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64E6612BF;
	Wed, 22 Oct 2025 16:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B77DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CD97410FA
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbUrbNT4epH7 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E78434116B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78434116B
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E57CD87722; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6219693af22533cdf5a8ff822bfd2e89aaccc5ef
X-Git-Newrev: f6efae6a39c3dd90d3431108950c089fb71dc912
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.E57CD87722@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zabbix: security
 bump to v7.2.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6efae6a39c3dd90d3431108950c089fb71dc912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 762ddee71c0e5bbda72c11dc32898b5d9fd01ef8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
