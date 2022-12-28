Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8814C3DA7C
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 18:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5BA814BB;
	Wed, 28 Dec 2022 18:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5BA814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkosQ7h12B9e; Wed, 28 Dec 2022 18:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B77814B6;
	Wed, 28 Dec 2022 18:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3B77814B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD891BF40A
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 189D760A82
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189D760A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mSQLqUqHg-r for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 18:15:06 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FD7060759
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FD7060759
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 18:15:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AaqPpRn2O0hPEAaqPpRpOA; Wed, 28 Dec 2022 19:08:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 19:08:00 +0100
Message-Id: <20221228180800.3417009-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKlMZ1h5c4J3PF0LnkeFNjzfYPhnNGJOo+bUxJ/lW+i1Ws00RAamI58qdY6kNjJqTPDl5wuI6w/es1ViEKWE3xW8xezPM0b8GzkGYEUyKvR+MfVFzB/Z
 fuWWBhvzeBeQzjU3l6cXa/2yObE8NXgJ9f2UPG7o7GG8fE7c3hj8noM9OAyvpXRi27hBMKM+4NwPQrzc7sOvXMHA0fHFPJ4/yL5/cK5140KeCEKlGJSVANCM
 68cSB8Hcd4XXooJwobFvK38fSZDz7EY4d9o0/HmVJJk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672250881; bh=D5NZ3FvaOmHz69Pjl0pYehOUi1A17oK4Rz4SefWCw7s=;
 h=From:To:Subject:Date:MIME-Version;
 b=IlRoRBOsCjhS/6It9w7Y41ljwOS019dI4l5Pyid+vj0bdn9yQH8kyfSTkohQD/TRF
 kL/MNRtbAdhmxENo9eNOS44yCstg3rlQY/6n3MRQTbMwESZweDRd1bH3UJ6LUebB48
 o1TsFbNehXtFvXbBb03YC3ijowRkIINUcXESglp8J9LvYPWnDkCBVgWN5j1SC08SKy
 5j7QFfEymkdauZc40teOPFm9dN2Os0iYVEJtrzCxHOqNqLzCinQMYRrFRCh+I+7frl
 6htYhxtXgjBLdlUi6aP9vTL0kzN77MOt9nxFIGl5b/OJDXhwrCCzGEwNJe95KLrNVn
 FX0eE4c4Ic7Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IlRoRBOs
Subject: [Buildroot] [PATCH] DEVELOPERS: drop package/ucl entry
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package ucl has been dropped with commit
85c5af46ad6c18841576c0f7abe241a617a44cb7
so let's drop it from DEVELOPERS since when calling utils/get-developers
it throws:
WARNING: 'package/ucl/' doesn't match any file

Fixes: 85c5af46ad ("package/ucl: drop package")
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d19bae7a6..998bac935e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1091,7 +1091,6 @@ F:	package/libsodium/
 F:	package/php-amqp/
 F:	package/python-cherrypy/
 F:	package/sane-backends/
-F:	package/ucl/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
