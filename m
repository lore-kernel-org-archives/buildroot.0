Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D868CEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 15:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FC0840AA;
	Fri, 11 Aug 2023 15:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FC0840AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGx2uDYXJexA; Fri, 11 Aug 2023 15:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7EB9840A7;
	Fri, 11 Aug 2023 15:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7EB9840A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65FF41BF575
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C5FE403E0
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C5FE403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O64_jqKVRTrh for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 15:27:15 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9CF64033F
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 15:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9CF64033F
Received: from pwmachine.numericable.fr (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9F3A520FD0DE;
 Fri, 11 Aug 2023 08:27:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9F3A520FD0DE
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 17:27:06 +0200
Message-Id: <20230811152710.43564-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1691767635;
 bh=/ZOnUVcxcJ37sb5IG2t+hSea1xqQjwbZqoligNzbRvY=;
 h=From:To:Cc:Subject:Date:From;
 b=isFvr9yfYK5+wc8DHJKOE0gG60U2JS8zqCpkIGiehDb5KPGWbEFvIsqcBWt9hUBLz
 9tyqJWMa7oaznrVyuqA3AWRc1S3bfi9fG5R0dfI6QJU8th5pJ9ClptdWzaS88upzQ4
 xuu5jb5kZ9unhwTbVmHZYbZeXnrG2WEvtF1abXL8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=isFvr9yf
Subject: [Buildroot] [RFC PATCH v2 0/3] Bump sysdig and falco libs
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
171.4M  /sysdig/libsinsp.a
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

Changes since:
 v1:
  * Removed everything regarding VALIJSON in sysdig.mk.
  * Bumped first falcosecurity-libs to avoid problem when building it.
  * Added runtime test for sysdig.

Francis Laniel (3):
  package/falcosecurity-libs: bump to version 0.10.5
  package/sysdig: bump to version 0.31.4
  support/testing/package: add new test for sysdig

 .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
 .../falcosecurity-libs.hash                   |  2 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 10 +--
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      |  9 ++-
 .../testing/tests/package/test_sysdig.config  |  1 +
 support/testing/tests/package/test_sysdig.py  | 46 ++++++++++++++
 7 files changed, 122 insertions(+), 9 deletions(-)
 create mode 100644 package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
 create mode 100644 support/testing/tests/package/test_sysdig.config
 create mode 100644 support/testing/tests/package/test_sysdig.py

--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
