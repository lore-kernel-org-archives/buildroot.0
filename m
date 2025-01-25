Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC57C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3953184BB1;
	Fri, 28 Feb 2025 17:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0TzrB2rJqtf; Fri, 28 Feb 2025 17:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D0ED84BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D0ED84BC5;
	Fri, 28 Feb 2025 17:05:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1390694F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C851342EB4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kjJVLLIz_GY for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91EE242EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91EE242EB2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86A7982581; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 22:11:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 057012eb2c2c2f2de6d739b051406e8ab560e26b
X-Git-Newrev: 75620b301f9e7d128afd6fd9a1d771a3b7567185
X-Patchwork-Hint: ignore
Message-Id: <20250228163020.86A7982581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysklogd: bump to
 v2.7.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=75620b301f9e7d128afd6fd9a1d771a3b7567185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.0

 - syslogd by default now cap forwarded messages to 1024 bytes. This can
   be adjusted using -M size or the config file setting udp_size
 - syslogd socket buffering has been reduced from 160 kiB to 80 kiB
 - Allow slashes in process names to support, e.g., postfix/qmgr
 - Support for extended message filtering based on tag/ident, hostname,
   or message property. This allows sorting of messages based on their
   origin (program/remote) or content in any of the available message
   fields: exact match, case-insensitive substring matching or extended
   regular expression
 - Support for remote logging to a multicast group, as well as acting as
   a multicast group receiver of syslog messages, both IPv4 and IPv6.
   Forwarding to multicast groups support two new, per action, options:
   - iface=IFNAME to set a different outbound interface
   - ttl=1.255 to adjust the TTL of outbound multicast (default: 1)
 - libsyslog.a support for egressing multicast, two new struct members
   .log_iface and .log_ttl control how the syslogp() API works
 - logger support for controlling egressing multicast using a new command
   line option, -o iface=IFNAME,ttl=<1..255>
 - syslogd now logs the hostname as the FQDN in RFC5424 output format
 - Fix parsing of IPv6 addresses in listen .conf directive, as well as
   command line option -b [A:B:C:D]:PORT

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sysklogd/sysklogd.hash | 5 ++---
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 8b1cd63a73..4024965e23 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,4 @@
-# Upstream .sha256 from GitHub
-sha256  40a3bb593d7507e49a4379f48ae8a9bc4b68dcc583efcdbf3b9056128442c92a  sysklogd-2.6.2.tar.gz
-
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.0
+sha256  6ab74ab5001121bb32697fd2f7ab3cc4b4452c3f721677e06e5b60982a04d0cc  sysklogd-2.7.0.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index eeb3a3748d..e8b7fe2062 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.6.2
+SYSKLOGD_VERSION = 2.7.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
