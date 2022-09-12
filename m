Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D996AECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 16:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF7D415C3;
	Mon, 12 Sep 2022 16:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF7D415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxuz6BLDZN8B; Mon, 12 Sep 2022 16:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434EA415AE;
	Mon, 12 Sep 2022 16:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434EA415AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE291BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 16:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 180A9415A3
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 16:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180A9415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBNBLJtuKZgB for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 16:28:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDBE41559
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CDBE41559
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 16:28:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q21so15848666lfo.0
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=+46zhRalzbem6QhCQ9Z6khrxGmv7axuNM0qbtIzW9b4=;
 b=A2q5LNE3srfB+FwgvqTVf8r9s5q5Ah/trnDJjFG4O/l7lb+08fu2HiGsTdbRPBM1zK
 MlsrO/oqUFxSQ2zIeloHnlsg6lOeJbelVDerhvJof5/Bfmdk3TCxRoF8cnXF6+wzeTgd
 mW534N2QSxd4vYGuhSwZvotvDM1VtGgQ/pGwrmW7QcVJYqWZfsD9HY1y4joqSHamny3N
 PSu8Wro4EmR602FK4uE0pO0Fadciydy/O7vgnF+pOpwFuZM6b4rxxRbt46BKcczWyWV/
 iISD47QJcnxYFxb5ZcYaOEQRdUliHhvEsZI9Wiilxn0FhzR2DcYKk7bbjsVn7zJt4FuY
 2TbQ==
X-Gm-Message-State: ACgBeo3s6b7IO8dC3JuuVC/STIrI2Yl8seVa7wEcCzxEmfxvwTu0IcH7
 3qIlWz2mabRC+OWN0CwaIpJNCYY+ukidEXKXR0f4x515ea0=
X-Google-Smtp-Source: AA6agR6APYBPyQAb4Rx1WxssbEim5XOEl51qMDcACajKEZJjvHX8JbUB/fv7ljokgaj02yvokP/DYMWMXRlm+Cqdw8Q=
X-Received: by 2002:a05:6512:2609:b0:491:10ba:31f0 with SMTP id
 bt9-20020a056512260900b0049110ba31f0mr8614284lfb.334.1663000123239; Mon, 12
 Sep 2022 09:28:43 -0700 (PDT)
MIME-Version: 1.0
From: erichiggins@gmail.com
Date: Mon, 12 Sep 2022 09:28:32 -0700
Message-ID: <CAHfxMJ4cFRmUBteM-tM_gM=5fbdupjJRaahnbc34wifYgSn=gg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=+46zhRalzbem6QhCQ9Z6khrxGmv7axuNM0qbtIzW9b4=;
 b=lOIR7wKOXxBpe0S88Suz1UpShSmiKN5L5vEVQGOp9SZKEsWdE5GQGAY210jrpXY3xP
 9ybsC+p214I7t0CXOxjvITLQvjvtRfVK6EwlUq5pETdiQK5diNy7QOwcdH+L4la8YuUS
 fUbl9MFXvrVDcP3Bb1JeunGm7ajq7mSOrSNxlXz/aD3WmVczyhCcHJEJVdpgB4HGuxX9
 rRAO2EqOn2xzomfPr+GhYYwnTY0fciTW0HrOWGfT1jiK7XXFDEDWjstQSZgf9zM9nS9A
 3o8ON5D8se5WWQXPF6o/ddwRn7+N65yOVvhU7kZmc0cKsSLigVZyMQ4IHY/bTCBACRxv
 0ROA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lOIR7wKO
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: supply package name to
 setup() when not provided
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Eric Higgins <erichiggins@gmail.com>
---
 utils/scanpypi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 452b4a3fc3..a5522a879e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -58,8 +58,9 @@ def setup_decorator(func, method):
     def closure(*args, **kwargs):
         # Any python packages calls its setup function to be installed.
         # Argument 'name' of this setup function is the package's name
-        BuildrootPackage.setup_args[kwargs['name']] = kwargs
-        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
+        name = kwargs.get('name', BuildrootPackage.setup_args['name'])
+        BuildrootPackage.setup_args[name] = kwargs
+        BuildrootPackage.setup_args[name]['method'] = method
     return closure

 # monkey patch
@@ -147,6 +148,7 @@ class BuildrootPackage():
         self.url = None
         self.version = None
         self.license_files = []
+        self.setup_args['name'] = self.real_name

     def fetch_package_info(self):
         """
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
