Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D20C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE2081F27;
	Mon, 20 Feb 2023 20:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE2081F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_flxnJTF_ge; Mon, 20 Feb 2023 20:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76E581F12;
	Mon, 20 Feb 2023 20:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C76E581F12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E00801BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA05E81F12
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA05E81F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7A13QN7JoN7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:48:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02D9481F0B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D9481F0B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E76CD8644B; Mon, 20 Feb 2023 20:48:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:47:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9c146f0a540536c0ad8df7b31a190c117ad1581
X-Git-Newrev: 1d29799914d5df6fb372284d8c3408809e00d0b4
X-Patchwork-Hint: ignore
Message-Id: <20230220204820.E76CD8644B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: set --with-libpcre2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d29799914d5df6fb372284d8c3408809e00d0b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set --with-libpcre2 to avoid the following build failure raised since
bump to version 6.2.7 in
commit 89fa774a191d41ed5d125d87d812ff3478902251:

configure: using old pcre library by default
checking pkg-config is at least version 0.9.0... yes
configure: error: cannot find pkg-config package for libpcre

Fixes:
 - http://autobuild.buildroot.org/results/701b343b3b0d471c75899b61d02bd9d63a272247

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zabbix/zabbix.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index db9efed78b..0d6c579f4c 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -15,6 +15,7 @@ ZABBIX_AUTORECONF = YES
 
 ZABBIX_DEPENDENCIES = host-pkgconf pcre2
 ZABBIX_CONF_OPTS = \
+	--with-libpcre2 \
 	--without-sqlite3 \
 	--enable-agent \
 	--disable-agent2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
