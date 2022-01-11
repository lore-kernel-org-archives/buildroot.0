Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E603DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 07:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1D1410C3;
	Tue, 11 Jan 2022 07:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ngMKP61XdZC; Tue, 11 Jan 2022 07:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B377E410C1;
	Tue, 11 Jan 2022 07:29:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB2381BF332
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 07:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C70A7833A7
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 07:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIbUjhd5HaPz for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 07:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E55B82D40
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 07:29:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a5so27254604wrh.5
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ny2HbOtleYrW1bc1CI5X3XzOE7fSB9GLqSqzDsnsDa0=;
 b=J5b8MVvKG1OFiSfrDf5PHA+MlA3Maz1Ja2bQjX/+CxXNpTqds2RxyFW6zUT+3Tj9td
 tmXUYPcKuEvfb3qiqgDxIW544ZjkP//GhdArD5Y3g2McZcN2+T/gjc2xOPXc07TOXaXa
 xVh/CApta4O0/VD3IEerrX9LEAxIZ7Jld5PzWGljVAk2LdSE2EaDHyWgpyzUE7MJJsfo
 MjICxgZ3wRFdIre9ReRMPxn6q95u8RdtjEG7qpS5UqJxnuAMMJdujhhQEdmXh9ZhBWkg
 va9nbiOHYgqkjFY1k+RhUJkZUSdUepJkuzeIyvy9U5uN4fc8XXLA/S6vvMG8nYVZunkP
 0wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ny2HbOtleYrW1bc1CI5X3XzOE7fSB9GLqSqzDsnsDa0=;
 b=XknpdsdJq+MmIGfvt5yj6J35rLIELYMDJ947hhAdqLGDg8uNR524UHYIJr35Lp1kH/
 aRFFVhqIqcQz5wMIH8GBhnaapbitg/CCgHXI+eKzf5sEbFPzWS93+BCOKpNFAYtjirnk
 h57ZhP5HhzR3OAQ2NVZMq83DMhiGDUS2DEkIOcU/ReqMw24U1D2VFedlqzBm0y4JCvA7
 o6AsHDUgDJNZxYY40KSsfi++BL9XUFr8rCdy5J5bFYEu2GpnspXuC4e/aT0M/xP0c1xH
 YVam005D1Mevixi9/cpuxRvkHJaCcIYbLra70O+rnEn80/VrZiQZ69toJKCOmGSbx2nI
 WtBA==
X-Gm-Message-State: AOAM530/YQ6ofPUAXtmt/nqB63gkoXrIdHIykfXapAmB4QyUn9bdoc0v
 bE9pqqJ+evbHq6Via0JkRBppMnkVMrI=
X-Google-Smtp-Source: ABdhPJx6B0oLFtuFwbMXBQK90gBEBobySuVZsi+A2E+rIyjz7FW3pgFMoNXGwAAzkIUPt+6PvfQJnA==
X-Received: by 2002:adf:f251:: with SMTP id b17mr1112523wrp.599.1641886174153; 
 Mon, 10 Jan 2022 23:29:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c3sm189240wrd.54.2022.01.10.23.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 23:29:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 08:28:09 +0100
Message-Id: <20220111072809.2133986-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: needs python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-pyparsing dropped python2 support since version 3.0.0:
https://github.com/pyparsing/pyparsing/blob/master/docs/whats_new_in_3_0_0.rst#python-2-x-no-longer-supported
resulting in the following build failure since bump to version 3.0.6 in
commit 7affc7827aee0e07ec94d3b4d91c2e23bda8d937:

  File "setup.py", line 8, in <module>
    from pyparsing import __version__ as pyparsing_version
  File "/home/buildroot/autobuild/instance-0/output-1/build/python-pyparsing-3.0.6/pyparsing/__init__.py", line 100
    major: int
         ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/8ac5224f4b6c2c59035dbfb53541e76f58b15e47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-httplib2/Config.in  | 7 +++----
 package/python-pyparsing/Config.in | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
index 39671f2386..0095d95b51 100644
--- a/package/python-httplib2/Config.in
+++ b/package/python-httplib2/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_HTTPLIB2
 	bool "python-httplib2"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3 # python-pyparsing
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  httplib2 is a comprehensive HTTP client library, httplib2.py
diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 926ca07ed7..9b5894116d 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
 	bool "python-pyparsing"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  The pyparsing module is an alternative approach to creating
 	  and executing simple grammars, vs. the traditional lex/yacc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
