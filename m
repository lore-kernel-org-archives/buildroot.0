Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6783C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 08:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1FF8204F;
	Mon,  8 May 2023 08:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1FF8204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93205CXiaI4e; Mon,  8 May 2023 08:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA368203F;
	Mon,  8 May 2023 08:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA368203F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 145C71BF25B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 08:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E88C74011F
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 08:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E88C74011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5UUHLUfjkBK for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 08:25:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F40400FE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1F40400FE
 for <buildroot@buildroot.org>; Mon,  8 May 2023 08:25:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MORAU-1pZS3k0tIc-00Pvz5; Mon, 08 May 2023 10:25:50 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 10:25:42 +0200
Message-Id: <20230508082543.57211-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:2K81AIzngJX5ldCBxC0G48DS3YFlhMMFAbcz9QSY+mIXpSohPpT
 KofPaMxq7r/ZKx6kGbKaiUku1JeirKKPdqJMYUG4J/HZAHF/klNapLMAqpPYwwFlN7gvp1f
 9htAVl2xCKi+0yTZF7DTpuy7+CbnkS7ii7D+4h5OsgOlrGdpS4wp2MY0lpQjo+mCWCRseT8
 P12AQm7iSPWf7IhhDcG1Q==
UI-OutboundReport: notjunk:1;M01:P0:1kHq9wtW3Vw=;bWc8F/V9a2P1L4uqu3qeH12s1Gi
 YdZsPTrrxUC+Ulamlrh6UBFCFIw+203IZ+TqbxurvcqQhHrGpB/Utu5p0ChzMXznRp+90/T30
 DXYgZxdjadPkI0R3/54IA7V/RjgXXazHOmIQAmrRhRRIqBMeAe8MLl/qijbVxbrVJTGzyQnFZ
 MU8NNoCtIedtNLt8oWtmgTtkmsmVxHTr1YJiFdhx6iRU6k26Gam7xq/mgBd607dWSwkDoziJo
 PIu2Vuc5kNllXOfIBSE2NAZp74wUxkOuyjs8hRvOGb4tMfutW6ryg86HlUjQTSe4qgjBDQW4y
 WJWBo2FtJeHsNILG4oL3bKzdHunqDgQsjM7/FW+4MQszd+HFJr8knoodNuNLh2esj+yLR72Zq
 rzKMFfUq6nUfn/F8CIOug1nTJRDE6/bI/x4Vp8xs3aL8QmKVz3wO4CZOBIppDjm2+X9q08NaF
 OnFlZeBdLjni7eppCLDdy0PGrGHI9cnNnL/l8v2IlGBqN69XLZv/YtMfwxxhPyXixelHL7C7x
 ivvSKp9/lmx+3NuYDHYPvLxAOi99rAhwaJfYzGhCXFI7ChhYayehoqmIcNQqzVxw42VHZUFjH
 jn2SHquCvo3LP9mg274E+tnHUlRXJ7UArPAjZlLPiNbK4uE+bIp3OQnXbKQtYJP9GFnuSdoT1
 +I64sJ2JYjjvutxxLDho2ykb+8AsH40WM2yFxpivhTH6lGF9rOORQK4ed425m/i/Qw+uUM6hS
 yHTEAMRkEBWi3Ep8Eo02ApoiiftDup/6Wen+h0YnWjDpIYMzhBQk95uXmkdMW0qrL3/rVulqw
 awukT3s7NeP6z+h8oyhBVLuAxv9VfdmH9pfXxj80QMTEWJw2NZ800KX0geZYCveTwxY2+/fnU
 rzJ12UcFd7TfF3UcwtHcartxjaJtJUXA+7E1sRhJnqyl1rO/9J6wgIRhsuAb6UequEy/C/VD1
 WUtqRRng0d9dHUZPKEyQEBMe9O0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683534350; i=dalang@gmx.at;
 bh=x4EDEf3OLZG7ao9tbuGIaz4cyKbF0b5ppwkkSECmoPA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=d7N2ghCcQLbKJ5/xj5H6+TLuUjCEwfm/i1ykgRxgFYkDHRwtoD5+fYV+PLtoWkd2j
 /zASIhIodPB8UNT91zwlvUrrCEhietUt3r9dyGy4wlZ1t/W0Ar9+uoyj106dFi89Lx
 inKf00lCc0p3CatbPH42iS/T1uYk+dkuZy3KliQqLVYVbx4VOehGvN/UEN9tLIu9q6
 zL0+rIRfX3gneajVl0nZpvPmLx1vMQo4JVFZCN05eWCbasj5fNGC1BovKhelJRKc/j
 FI/zfJqX1GUFTIA4XvcfzxCjv0WezWo8pshACOGlTKUlfOJ8Pxnediv0EdFG3zB9nf
 /d29UcMVAC1TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=d7N2ghCc
Subject: [Buildroot] [PATCH] package/glibmm2_66: bump to version 2.66.6
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
Cc: Daniel Lang <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/glibmm/-/raw/2.66.6/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/glibmm2_66/glibmm2_66.hash | 4 ++--
 package/glibmm2_66/glibmm2_66.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
index b7d19b261c..19272d2b90 100644
--- a/package/glibmm2_66/glibmm2_66.hash
+++ b/package/glibmm2_66/glibmm2_66.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.5.sha256sum
-sha256  7b384662dd6ec3b86c0570331d32af05db2bd99a791602b767b4a0b2566ec149  glibmm-2.66.5.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.6.sha256sum
+sha256  5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f  glibmm-2.66.6.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
index b58c7ca8df..7f28342c52 100644
--- a/package/glibmm2_66/glibmm2_66.mk
+++ b/package/glibmm2_66/glibmm2_66.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM2_66_VERSION_MAJOR = 2.66
-GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).5
+GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).6
 GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
