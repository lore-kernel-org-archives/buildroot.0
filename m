Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55C6C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 21:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5942781D21;
	Tue, 12 Dec 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5942781D21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3h4-6kA1Rr44; Tue, 12 Dec 2023 21:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FEDE81CBA;
	Tue, 12 Dec 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FEDE81CBA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 919F01BF2FD
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75AA840291
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75AA840291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CCKfyvfSzUb for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 21:46:20 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 111B340140
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 21:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 111B340140
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D6B7513F861;
 Tue, 12 Dec 2023 22:46:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 22:46:10 +0100
Message-ID: <20231212214610.374636-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702417577;
 bh=hplRe+U3uflLIYJDU7B+z4g1sm3n2PTG8JGi5Gr1FsY=;
 h=From:To:Cc:Subject:Date:From;
 b=MzuNQZzh3hNmEtvnVGGZE1VDnDRJrSYEQNsP041g61FIsDD4fAMYBKBlyvlmv5kdb
 7AI4Yzgj51BvceqwyesxTNkvvsJzw/rnetV2rYorPnKhGJQmYtmawyw0XTd4lyIlmw
 lE2FvGYtzrwltQKmCAaCdLkXFgE9J0CpU2Ho8HNXm7FJEzW3nWk/udjAWt093lH4qL
 +/QeD8yCIy5+fCKFG/UustEmYjF8KYBpBoPvskV0+y7NKFNjjCGHbOmnbHXttFjEu5
 kxuWsbi4pX+c94BeFC3uKJs+uZkPBuILtGUxyyC4KAE5y1b+23aFf6b0FZ1AzwR1nO
 zc2LY3ucc34Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MzuNQZzh
Subject: [Buildroot] [PATCH 1/1] package/octave: add libreadline search
 prefix
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit b36e4b10f3 "package/octave: bump to version 8.1.0",
Octave fails to find readline automatically if octave and readline
packages are both enabled in Buildroot the configuration.

The readline search prefix need to be explicitly passed during octave
configuration. This commit adds this search prefix to fix this build
issue.

Fixes:

    checking for readline... (cached) no
    checking for readline/readline.h... (cached) yes
    checking for readline/history.h... (cached) yes
    configure: WARNING: I need GNU Readline 4.2 or later
    configure: error: this is fatal unless you specify --disable-readline

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index cae0de7620..f240a5057c 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -20,7 +20,9 @@ OCTAVE_DEPENDENCIES = \
 	pcre2
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-OCTAVE_CONF_OPTS += --enable-readline
+OCTAVE_CONF_OPTS += \
+	--enable-readline \
+	--with-libreadline-prefix=$(STAGING_DIR)/usr
 OCTAVE_DEPENDENCIES += readline
 else
 OCTAVE_CONF_OPTS += --disable-readline
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
