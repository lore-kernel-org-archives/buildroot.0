Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC804C2BA15
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 15:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E8C408C5;
	Mon, 17 Jun 2024 15:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tquRBr1HQ3o9; Mon, 17 Jun 2024 15:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24DFB4064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24DFB4064A;
	Mon, 17 Jun 2024 15:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B73FE1BF296
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFFED81C67
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_0TR-LdhNJG for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 15:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=flaniel@linux.microsoft.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D76B81C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D76B81C44
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D76B81C44
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 15:11:19 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (75.red-83-59-17.dynamicip.rima-tde.net [83.59.17.75])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9E3E120B7007;
 Mon, 17 Jun 2024 08:11:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9E3E120B7007
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 16:10:16 +0100
Message-Id: <20240617151020.31120-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1718637077;
 bh=tCepCY7vaiHUtToLqKOk2NhTMmqGatbyuHN1vNx2JRk=;
 h=From:To:Cc:Subject:Date:From;
 b=TYlaHiK78Gi8io2r0SHdTLQPiFcZXK9k9jmmGynE2N2/9tNDhX+L3mt9xWMNWlIYi
 ViYvd3/anaUdV367xoT5YylWbw5XCEQast3+AHgYdV/WcZmpe42R4zaOckXy4g0JvN
 04NXVamFLDPcLriXQFYzwtx4qXEFi06zqNnIMpNY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=TYlaHiK7
Subject: [Buildroot] [RFC PATCH v1 0/4] Bump pahole and tbb and remove sysdig
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

With this contribution, I am bumping pahole and tbb to the latest
available versions.
Also, I am removing package related to sysdig: falcosecurity-libs
and sysdig itself.

On this point, I would like to have your opinion, hence the RFC
label.
Maintaining sysdig has been complicated as this software changes
really fast which has impact on the way to build it.
Sadly, I cannot cope with this changes as fast as they arrive to
be able to maintain it in buildroot.
So, rather than having a very outdated package, I think this is
better to remove it.

Francis Laniel (4):
  package/pahole: bump to version 1.27
  package/tbb: bump to version 2021.12.0.
  package/sysdig: remove package.
  package/falcosecurity-libs: remove package.

 DEVELOPERS                                    |  3 -
 package/Config.in                             |  2 -
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 --------
 package/falcosecurity-libs/Config.in          | 32 --------
 .../falcosecurity-libs.hash                   |  5 --
 .../falcosecurity-libs/falcosecurity-libs.mk  | 82 -------------------
 package/pahole/pahole.hash                    |  2 +-
 package/pahole/pahole.mk                      |  2 +-
 package/sysdig/Config.in                      | 34 --------
 package/sysdig/sysdig.hash                    |  3 -
 package/sysdig/sysdig.mk                      | 38 ---------
 package/tbb/tbb.hash                          |  2 +-
 package/tbb/tbb.mk                            |  2 +-
 13 files changed, 4 insertions(+), 237 deletions(-)
 delete mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 delete mode 100644 package/falcosecurity-libs/Config.in
 delete mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
 delete mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk
 delete mode 100644 package/sysdig/Config.in
 delete mode 100644 package/sysdig/sysdig.hash
 delete mode 100644 package/sysdig/sysdig.mk

Best regards.
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
