Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB64AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:20:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A268E611BD
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A268E611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EB0F40127;
	Tue,  9 Nov 2021 08:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJAdEcCIwuvW; Tue,  9 Nov 2021 08:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64B95402F6;
	Tue,  9 Nov 2021 08:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8BF1BF9AD
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18D1480DAC
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wzYv_8-9Jno for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:20:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 452FE80DE3
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 01EF58B75C; Tue,  9 Nov 2021 08:16:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 09:15:44 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 41ece1ac6c01c2d35f5e962e2abaea6314e7a996
X-Git-Newrev: b6a54d7472ee1d89db34b79b5691300ba372b915
X-Patchwork-Hint: ignore
Message-Id: <20211109081630.01EF58B75C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/refpolicy: move
 patches to subdirectory
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6a54d7472ee1d89db34b79b5691300ba372b915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

refpolicy patches are for upstream version but when using a custom version
from git they may fail to apply.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417630

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch       | 0
 .../0002-policy-modules-services-cvs.te-make-inetd-optional.patch         | 0
 .../0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch       | 0
 .../0004-policy-modules-services-ftp-te-make-ssh-optional.patch           | 0
 .../0005-policy-modules-services-samba.te-make-crack-optional.patch       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch b/package/refpolicy/2.20210203/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
similarity index 100%
rename from package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
rename to package/refpolicy/2.20210203/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
diff --git a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch b/package/refpolicy/2.20210203/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
similarity index 100%
rename from package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
rename to package/refpolicy/2.20210203/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
diff --git a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch b/package/refpolicy/2.20210203/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
similarity index 100%
rename from package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
rename to package/refpolicy/2.20210203/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
diff --git a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch b/package/refpolicy/2.20210203/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
similarity index 100%
rename from package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
rename to package/refpolicy/2.20210203/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
diff --git a/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/2.20210203/0005-policy-modules-services-samba.te-make-crack-optional.patch
similarity index 100%
rename from package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
rename to package/refpolicy/2.20210203/0005-policy-modules-services-samba.te-make-crack-optional.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
