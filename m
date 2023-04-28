Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C96C77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 15:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D33427F2;
	Fri, 28 Apr 2023 15:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D33427F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVK3mi-OApy0; Fri, 28 Apr 2023 15:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65D2427A0;
	Fri, 28 Apr 2023 15:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A65D2427A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49181BF57B
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 15:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83709427A0
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 15:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83709427A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2B84tUFQf6cD for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 15:22:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6392F42724
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6392F42724
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 15:22:36 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (166.red-83-59-184.dynamicip.rima-tde.net [83.59.184.166])
 by linux.microsoft.com (Postfix) with ESMTPSA id 56A8621C33F5;
 Fri, 28 Apr 2023 08:22:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 56A8621C33F5
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 16:22:09 +0100
Message-Id: <20230428152211.20394-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1682695354;
 bh=Wev+0vPGvwCJQU4oTnBDf0Iszff55CQVds7NxGidpdM=;
 h=From:To:Cc:Subject:Date:From;
 b=J0nDS1GAQnZoW5ufSAMyJLdCD6ZzLaZIMKR5imtKuIbylIykQlDo1WOfL5O9+3kW0
 WjWrYbXz32v4MaGFcJkrVBWNm9HMCq+6O7Sl9yKytNqQNo8HoHAMSm49UkSy0KPe3F
 gR/5029tX0zI/r9oK0o9jplD+wH1W55hG4rkwzYg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=J0nDS1GA
Subject: [Buildroot] [RFC PATCH v1 0/2] Bump sysdig and falco libs
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


With this contribution, I bumped sysdig and falcosecurity-libs.
Sadly, I am not fully satisfied with the result, hence the fact I marked it as
RFC because I would like to get your feedback to make it better.

First of all, sysdig builds and runs:
Welcome to Buildroot
buildroot login: root
# sysdig --version
sysdig version 0.31.4
# sysdig | head
scap: loading out-of-tree module taints kernel.
scap: driver loading, scap
scap: adding new consumer (____ptrval____)
scap: initializing ring buffer for CPU 0
scap: CPU buffer initialized, size=8388608
26 15:12:28.226519423 0 sysdig (108) > switch next=0 pgft_maj=10 pgft_min=1348 vm_size=47288 vm_rss=19408 vm_swap=0
27 15:12:28.227409149 0 <NA> (0) > switch next=13 pgft_maj=0 pgft_min=0 vm_size=0 vm_rss=0 vm_swap=0
...

Nonetheless, I had to increase the minimal size of the image as libsinsp.a is
quite big:
# du -sh /sysdig/libsinsp.a
152.7M  /sysdig/libsinsp.a
I am not forcefully sure where this library is used, I will investigate and
maybe we can run everything without it.

Secondly, I had to tweak heavily the libscap CMakeLists.txt to install several
shared libraries.
Indeed, the libraries are compiled as static, but the sysdig binary is not
static, so it needs plenty of shared libraries to be run from the image.
I am not really sure what is the best solution here (either compiling sysdig as
static or not), but in any case my patch for CMakeLists.txt is not really clean.

Finally, I had to modify the magical number in falcosecurity-libs.mk for
API_VERSION and SCHEMA_VERSION.
While this is not really a big pain, I am wondering if this is not possible to
read the corresponding values from the corresponding files (i.e. API_VERSION and
SCHEMA_VERSION).
So, for future update we would not need to take care of it ourselves.

Francis Laniel (2):
  package/sysdig: bump to version 0.31.4
  package/falcosecurity-libs: bump to version 0.10.5

 .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
 .../falcosecurity-libs.hash                   |  2 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 12 ++--
 ...BUNDLED_DEPS-before-getting-nlohmann.patch | 52 ----------------
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      |  8 ++-
 6 files changed, 77 insertions(+), 60 deletions(-)
 create mode 100644 package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
 delete mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch


Best regards and thank you in advance for your advises.
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
