Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82033ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 19:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05EA441A39;
	Sun, 18 Sep 2022 19:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05EA441A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_ykway96HzK; Sun, 18 Sep 2022 19:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D50741A2B;
	Sun, 18 Sep 2022 19:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D50741A2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9741BF3F6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB0D41A1F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB0D41A1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJSau5dvg882 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 19:48:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F15141966
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F15141966
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 19:48:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id y14so1150710ljn.7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=A0YEW4QSWsIkZA/ilqN5TX8vej8cQ10Zi1yvBr3HSG4=;
 b=IesIlHcjJuP5JyhmZ1YCWOiLmNNh0hAzU6FRloKxm0awXvUAr5YBHgafj6Erg6DsVr
 /SynkGLwJZk4GjE8IkzSFESPe2+nZApcBHh3GKWidskIsqvXXY43wnOFYPlJ6iqDeYZQ
 hJiKfuANHpi1hpt4IZjUwQxDJnCyH0/Ry1I2ZpNp0wINBG5h+ieu/9whYEuWDHLHYTvQ
 8iJV3Q66BARHfjwRlI/Og33Gv5jZ0sdPW1rQ+zblU4d16H9mKLKwmli4iWlJhsmLRsd6
 fYu7hnsS8M2R6FA78x0uBfzs+86O1syUoFEJoNm+OP+fn/i8f3M+kLmid+Dt1jlRq/hw
 FfAw==
X-Gm-Message-State: ACrzQf1bN34+959/cz/vcV+o3binf5YDSyi3isu9VsZshwiTNUOe7B2x
 IHzd1rdd1VjzmaIugcMZWHOSQRw7jCCEzRc+OIMGjYZYY48=
X-Google-Smtp-Source: AMsMyM6wP7mSKZcsIjySh+9PJ4yGChj1WXnnUTsmMOLa5yYYOCI1QsnQmNSHIkbWm2XA17BBGgvigS40OcHAtLXQ/Dg=
X-Received: by 2002:a2e:a555:0:b0:26c:2f4c:f019 with SMTP id
 e21-20020a2ea555000000b0026c2f4cf019mr4269711ljn.245.1663530522426; Sun, 18
 Sep 2022 12:48:42 -0700 (PDT)
MIME-Version: 1.0
From: erichiggins@gmail.com
Date: Sun, 18 Sep 2022 12:48:31 -0700
Message-ID: <CAHfxMJ6M-R8oHY-8ChxdhanpcL2_04mYARHSxW=YS_gw7Npctg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=A0YEW4QSWsIkZA/ilqN5TX8vej8cQ10Zi1yvBr3HSG4=;
 b=kje3Lc+XrcxiktCALn0vad/6E2/hqc7fIgHJI4Ntmtu3CY7p4zxqPk4K4UVxurbRDA
 jmWGXe0m5oVzr6LvRphZwKHH6nNJuDoo6HvL9HHSEQrIAwnsJ7JqJ5wbML0xxapBZ74s
 nUBF/sBmpaTXoqBDO3MLLE993kAqsNRACzDhDX3hj6npBEWhJBUC3d5GF3bU5P3Vaz2u
 wCmxLRshETVzg0iRV9NaB5FZKGwcqpVxArlvaaSzQrehmQksxA3La0fbUUvaUab9OKW1
 5xaaWznE+lk1i3eAq4APgdrFcnMXGDohKk6QMbAQC3bq1zl66iqbHEH9ohHCfS4L39PN
 jweg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kje3Lc+X
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

Issue description:
The `utils/scanpypi` script makes an erroneous assumption that Python
packages will call `setup()` with the `name` argument. It's not
required and not often used. This causes the script to fail to load
many packages from Pypi.
 For example,  `./utils/scanpypi wheel` returns the following error:
> `Error: Could not install package wheel: 'name'`

Why it happens:
In plain english, the scanpypi` script assumes that a `name` argument
will be supplied to the `setup` call within the `setup.py` of a Python
package. If it's not there, then the script breaks.
Technical details: The `distutils.core.setup` and `setuptools.setup`
calls are wrapped by `setup_decorator` then monkey-patched after
import to set the `BuildrootPackage.setup_args` based on the `args`
and `kwargs` which were supplied by the package's call to `setup`.
This fails with `KeyError` when there are none.

One solution, which I've provided here as a patch, is to define
`BuildrootPackage.setup_args['name']` upon object instantiation using
the provided `real_name` variable, then using that as the fallback
option in the `setup_decorator`.

How I fixed it:
I store the package name as provided from the command line and use it
as a fallback option in case the-way-it-works-now doesn't work.

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
