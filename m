Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CB606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EsiFJCuK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5071060648;
	Sat, 24 Oct 2026 14:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qj14S5zX47z; Sat, 24 Oct 2026 14:44:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 597AE60683
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792853098;
	b=BifQPnjeq0avWllxft4dRzQmSZFml94sWVdwFC3tazvj1CcIbcHgwkNzh5qxoxWYFQ3J
	 8rZp3YjazV/rPBQBnNIUBkxRtVRQn/OLBKlt5k9ta8xfkdn0OsXj0ow3m5/ONzCJxNAa6
	 9QAhAI0V7heoX7OPDY31R+AC2ro1JdxZMIPPcLL5Ha4uoZnVQVbiptjaTwF6HBIPGf6GV
	 YReqHAatL8YTbEzUr3hvHRkoDreAJ7KF6gZ25R/QzHFNfR7QKgXINOOd603JLoRsS4RcJ
	 t7DXoPT9tKsfStKp69Qg5oPb1T3uif9pUhfQGEO81+TjGgZubT2rYG9jNCE0ENyH+xQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792853098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RRrDibIP4y2X7uPk20LlZcKMe+M8YCGpMal7aUl4nSs=;
	b=WC8S8MWOMpuy8gwaXZ7070+onH9uNNVY0ZB4OYH80qEyVzw3Ww38biW875U+tj1f8x+z
	 3B9IfVOt46STVZiSbtD6h5wfVQPXqrDIeLMB+SPJi2grjl2yOFwvXJLxRypJSUhJilead
	 jqColtm6W6YkWmuIC1RgJUUUkBSCwKVnnQyR04JqUQH7KyqrGJnzsXtf9B7ZdBCW7GJQN
	 l+OiffFTDh3hdEo43Ge/0SwhPgu2WZEMqvjYtkbduRRnxkur7vtCrQ5N3/wK71n1T+dxV
	 I6/24SgBaRVjHWW4QneL+rsRg5D2bDwKyEHW4O9IYZSFsLgT2BuARd5CiJ5bJaXAVfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792853098;
	bh=RRrDibIP4y2X7uPk20LlZcKMe+M8YCGpMal7aUl4nSs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EsiFJCuKZXfo/bdGBYUUb2XCzzmYtjutpaESOvJnMQ9zx40kQYUKa+2vMncXOvYov
	 oFbVvbFkFELHuSpMG6+nPv8V0V5MKjv8hlx39l2b9GHl7M5SIM1H+a4uZ8TO45XdWJ
	 HOfMwdX4ZA5QVUPfhClu7WwN7iIGQDZrJMRjux8knMdeBfC7scr1Pw/kFO8PvZFYtt
	 94Z7GOSxu+Tqiuu2Kdn0R2NUPn2KO2g+47TKQlS6ZgCujhDVaaiNvF0e0vhgw6Kvte
	 opFUZWgr6cvDbTjbCAwXJypgVnh6MwySGB8BQ0RRy/rntVFgM3+eLUCYO4OAPsVMKA
	 CdpMLlZVxpLGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597AE60683;
	Sat, 24 Oct 2026 14:44:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A16DA380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E7EF60683
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNa8-z-csIOU for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:44:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0221460648
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792853096;
 b=Ny9JxIlYkoebJV0+emziwNeeXPq/Dxfnn5QHjt4PHbfVDhifqluisJ6Q4abhhmXMDkop
 Im8CWR8rO+29C4CBzWg1O+jeURQL2wtBbHmhNMh/hZi18dJQbpYid5fd3ai3jiwIZwUh4
 1PlFUzgzjSXWmBs4vzWqX9yjX2bTBaDEUVBnq1vue89Rds6uLngtYGOv+A2aZRLxoSIvr
 0007mnAzpN4uuViEmLCqtBjpqCQOdP8+PA/rdejZoUij0andYs0WYbp/WGYggpSEwTLb6
 7YCeuheBUNn5mClNW38Cs54huzol0r7lF52KUUUzX0DNrFZKQ6dXK3uobOpXBqo534Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792853096;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6U9eOebTW8d3aX+eImvaIuUCYHUeNit7w3p7lQKBHbw=;
 b=UoTo7RQdHpKZIn6cl5RMRy6LeZ4eoMZUMZ+J9KUTUYSs7O3VBmV4JKosS384QFYvATm2
 SDq307330Ge9BNG3JdFWdm2WDSzRQfUu9JBI5qJ58tqi4yLKRMCD+NPinF0webMgdeqHh
 EqXbHXuqzJHcqRlBoeUqMEDX7HgDdZEYFU+ciJyfba46AQ6u9SY3BNbzA1ovptugWTNtH
 /fbt1xtVz8glBtGWkzh97g1tr4Eck5oZsLKxdet31IW6WUxfuFFheUWpB6EEhF5OkTpHQ
 Ca+0IuWjJRTkFmcZU9MzKPUeG0VeerZuUTt5njby/Lw8skrPjs43SOj7hw1MtN2V1cQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0221460648
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7FAF9C7E2; Sat, 24 Oct 2026 14:43:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:42:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8b74ebfbfb1e9f6e1a3179e0a375611d39b3dd2
X-Git-Newrev: e81751cb905df068d410fac3cbb68406773bb830
X-Patchwork-Hint: ignore
Message-Id: <20261024144330.D7FAF9C7E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: disable rtla with
 older kernel versions
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e81751cb905df068d410fac3cbb68406773bb830
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit 5e8705263cf4592d8c02fac71803053e17d4f83b ("linux: add
first-class support for all upstream linux versions") we are now
building older kernel versions in the autobuilders. Some linux-tools
do not exist with such older kernel versions, causing build failures
in the autobuilders.

This commit handles the RTLA linux tool, which appeared in 5.19.

Fixes: https://autobuild.buildroot.net/results/e0a0d415a50b29cb503b800a859c4de9baac1c29/
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index e6655fe189..bd1b1dbfb5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -296,6 +296,12 @@ async def fixup_config(sysinfo, configfile, skip_secondary_configs=True):
        'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
         configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
 
+    # RTLA only available since 5.19
+    if ('BR2_LINUX_KERNEL_LATEST_5_10=y\n' in configlines or
+        'BR2_LINUX_KERNEL_LATEST_5_15=y\n' in configlines) and \
+       'BR2_PACKAGE_LINUX_TOOLS_RTLA=y\n' in configlines:
+        configlines.remove('BR2_PACKAGE_LINUX_TOOLS_RTLA=y\n')
+
     if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
