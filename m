Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4469FC5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2EBE80CED;
	Sun,  9 Aug 2026 15:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egIvQ_eAxHSa; Sun,  9 Aug 2026 15:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E28180CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786288960;
	bh=7Jjn5trlN48taUJP4B8GEetQXnLI+e9tHK99+C2tzrs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c5I4dvMKg6nZHZfjnUH8YCc1NP3PVXSUgbN55Y/79YOCpMcI3XzdS3j2CXl4Hqibp
	 QB0VXEsnxLE6Q6JSlTOn8dxIJsz2QLerutdiRiDXTrtzCT6mt0mE0cMneUyHoKO+Nk
	 Aj3QwkqMsv4darBrHexC/jHD/ol4DXwmHIgalhDqpLJQ92Dvbv8lZNHt3utFsZh8iq
	 CRA90jVik2CWtEv48zX5Ro1eXPX7thrAaUFJpFHzhV/yOyV0B+VA9GJIhwslWpsGMI
	 Hph5I2SktSLU2+6mAT+M3kwQNNfmOET5y5ndnjzHsvfFnSR37AJ3Wk+NGnVvmX17zB
	 vmnpu1FRPQZGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E28180CE8;
	Sun,  9 Aug 2026 15:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D998296
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B37D80CEB
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0-KDNRlAl3B for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBD380CE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FBD380CE8
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:22:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F004F8D240; Sun,  9 Aug 2026 15:21:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 17:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b6eea299b3e519a6dac908e5ceed49cc43c4698
X-Git-Newrev: 54f66d88295cbbd09d51139f8c2a2c80ca03fb26
X-Patchwork-Hint: ignore
Message-Id: <20260809152150.F004F8D240@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: needs libopenssl,
 not libressl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54f66d88295cbbd09d51139f8c2a2c80ca03fb26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
