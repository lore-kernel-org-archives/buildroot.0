Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC0CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD97E8580D;
	Fri, 28 Feb 2025 17:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTyzdJeiRW_S; Fri, 28 Feb 2025 17:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC0A584FA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0A584FA5;
	Fri, 28 Feb 2025 17:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1110168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70F5C4240B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Z0FhJ2E1cv9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B392542945
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B392542945
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF0F0867B4; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 22:19:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 892e1608f55c6528c16562f347cb2ec7c7eb6430
X-Git-Newrev: bf18fd4cd183eab2e91b91d275fc62e2707b9182
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.AF0F0867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xen: xen tools needs
 bash at runtime
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
Content-Type: multipart/mixed; boundary="===============4248175771620462213=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4248175771620462213==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bf18fd4cd183eab2e91b91d275fc62e2707b9182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When the Xen tools are built, a number of init scripts are installed to
the target.

Some of those Xen scripts require bash to run:
- /etc/init.d/S50xencommons
- /etc/init.d/S50xen-watchdog
- /etc/init.d/S60xendomains
- /etc/xen/scripts/launch-xenstore
- /usr/lib/xen/bin/xendomains

Make sure to select bash when the Xen tools are selected (we need to
select "busybox show others" for that, too).

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xen/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 577066666d..70a06f3cbf 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -33,6 +33,8 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_BASH # runtime (scripts)
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
 	help
 	  The Xen tools can be accessed by the xl command.
 

--===============4248175771620462213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4248175771620462213==--
