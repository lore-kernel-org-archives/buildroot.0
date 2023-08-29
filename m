Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A45C83F17
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF0C61100;
	Tue, 29 Aug 2023 20:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF0C61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6D_vVYD7dJy; Tue, 29 Aug 2023 20:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33FC960FEC;
	Tue, 29 Aug 2023 20:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FC960FEC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65E211BF59B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FD7640538
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FD7640538
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMmJc_WK35pH for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BD4840195
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD4840195
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F6E864A0; Tue, 29 Aug 2023 20:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 21:58:32 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e25f6feace525e022d5bf220814c662f168f1dea
X-Git-Newrev: 36f6034477bf59ac55c9e0857cdc20ff0156230c
X-Patchwork-Hint: ignore
Message-Id: <20230829200444.66F6E864A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/linux-tools:
 disable libtracevent detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=36f6034477bf59ac55c9e0857cdc20ff0156230c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Since upstream Linux commit 6898e60f709b0047206110d3ec9f4612210e3ff7
("perf build: If libtraceevent isn't present error the build") present
in Linux 6.4 and newer, Linux will fail to build if libtraceevent is not
present. Since we do not currently have support for libtracevent in
buildroot, pass NO_LIBTRACEVENT=1 to get perf to build again.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4ab45a5c1db05f84efb5f3b6909982263afb1d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 122c7cbbc4..ee308a85df 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -27,7 +27,8 @@ PERF_MAKE_FLAGS = \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
-	NO_LIBBIONIC=1
+	NO_LIBBIONIC=1 \
+	NO_LIBTRACEEVENT=1
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
