Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6CCC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5136241C8D;
	Thu,  8 Feb 2024 09:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id do4P7pR9YEph; Thu,  8 Feb 2024 09:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5F6A41C50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5F6A41C50;
	Thu,  8 Feb 2024 09:55:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06E451BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B97D403B9
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCng8vHok3xq for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6606741A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6606741A68
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6606741A68
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rY180-00F8hL-FB; Thu, 08 Feb 2024 10:55:32 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b9d860e2;
 Thu, 8 Feb 2024 09:55:31 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 11:55:27 +0200
Message-ID: <20240208095531.99049-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U0/TfSoyPDe4lwmmsWW9EaqB7uXz1bd28/SR9YkqW1M=; b=MuJeVg1YofcuwPkbpp/Clg8HK4
 0OzDwkJ1Dpi0/bfW2tvf/qcrB+gbztqAtg2SJiudZG/Ki0A0lp5q0H1hQxOcOyFiVMczUtVYldM5X
 M5jVAw19BiKOyZEskznZxmP/kJwNnyZg5T+SUhlVP8+L3pLWxg+K/tMkT3OXVBC1hYeLI8eK1CTAs
 /gl5tPALoKyEQ+7Pb9eyo+09UD+mmpIA8SOn5PUiJ8Jdk/iF1FkbjPY5/+Tkhkk07fPZWH9pcg3AZ
 4quviVFf+yhE1gALTPJ1/u/jE6rmoPwfzOuIRmCRfzLpfCkVM7fEcV93cy2QAYxUsUFcNkCnNFlB9
 A21iYdUA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=MuJeVg1Y
Subject: [Buildroot] [PATCH 0/3] Add support for the WPE WebKit RDK backend
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

This patch series allows using the RDK backend for WPE WebKit. Currently the
main use case is to run WPEWebKit on RaspberryPi boards using on Dispmanx via
the rpi-userland EGL/GLES libraries.

In order to allow using the new wpebackend-rdk package I needed to un-hardcode
usage of wpebackend-fdo, in two places:

 - The cog package may be built without wpebackend-fdo, passing an empty
   list of platform plug-ins. It has built-in support to load "simple"
   WPE backends like wpebackend-rdk. This was done by adding a config
   option for the headless plug-in, instead of always building it, and
   adjusting dependencies.

 - The wpewebkit package does not need wpebackend-fdo at all during the
   build. It only needs a backend installed at run time. This means it is
   enough to make wpewebkit have a "depends on" on any of the backends,
   to make sure they will be in the build, but none needs to be listed in
   WPEWEBKIT_DEPENDENCIES.

I have tested this making builds based on raspberrypi3_defconfig, adding
rpi-userland and then picking wpebackend-rdk + wpewebkit + cog.

Hopefully the patch set is fine and nothing has slipped in the Kconfig
dependencies (typically my weakest part of Buildroot contributions).

Best regards,
-Adrian

Adrian Perez de Castro (3):
  package/wpebackend-rdk: new package
  package/cog: depend on wpebackend-fdo only if needed
  package/wpewebkit: do not depend on wpebackend-fdo

 package/Config.in                          |  1 +
 package/cog/Config.in                      | 28 ++++++++++-
 package/cog/cog.mk                         | 13 +++--
 package/wpebackend-rdk/Config.in           | 57 ++++++++++++++++++++++
 package/wpebackend-rdk/wpebackend-rdk.hash |  5 ++
 package/wpebackend-rdk/wpebackend-rdk.mk   | 43 ++++++++++++++++
 package/wpewebkit/Config.in                |  9 ++--
 package/wpewebkit/wpewebkit.mk             |  2 +-
 8 files changed, 147 insertions(+), 11 deletions(-)
 create mode 100644 package/wpebackend-rdk/Config.in
 create mode 100644 package/wpebackend-rdk/wpebackend-rdk.hash
 create mode 100644 package/wpebackend-rdk/wpebackend-rdk.mk

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
