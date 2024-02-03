Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1544C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA63416A4;
	Sat,  3 Feb 2024 17:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA63416A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGG1aJetJg6H; Sat,  3 Feb 2024 17:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F0340887;
	Sat,  3 Feb 2024 17:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F0340887
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 232871BF5B5
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10FAA4027F
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmTpq64vP9_A for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8069E400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8069E400E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8069E400E4
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FD4086883; Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:24:48 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 67fa11afccc08f6ca9143a0feba63d0e7680e40e
X-Git-Newrev: ab4fb4493e633c1e6946991646b92130c5c8d946
X-Patchwork-Hint: ignore
Message-Id: <20240203122959.1FD4086883@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-numpy: add
 CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab4fb4493e633c1e6946991646b92130c5c8d946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:numpy:numpy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/C19878E8-7FFC-4BB4-B1A8-F396CB169DF2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9899f06170f292bc70a57ac9b364490503c05e42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-numpy/python-numpy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 812bfdae4a..fda42e7d9d 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -14,6 +14,8 @@ PYTHON_NUMPY_LICENSE_FILES = \
 	numpy/core/include/numpy/libdivide/LICENSE.txt \
 	numpy/linalg/lapack_lite/LICENSE.txt \
 	tools/npy_tempita/license.txt
+PYTHON_NUMPY_CPE_ID_VENDOR = numpy
+PYTHON_NUMPY_CPE_ID_PRODUCT = numpy
 
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
