Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F2ECDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 17:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D476B4060C;
	Thu, 19 Oct 2023 17:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D476B4060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeZc2tNGDYTl; Thu, 19 Oct 2023 17:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3A4D43037;
	Thu, 19 Oct 2023 17:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A4D43037
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858E71BF4D6
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DBA76FC26
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DBA76FC26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JarzMiIHJYki for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 17:01:14 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C99A6FC1B
 for <buildroot@uclibc.org>; Thu, 19 Oct 2023 17:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C99A6FC1B
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qtWOU-0009Bl-50
 for buildroot@uclibc.org; Thu, 19 Oct 2023 19:01:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 19 Oct 2023 19:00:44 +0200
Message-ID: <pan$9d7d5$3bddbdbe$21e506c7$a819c53b@ID-313208.user.individual.net>
References: <20231019075440.2568312-1-andyshrk@163.com>
 <20231019075512.2568398-1-andyshrk__14620.458455623$1697702154$gmane$org@163.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v2 1/1] igt-gpu-tools: add igt-gpu-tools
 package
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

Hi Andy,

just some small quirks.

There are warnings by check-package

$ utils/check-package package/igt-gpu-tools/*
package/igt-gpu-tools/Config.in:28: should be indented with one tab 
(http://nightly.buildroot.org/#_config_files)
package/igt-gpu-tools/igt-gpu-tools.hash:2: separation does not match 
expectation (http://nightly.buildroot.org/#adding-packages-hash)
package/igt-gpu-tools/igt-gpu-tools.hash:3: separation does not match 
expectation (http://nightly.buildroot.org/#adding-packages-hash)
package/igt-gpu-tools/igt-gpu-tools.hash:6: separation does not match 
expectation (http://nightly.buildroot.org/#adding-packages-hash)
package/igt-gpu-tools/igt-gpu-tools.mk:3: line contains trailing 
whitespace
50 lines processed
5 warnings generated

> +++ b/package/igt-gpu-tools/igt-gpu-tools.hash
> @@ -0,0 +1,6 @@
> +# Locally calculated from download
> +sha256 
ba15b321c5a90da629baf326912c9c0406a903719040eb4959e0af1197935133  igt-gpu-
tools-v1.28.tar.gz

Also the hash for the gz tarball is not needed.

+IGT_GPU_TOOLS_VERSION = v1.28

Please move the "v" from here to this line

+IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/
archive/$(IGT_GPU_TOOLS_VERSION)

so it looks like this

+IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/
archive/v$(IGT_GPU_TOOLS_VERSION)
        ^

This will help using the release monitoring site:
https://release-monitoring.org/project/323454/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
