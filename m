Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA6C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 14:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55CFB6105B;
	Sun, 31 Jul 2022 14:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CFB6105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oARUdN1RBtoP; Sun, 31 Jul 2022 14:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8461461059;
	Sun, 31 Jul 2022 14:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8461461059
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4859E1BF36F
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D7DC40CF2
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7DC40CF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXkgXAgWwesl for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 14:00:06 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027C140194
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027C140194
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 14:00:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id I9NLowrKukwOOI9NLovVg4; Sun, 31 Jul 2022 15:52:59 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 15:52:58 +0200
Message-Id: <20220731135258.2707220-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNp04+6lOxoOMqIKHUt8fOzWP/fkVVCso74TvFCpstE2Esvs25KLeEYlT/WFWow5oep3dxtvb2vyCR7yt6YqfPvlN0LKMCVpu+hJxGgsApDeZJDrpk1b
 dmOIMsx1jPvCWeUc8PNanZyRODCq6Qkq31VevfLwDjbJryZKTehRtscFtaJz8I/6itLar766F1/OJuJnEvAdjZPS4X2GAIMtxCD5KYMobuKcCQoJLiBXWIUB
 GnF0GvjN8bpOJjdPQJSgBdxlahm0wC4i5CuSntgZ0Rf2GVjVQ1wWyw9soZHHbaqCp2H+I0t7Svn2Ob/E135IfQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659275579; bh=RgplN6K7h8uXm7if1zcuhcM6dZN8K1Nz4puN1n7a/hM=;
 h=From:To:Subject:Date:MIME-Version;
 b=D4SxC0wKTrVkJNJ/v0OPtkmi9uGFSJAA7EuZVtleh6FMXfEoUFpJIVNB7o0uK8A3J
 PhjlZEP7zkgY2joENjoONn4dpqO78G8tHFdE/+5pZr9eCMfS/F3D8uQkUfZUe71dsN
 HKanGcYDkZuwUD13BR/mDijIzFHYJdZyZjff0d6ije41Y1neXoAtrI4KQUzBsebLnt
 ARRu+Y/o+DSaRXEk9hswNV5clOktlxGwl9eAoA4TigIEIoCH8iGuUKXxHbVghCo7fR
 k8D6l7aYd3GUHHHXORr3SpyIncK/TfheGovtD57mLcBx0guN0uwV8YPsVg7nDZEvhR
 Umfac90tySupg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=D4SxC0wK
Subject: [Buildroot] [PATCH] package/babeltrace2: fix host package build
 failure
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building host-babeltrace2 asciidoc python3 module is required but
Buildroot doesn't make it available, so let's --disable-man-pages for host
as we do for target.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/babeltrace2/babeltrace2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index eedfc72b8c..2b2ab7db40 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -17,7 +17,7 @@ BABELTRACE2_DEPENDENCIES = libglib2 host-pkgconf
 # options for host packages, just build support for it
 # unconditionally.
 HOST_BABELTRACE2_DEPENDENCIES = host-libglib2 host-pkgconf host-elfutils
-HOST_BABELTRACE2_CONF_OPTS += --enable-debug-info
+HOST_BABELTRACE2_CONF_OPTS += --disable-man-pages --enable-debug-info
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 BABELTRACE2_DEPENDENCIES += elfutils
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
