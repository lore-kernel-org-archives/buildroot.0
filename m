Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71553C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 13:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B20DC61167
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 13:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B20DC61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 794DD402B5;
	Wed,  8 Sep 2021 13:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2FsPq1NNwlR; Wed,  8 Sep 2021 13:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F0594024E;
	Wed,  8 Sep 2021 13:38:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA491BF9B2
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 13:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AF0F4024A
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 13:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njfcESk4-Rtm for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 13:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51ABF4024E
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 13:38:34 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MPGFZ-1maNn13jBN-00PhWs; Wed, 08 Sep 2021 15:33:26 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 15:30:09 +0200
Message-Id: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:nafrbmzsFZk1P8uLg9ZIuXirVfWaOsCbu6wLRfNRB+IwdOb7mh6
 K0WKb5zx0Hc0lDQkWAZ1O/yRN7ZCzx+5GP08f4BTrmalId439AdI0roE+xUUdQnhG1k7lxm
 VvgYbUnSavKSIMldho+Oz2NMsHrGPlUA22eyvFXLlTpQwancywFFof6rHBHHOHnqtYmuxh2
 kbq5nO1yg1+HW/EEovE3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lTNMIwfiaxw=:b7dkjG5Z1CwCfKxkT+hEOx
 cRpjsyxDZCEZwTIYYXnc5jxrfLaJs8OGVQ+yN52ouME7l9zs0gq8pEXDVtWHARxxxuUdesrb0
 oGtV2mxq74BxyRATaJ8HFrR16mzixo2aTwsUx9k+unlFARLKGC17KD0aSe8i/M/ikntwrqDzh
 CDFiPDfnzrWh7HYQuPuvjooH5CDaq2i6eZzWivQa/v/1hTzJ7SP9E/eWeonL7LAAt2buN0MzX
 4ibSCnbz5OlxTGH8zUsJyPN4vOXL9SVMZmf5Xk/H8IYQbISi58uXj7tGsBxj014gzpB7IWOw0
 zxMsTMTx5ggRSH/TFC8VoRQVWD0/qP8jWUH8asAMNiWzCtTDVqgqHRHkYAl3kxyGC0hiiU0GG
 ukZTQAKvszp8XcwDXBUvH9EJPpnE2+0OKfjUE4q+09QIERWuoeSDyAsqbiIRa+1qFI9utzi/4
 PpHqf/Y9UZgte11PMXByT1XmeAPLbJOTSGtQQvQImQpPXVWXcgnC1Ru+2HHb91B5peZDHLi1G
 ZLkQOC/778KVT+wvlYOMIkm+jhhaPC+XMyzn3hp26E2u+oHdFO49bdigEBCOdhN4lPGxky07j
 /T2/fgcoVm4HqxXCiZcIlxw8a+uM2NzrpymM5bP2wDqqaQIoQ+OzYLjgi9hCcx5OgOsG4i3RH
 EttEz3/rCJIkldwzfVLdyQzpId+1eGR2HZbmFITIqE6MsX32FkQu4UZhiXN8ngqwjjDXSI1WU
 5/63VIPAE0719zgcqWDskTIaRJ4oN7GOpljl8DOEyPG/k7OzsU96fDc1AiAXyDEJULlbQCmFQ
 68HKpv/
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump to version 1.2.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

COPYING was updated with a copy of the openssl licence since libgit2 now
include openssl headers so it can dlopen it:

    openssl: dynamically load libssl and symbols (optionally)

    Provide an interface around OpenSSL to dynamically load the
    libraries and symbols, so that users can distribute a libgit2
    library that is not linked directly against OpenSSL.  This enables
    users to target multiple distributions with a single binary.

    This mechanism is optional and disabled by default.  Configure cmake
    with -DUSE_HTTPS=OpenSSL-Dynamic to use it.

We do not use that option so the headers are not even used, plus the
headers are not installed on the target anyway, so this patch includes
no license changes.

Upstream also stopped providing release tarballs, relying on
github-generated tarballs instead.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 367ade3afe..5522f5fe45 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ad73f845965cfd528e70f654e428073121a3fa0dc23caac81a1b1300277d4dba  libgit2-1.1.0.tar.gz
-sha256  afc8bde99ba630012107c25d3c42dde628ec5f0cd3f428131f7e3a0f7d58ff42  COPYING
+sha256  701a5086a968a46f25e631941b99fc23e4755ca2c56f59371ce1d94b9a0cc643  libgit2-1.2.0.tar.gz
+sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 668fa758f8..4c715302d1 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.1.0
-LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
+LIBGIT2_VERSION = 1.2.0
+LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
