Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41081CD0402
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B9C40497;
	Mon,  5 Jan 2026 20:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0s9LQF17E3tO; Mon,  5 Jan 2026 20:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F9F40424
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646235;
	bh=yEj8xKkGKvLrw8bkv1FGQVK2HdshH2i404PDz9AxHQY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CMUp8sDwwa92wmo0WK/MpIxRvDhbAbvp8hm9DJCh8jZ4V6sdptQaeUYj5jCuI1GND
	 aZFjxIPXQNjg7cvqaZ8uPu4OvUtnSkzXQ0JARjDWxct/EIiLZPjLvaBnFO1bofhwu7
	 L4zPL6uZD6r4VFGtEpSN2z8Y4OiqWb9nSke719Bf7tlnC4Dh5EhylbIScgWqmI+HIH
	 zrdM31617Es6kzwGKUtZYGEFED3RECo39FXXndie9pm4D+rAPjOc8EKGibFJVGYpyI
	 HLknSavqrOWteR1CpfQxYFhCrB/VM2Oc6NAwJRCKOSSrgZ/zTSjjLbGPYayQdhfYZP
	 e2eDNefWrBS0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F9F40424;
	Mon,  5 Jan 2026 20:50:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE66AE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F86608A1
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5Jph60UR0EC for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBC7C60708
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBC7C60708
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB1EE882A4; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:37:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6721942c98b8b691c480e8d6b9c333faed2c7f89
X-Git-Newrev: 8d78978a0d0cc12b79364faee2c17585047f87ca
X-Patchwork-Hint: ignore
Message-Id: <20260105205030.AB1EE882A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rich: add missing
 dependency on zlib support in Python
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d78978a0d0cc12b79364faee2c17585047f87ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This did not show in the runtime test for package/python-memray
because that package already has the dependency, so the Python zlib
module is present in the test.

Package was added in commit 26bc4b51a808d73c09598035aa94f9c37b273218.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-rich/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rich/Config.in b/package/python-rich/Config.in
index d7f3cdf54a..9fb34f097b 100644
--- a/package/python-rich/Config.in
+++ b/package/python-rich/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_RICH
 	bool "python-rich"
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
