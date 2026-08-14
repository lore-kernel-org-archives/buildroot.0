Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D431BC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA4B60655;
	Fri, 14 Aug 2026 13:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Whfv4hdH1WX0; Fri, 14 Aug 2026 13:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A6E60673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713702;
	bh=zsSawxzDQ0Qb3mPY9fuWqvkXO55leICdastUZkb6tJo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iMLohk7/saspOn3S17CT6wXTsHyiVK8Fk6HIjceISkjus5U34WLH+DWXWQl4BrZzR
	 bcm1GPsmi2neQbHrweNJ8RZ35raKhd5XWKT0T03ycKpSQkHaN+YNeWiea3zU73/7K4
	 TdjITvoL6ypL83vAvrGSBsAYJXeBU5R3/UU8q7Y8T9NmnEO18/GWFCHMPnBdodrZkZ
	 aeTe0HIqwf7UUWT7rSTaTrWhUBeHnn0T2iYD24tpsYDmPO2upoZgEYwk489kxFuswT
	 cmqSvOQ9gUQheqbGjXBQc3C4akL5ELU9pk7nWIZg5LRI7Lom7eGPNxx76ALVdG9tJx
	 Ed1WDvudP5EIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A6E60673;
	Fri, 14 Aug 2026 13:21:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85548139D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BE1A80E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjupHOIu1l-X for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB408128A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACB408128A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B11808D66C; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:44:48 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 589028df3b73384220114b28603bf7361ab16c10
X-Git-Newrev: 69ce103003faa9dfa838aeedf9b9b5734c5e5983
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.B11808D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/syslog-ng: needs
 libopenssl, not libressl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69ce103003faa9dfa838aeedf9b9b5734c5e5983
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d bumped the
package from version 4.8.3 to 4.11.0. Upstream commit
https://github.com/syslog-ng/syslog-ng/commit/dbe9fb306929168172062a6bc985eb7e38201dab
added the usage of OpenSSL BIO_ functions in version 4.9.0 causing
build errors with LibreSSL:

lib/transport/transport-tls.c: In function 'BIO_s_transport':
lib/transport/transport-tls.c:125:3: error: implicit declaration of
 function 'BIO_meth_set_write_ex'; did you mean 'BIO_meth_set_write'?
 [-Wimplicit-function-declaration]
  125 |   BIO_meth_set_write_ex(meth, _BIO_transport_write);

lib/transport/transport-tls.c:126:3: error: implicit declaration of
 function 'BIO_meth_set_read_ex'; did you mean 'BIO_meth_set_read'?
 [-Wimplicit-function-declaration]
  126 |   BIO_meth_set_read_ex(meth, _BIO_transport_read);

because LibreSSL does not provide these functions.

Fixes:
https://autobuild.buildroot.net/results/117/117b3b38098df075d96167863d9f6b933a97eb64/
https://autobuild.buildroot.net/results/a39/a39ecc88a9342005b75660ee0ac60a1025fa6fc2/
https://autobuild.buildroot.net/results/6b3/6b3eb910ccdb67827f0c12cea0e3a63c5e6b68af/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 54f66d88295cbbd09d51139f8c2a2c80ca03fb26)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/syslog-ng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 1302e6ac46..0bdf0dcd27 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
