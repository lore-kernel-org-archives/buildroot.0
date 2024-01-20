Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616DFC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CE8040AA3;
	Sat, 20 Jan 2024 23:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE8040AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81WLa2IyNpOq; Sat, 20 Jan 2024 23:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15FD240A91;
	Sat, 20 Jan 2024 23:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15FD240A91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF90B1BF21A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9921E60773
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9921E60773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXisj5xurz1o for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D343560737
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D343560737
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1F248634C; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:58:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f905f06bdf212520ab1f37179b5b6d5a2dee132
X-Git-Newrev: 9899f06170f292bc70a57ac9b364490503c05e42
X-Patchwork-Hint: ignore
Message-Id: <20240120230317.C1F248634C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=9899f06170f292bc70a57ac9b364490503c05e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:numpy:numpy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/C19878E8-7FFC-4BB4-B1A8-F396CB169DF2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-numpy/python-numpy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index b52e0da17d..383135f9fe 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -14,6 +14,8 @@ PYTHON_NUMPY_LICENSE_FILES = \
 	numpy/core/include/numpy/libdivide/LICENSE.txt \
 	numpy/linalg/lapack_lite/LICENSE.txt \
 	tools/npy_tempita/license.txt
+PYTHON_NUMPY_CPE_ID_VENDOR = numpy
+PYTHON_NUMPY_CPE_ID_PRODUCT = numpy
 
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
