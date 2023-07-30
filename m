Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A9C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 11:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0073D60A5C;
	Sun, 30 Jul 2023 11:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0073D60A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9APwwNTKS-B6; Sun, 30 Jul 2023 11:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E91060864;
	Sun, 30 Jul 2023 11:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E91060864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF3351BF3DC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9891E40193
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9891E40193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCsh-VHfLzCl for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 11:04:35 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89350400AB
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 11:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89350400AB
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B55CBA4C0824
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 13:04:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50182)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ4Dw-0002YL-1V
 for buildroot@buildroot.org; Sun, 30 Jul 2023 13:04:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 13:04:32 +0200
Message-Id: <20230730110432.3570583-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690715072;
 bh=VxNVbUeWl4uqtdAzxMk6tOpQ4to9IK60wvsxv2zaXyY=;
 h=From:To:Subject:Date:From;
 b=qrMtms1+cCr0A1jvpmhkZzG5tHw8faxfpgNuKhmA7nuvRNKj+UBU1JiZnArTKWuJ6
 cgvvrh4VV1sAG+FyXinuMdYQvjFHz3AMyqhlfQIyeXZyfva2/S5PCt1iw/x2o7JQRn
 12F4oZyDp9Vwrf2JbpZgqATzaDln2fT/yHL9RkCiaF17zHDrb838sMBsv5wGfwzqzg
 T6odZ6tdw4ck9VHGBXm+KcG1fngwDgYSSMxBGuzSlBJV3i5JJklDtU4F/11DUiW7wl
 nmGa2hOy3IJaVqg2iJAGb0OgQzys06sjmbxHBpS1tYYomu29045zYidAn0aj8JxqaK
 CytM+X+HgGVyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qrMtms1+
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: sort entries of Bernd Kuhls
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8b39a0347b..2d6fbd333a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -343,8 +343,8 @@ F:	package/giflib/
 F:	package/gkrellm/
 F:	package/gpsd/
 F:	package/gptfdisk/
-F:	package/hdparm/
 F:	package/hddtemp/
+F:	package/hdparm/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
@@ -362,19 +362,19 @@ F:	package/libbroadvoice/
 F:	package/libcap/
 F:	package/libcdio/
 F:	package/libcec/
-F:	package/libdisplay-info/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libde265/
 F:	package/libdeflate/
+F:	package/libdisplay-info/
 F:	package/libdrm/
 F:	package/libdvbcsa/
 F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
 F:	package/libebur128/
-F:	package/libfribidi/
 F:	package/libfreeglut/
+F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
 F:	package/libglfw/
@@ -441,9 +441,9 @@ F:	package/perl-io-html/
 F:	package/perl-lwp-mediatypes/
 F:	package/perl-mail-dkim/
 F:	package/perl-mailtools/
+F:	package/perl-netaddr-ip/
 F:	package/perl-net-dns/
 F:	package/perl-net-http/
-F:	package/perl-netaddr-ip/
 F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
@@ -455,17 +455,17 @@ F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
 F:	package/python-glslang/
+F:	package/python-mako/
 F:	package/python-mwclient/
 F:	package/python-mwscrape/
 F:	package/python-mwscrape2slob/
-F:	package/python-mako/
 F:	package/python-oauthlib/
 F:	package/python-pyicu/
 F:	package/python-pylru/
 F:	package/python-requests-oauthlib/
 F:	package/python-slob/
-F:	package/rsync/
 F:	package/rrdtool/
+F:	package/rsync/
 F:	package/rtmpdump/
 F:	package/samba4/
 F:	package/sofia-sip/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
