Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869F3CD128A
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 12:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 472F740475;
	Thu, 11 Apr 2024 12:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grqOAgAgudte; Thu, 11 Apr 2024 12:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C40341839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C40341839;
	Thu, 11 Apr 2024 12:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61CA31BF3A3
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 12:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AE6941717
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 12:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tM8qUKbLVpyY for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 12:07:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 212C34170B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212C34170B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 212C34170B
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 12:07:46 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 83436B00576;
 Thu, 11 Apr 2024 14:07:43 +0200 (CEST)
Date: Thu, 11 Apr 2024 14:07:43 +0200 (CEST)
From: friedtj@free.fr
To: buildroot@buildroot.org
Message-ID: <299860002.1258357262.1712837263439.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.167.45.227]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF124 (Linux)/9.0.0_GA_1337)
Thread-Index: UrLiZOt+Z+J55mlS83SutpFAdD8l8A==
Thread-Topic: package/gr-osmosdr: add host-python-six dependency needed for
 generating Python bindings
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712837263;
 bh=ibTDPHhNzMlxPZtrafe/QsPnsV6K+qUjBByYWf0gnTU=;
 h=Date:From:To:Cc:Subject:From;
 b=o3r4mtm43UvavatEbniDQ0vvQD4i4Y/Oppeb26j8L2Hmosgpa2odL9XUzLXNy+xGk
 bQvePZ8OUQ32tkMNv6YnUqLirR8L65vafsUYAU5i/dTeiIXAlF2FG+v245q938qoe2
 u1U+Cf2iwpx6vi2hpIqLmXLipbrUPVfVaHV4eKTEWLn5UWpzOY4U+jk4h0OxK3NTGD
 qrAmGJK554H1wZAfGlxYxxxbhYqA2txRzKOZC68luYP5J/hgb3IYcxxagPaZ/Enrac
 J8njzCwT29v6Ip3jZNRfGzWPOPUcY/8UL+6cXHUye+hC4fgG85sWsEVdPirmXMCYZ8
 Pwf6dfWET6+/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o3r4mtm4
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add host-python-six
 dependency needed for generating Python bindings
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
Cc: gwenhael.goavec-merou@trabucayre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compiling gr-osmosdr when Python3 support is active fails with

ModuleNotFoundError: No module named 'six' 
make[3]: *** [python/bindings/CMakeFiles/osmosdr_docstrings.dir/build.make:73: python/bindings/docstring_status] Error 1

when generating the Python bindings. The following patch solves the problem.


Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr>
---
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 8491c005d8..316ed80887 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -24,7 +24,7 @@ GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
-GR_OSMOSDR_DEPENDENCIES += python3
+GR_OSMOSDR_DEPENDENCIES += python3 host-python-six
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
