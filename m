Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC7FC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A15481586;
	Tue, 26 Dec 2023 20:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A15481586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OEcAsMl3MFV; Tue, 26 Dec 2023 20:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B91E1815CC;
	Tue, 26 Dec 2023 20:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B91E1815CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A74011BF966
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C9BD4098F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C9BD4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIlsh2nIrdkH for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C326408D5
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C326408D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5288E83600; Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:21:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 449538348ebc941bd7a2ebde3e4e691daca45a91
X-Git-Newrev: 312f4ab4c8a79e8cdc40dfed6870ac2aea981883
X-Patchwork-Hint: ignore
Message-Id: <20231226202534.5288E83600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl-intel-gpu: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=312f4ab4c8a79e8cdc40dfed6870ac2aea981883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:intel:onevpl_gpu_runtime is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/7F7056CA-A41D-4AB5-B9CC-9DE24A27B8BA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 0a62ebbb6a..da6da2ad61 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -8,6 +8,8 @@ ONEVPL_INTEL_GPU_VERSION = 23.4.3
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
+ONEVPL_INTEL_GPU_CPE_ID_VENDOR = intel
+ONEVPL_INTEL_GPU_CPE_ID_PRODUCT = onevpl_gpu_runtime
 ONEVPL_INTEL_GPU_DEPENDENCIES = libva libvpl
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
