Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DA9C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4CF040C9A;
	Fri, 14 Aug 2026 13:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUuXTklb84Sn; Fri, 14 Aug 2026 13:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 056AB40D56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713624;
	bh=XYw34S1KLDXLkNXeOjV30FDfM3uoIbkjws+rPA3oPLU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DTzWUTq9DEpZwzogtShz6SgOzQ0dA3PbhvJGaCPsrkoclokkKil2xMHFEJ/4/GJvN
	 aDTrjWp3Sa7RWVG1JMv9vyb2IR5gotHI3/SPQNpDzAxasbKpjKjIb0FcdX1g7ilT+2
	 HSxtDL0ZpIgAOw3nSTo9jD73W15iA1KvKQzMqvAEWbvGvpUa6GhTBxNsFeI7zOgm6D
	 /J20X1OUPM4SW3e4+K7OY6alTnqjYEYEsmMWhZVnJb5Jqh+Gt5GVT9AocnNO02HJm3
	 +7bZIha8xIdBWjpz6d/oenaNjwyYAseQKX62sy+0c0uzIopsjaJHRrrs7lw2aWLwtr
	 jKUJZ5i8dEj4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056AB40D56;
	Fri, 14 Aug 2026 13:20:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CD3623F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 409C340C2D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xslnCasPjzv for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B45C40C3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B45C40C3D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FD848D66B; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:44:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fcb6a725efc57141d4adfcb87cf5d3a6c9a44087
X-Git-Newrev: 6edbad38613aa257f9298043afa3165c75350c95
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.6FD848D66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/syslog-ng: needs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6edbad38613aa257f9298043afa3165c75350c95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
