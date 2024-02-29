Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B0C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B7894192E;
	Thu, 29 Feb 2024 15:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRwwjtPtzdKp; Thu, 29 Feb 2024 15:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8B841BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8B841BE3;
	Thu, 29 Feb 2024 15:53:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B59C1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E6E60A5E
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipKVifXpCAx7 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCFFA60A64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCFFA60A64
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C19EC87D11; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:18:10 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d69475afc96f8524d9a087437fbb09a0080a9bc0
X-Git-Newrev: 5249686eb772a3db506c7540d33e1a075abb9e10
X-Patchwork-Hint: ignore
Message-Id: <20240229153159.C19EC87D11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/sysstat: do not
 autodetect sa_lib_dir
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5249686eb772a3db506c7540d33e1a075abb9e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The configure script of sysstat package checks host's /usr/lib64
directory for default sa_lib_dir.
Specify sa_lib_dir exclicitly to avoid host dependency.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eef5c297e765bb1414d6d6c629ce8e690c6370d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 377396d986..ca05ec50d8 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -20,5 +20,7 @@ SYSSTAT_CONF_OPTS += --enable-sensors
 else
 SYSSTAT_CONF_OPTS += --disable-sensors
 endif
+# do not look at host's /usr/lib64
+SYSSTAT_CONF_OPTS += sa_lib_dir=/usr/lib/sa
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
