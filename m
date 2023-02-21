Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A4EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9152B61245;
	Tue, 21 Feb 2023 17:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9152B61245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id foVDew2CCiTk; Tue, 21 Feb 2023 17:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20EB61249;
	Tue, 21 Feb 2023 17:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D20EB61249
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA6F1BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5520261230
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5520261230
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pR6bQiKDlkV for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DBEE61202
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DBEE61202
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 1BCB1202B6;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:52 -0600
Message-Id: <20230221172205.2450111-2-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=l5ysllLkVOsA9r2Ff62UJsQhkPL/EUlZzmSHM2MbhRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gs+CjMMWnGn4r392HZKGQgj/7gyqQGU1ID66+rc5paFGpJwUx8V+fv0ZDOr64Tz9Y
 K+bVrO3/CJILw6uqNOiIYES4XYRw2LTHWPyT+dbP50zp2963WMB/JtEo4XHfJab7cO
 TFLbe/hPNAKEAouvehJpDKtatcyIpy/xuJ3h27D0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=gs+CjMMW
Subject: [Buildroot] [PATCH 02/15] manual: remove LIBFOO_GETTEXTIZE_OPTS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 docs/manual/adding-packages-autotools.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a041d91eb6..8655a79693 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -136,12 +136,6 @@ cases, typical packages will therefore only use a few of them.
   'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
   values are +YES+ and +NO+. The default is +NO+.
 
-* +LIBFOO_GETTEXTIZE_OPTS+, to specify additional options passed to
-  the 'gettextize' program, if +LIBFOO_GETTEXTIZE=YES+. You may
-  use that if, for example, the +.po+ files are not located in the
-  standard place (i.e. in +po/+ at the root of the package.) By
-  default, '-f'.
-
 * +LIBFOO_LIBTOOL_PATCH+ tells whether the Buildroot
   patch to fix libtool cross-compilation issues should be applied or
   not. Valid values are +YES+ and +NO+. By
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
