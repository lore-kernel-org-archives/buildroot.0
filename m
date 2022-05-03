Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFBC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3EDD40ADE;
	Tue,  3 May 2022 14:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4byL75cRA8x; Tue,  3 May 2022 14:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E185340AD6;
	Tue,  3 May 2022 14:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3370F1BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 218FF40AD6
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xeHfGOJfBu3i for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:27:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DDAB401C5
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:27:14 +0000 (UTC)
Received: from pwmachine.home (154.pool92-186-13.dynamic.orange.es
 [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9808920EB0C5;
 Tue,  3 May 2022 07:27:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9808920EB0C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651588033;
 bh=fOG1Ona9lVx83TH2Wfr+z6znLHdTP7uj4ulYH2SdBA8=;
 h=From:To:Cc:Subject:Date:From;
 b=Px3JcQtn+C4ST3XI4so13yvObFnOGqq+l9bh2i+oFYvXsaZV5V0iXsNV6FafspCjt
 kx/R6PwSbkcuuVlrNl6R4RPOwGGLEhhte9kyojugo653US1sI4jEnEtpjht/3y4bBR
 NqLgUYRcytAL2Yec1trgSL1pDBjpbJ8gePTjB4W4=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Tue,  3 May 2022 15:26:59 +0100
Message-Id: <20220503142701.14397-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] Bump sysdig to 0.29.2
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


In my last contribution, I wrote a mistake in sysdig.mk which leaded DRIVER_NAME
to be empty [1]...
(The machine where I built is not the same than the one where I wrote and send
the patch...)
So, in this series, I fixed my previous error and bumped sysdig to its latest
version.

I was, of course, able to build and run sysdig within a VM based on
qemu_x86_64_defconfig:
Welcome to Buildroot
buildroot login: root
# sysdig --version
sysdig version 0.29.2
# sysdig | head
scap: loading out-of-tree module taints kernel.
scap: driver loading, scap
scap: adding new consumer (____ptrval____)
scap: initializing ring buffer for CPU 0
scap: CPU buffer initialized, size=8388608
scap: starting capture
4 14:21:45.440896991 0 <NA> (114) > switch next=10 pgft_maj=7 pgft_min=1300 vm_size=45464 vm_rss=18460 vm_swap=0
...
91 14:21:45.449639600 0 <NA> (0) > switch next=114(<NA>) pgft_maj=0 pgft_min=0 vm_size=0 vm_rss=0 vm_swap=0
scap: deallocating consumer (____ptrval____)
scap: no more consumers, stopping capture

If you see any way to improve this contribution, feel free to share it!

Francis Laniel (2):
  package/sysdig: fix DRIVER_NAME definition
  package/sysdig: bump to version 0.29.2

 package/sysdig/sysdig.hash | 2 +-
 package/sysdig/sysdig.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)


Best regards and thank you in advance.
---
[1] https://git.buildroot.net/buildroot/commit/?id=ea86757e51cf424566f79896335d31d15b89d0d9
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
