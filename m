Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB5ECAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DCF414EB;
	Wed,  1 Oct 2025 21:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yvcr5hldeYJs; Wed,  1 Oct 2025 21:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F9D9414D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F9D9414D1;
	Wed,  1 Oct 2025 21:00:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 033311CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78EE041440
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_76DVhso-ks for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27BF41486
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B27BF41486
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF47C8285C; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:33:36 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: da33bc0e7b37197809b2316878692ccca524fab9
X-Git-Newrev: 132417880e0dae2b0cd8e94a753778acca1ce653
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.AF47C8285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/linuxptp: update
 default config
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=132417880e0dae2b0cd8e94a753778acca1ce653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Since upstream commit [1] ("Deprecate the slaveOnly option in favor
of clientOnly."), included in v4.0, ptp4l complains about the
"slaveOnly" option being deprecated on startup.

Update the default config to silence this warning.

[1] https://github.com/richardcochran/linuxptp/commit/fe01cc7c964296321e3c0de2412ef3f1282fa774

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f70b83914f20a1ee10b29aa60f34fd5785a2af8e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/linuxptp/linuxptp.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linuxptp/linuxptp.cfg b/package/linuxptp/linuxptp.cfg
index f9d02e8d97..09a905ed9e 100644
--- a/package/linuxptp/linuxptp.cfg
+++ b/package/linuxptp/linuxptp.cfg
@@ -10,7 +10,7 @@
 # or the linuxptp SysV init script.
 
 [global]
-slaveOnly		1
+clientOnly		1
 delay_mechanism		Auto
 network_transport	UDPv4
 time_stamping		hardware
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
