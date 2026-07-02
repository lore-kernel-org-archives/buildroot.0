Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32077C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0968360648;
	Fri,  3 Jul 2026 14:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jGsoTt2JucH; Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9C460A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088910;
	bh=XjSqgtuJip6XOF7O2uqAGxSa7r3UOKpZ/IW8Tq2Q+/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IruWe8c1rXVfyhTNIf/uB/esvqUvAW6rJXVDWvsYFRfz9sm85aCTaEaAQv0VS+UXV
	 hkW4WNvzg3qTdQ7lgCraATugn4OuTgF/TH4U1xww5qXyUcd3N4XPib95phajlle3rQ
	 umSaKZ2QnQrlJSwFxqC3YyhlV+MMst7gxlnTDeasbxxpOoyb7oz49jZSS9opWqiTXy
	 NU3Vajb46mHYhCKZMZ8en5a2EY9iGFkDEwViQm+EAbZtGMmKl0sS51yi844PEOhHKz
	 TPLy6m2MAzI03/HU9fOBu68XoSusKaKP5s6tMyUizAq8GBrwbtEOvjnWEMNAqccEL+
	 ZwmSEmtBl/C8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9C460A55;
	Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3983363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9FD980BA4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1BkikAfFms1 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B70780AF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B70780AF1
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ED0B883A2; Fri,  3 Jul 2026 14:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:27:26 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1e06978a0f009f105e54f63b83b764f4e05b9a80
X-Git-Newrev: a2d659937bb3823c3fb928a1bc805f0de676bfc0
X-Patchwork-Hint: ignore
Message-Id: <20260703142757.9ED0B883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mosquitto:
 requires cmake >= 4.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2d659937bb3823c3fb928a1bc805f0de676bfc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

With an older cmake version, like the 3.25.1 as available in the docker
reference image, mosquitto fails to build when ccache is enabled:

    [ 98%] Building CXX object lib/cpp/CMakeFiles/mosquittopp.dir/mosquittopp.cpp.o
    In file included from [...]/buildroot/output/build/mosquitto-2.1.2/lib/cpp/mosquittopp.cpp:17:
    [...]/buildroot/output/host/opt/ext-toolchain/i686-buildroot-linux-gnu/include/c++/15.1.0/cstdlib:83:15: fatal error: stdlib.h: No such file or directory
       83 | #include_next <stdlib.h>
          |               ^~~~~~~~~~
    compilation terminated.

Officially, mosquitto only requires cmake 3.18, but that proves to not
be enough, in fact...

We workaround that by requiring cmake 4.3, which is the one version that
could be tested with our host-cmake.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit da9dcddff15af3e99cbc20297f4a3d25e89c66e1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mosquitto/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 08223bc5db..c26b1ece9c 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU  # lib peeks in malloc() internals; broker fork()s
 	depends on !BR2_STATIC_LIBS
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
 	select BR2_PACKAGE_CJSON
 	help
 	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
