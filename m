Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D753C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:29:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923C361056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 923C361056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FFB4024B;
	Sun, 14 Nov 2021 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cWK6WFmCYRP; Sun, 14 Nov 2021 16:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF524023E;
	Sun, 14 Nov 2021 16:29:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71BAA1BF30F
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E98E401BD
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dAOriFnbrmN for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 16:29:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCDCA40105
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636907367;
 bh=rCq8kEen+P2dxKdDIcIiHl9Z7LafjWmabwRGfBv0k6A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=geJeWG4Isa+r0dM6AFq2APgRqkbRruLOz3uS8hMxlPeQN5BR4Vb/i0jj2LPsWAhvq
 ZHbYExVbZDecS7Q6guxgp2YNs5vFV7EYEInHCuFAktrq6nKLB01nBkE0ryTIjlPl7E
 CNeQvStZ6s850pcB1Tqi85c3nm27/wH5vIFxk9D4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1mFQXX0Bgm-00bciG; Sun, 14
 Nov 2021 17:29:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 17:29:23 +0100
Message-Id: <20211114162923.21474-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114162923.21474-1-ps.report@gmx.net>
References: <20211114162923.21474-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dllDbhROu2pG0vXzFk/dsndXPyc/k2He7eHf8kY3vXjyigd8+ln
 GCbykJBCOrDbNLDpnp5dlryeIuh7EmAKoCuBYXx7rVfSYW+axbjqnMF0LIv/wbkzWfXErLf
 kae1lXk3pPcbDgcFlCJD3zEumZu1pzE1wt/PsBjCc2mL0bG888YnIWk0aFWhvduM4c+239W
 LYf4JvmtN9XxOzCtnFiwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NqTnbuLxEbU=:51+T+xy7wUTuptBoQQWOOO
 vmH+SIjmhu/jko08u67HZNmMvCNyvR8W3jyPZrWjpJnyw7SWczHm+P0YCns9EaQSLSfC9aUxx
 HPNL3HrpNAYUXsOSdMqfamb069uSkJpYtNC5o/n4EuKZGDM9hZcIeahHD4IpaAgDShTpaBPzW
 gKJcsZ34XVHzsRGxoY8TIaXEfLmLjTxejizVI6X1hBZ4P8LiYl8LmEeWWUFwBk21siTHi2hi5
 Url1ZmZ23XaSg0eX88pFQxIFwkyLubCKTdmVdQHKwZCYHFvkpD6odlIhr9EpbSSRcr53T6AFV
 FUM6Ym1rkr6789AhaDBo69kKcfMhCi2PhfYrYpkCW/Bxmyb8puJEAnhGZxFmqSf8rt7qRBAkG
 WRCV86in6Y13KbObX432K/2AWIGcVIlFBXqfaw6ZxUzqkCHAHJgVLEPwIjIMNPI7Kum7oPdiG
 +6yjfQ5aE2fUUQ8OGQj5K9aLMPMQutgUbpIFgsao4CYmu2+DuWGQBuvdfz89oZ5QHPbUefBJp
 6ZoMjh01nI6H/6HiBnrZiu3Z0Mh/LGlMsExnvv1nEkts6q5X4EOvHs+zWsGIeIBAJs2qlEgWU
 xAfFB4wO2YO1iibhwumQyUGRNs9oJh0O9kB+WQFclJslDXQKmbTvAdVfNUF4L8s+u+zN3iYnK
 om2/YIse+qtgtgW96+jaSog1IerKuyDej8U0bx1tlqfuXPjpA8jieOGBdXwpZgGeG3Nd8FMHN
 sj8QoHXtgOrADEjKSnUch7Ib/7KErkvrMcDWAARP4LqoFBEzGtL5GWgQ+29Ththx9MS04BE/M
 8SeU5CpbXY8YyjDkCM43b0gsLqjRH/eyn01J0a/3BKvRizZ3fKOhXRPH5o+j3mKKmZNvFed/0
 lnXvIN2Mh7QADXsqPml7uKYwL2B4O+hAMud0u8TmFk3b/rvI/fspjhFkz0uWJzvdwyAhmIObX
 rOHRE9ABV6MfZL0OKeuwGJ0xcnMGLdxQYEeHVMbxPLQMtfrJqv57bGUCa4E5zZ0siXraMJoYZ
 7tf37bEx6DYCUv7R4r1RPEsQjSBs0oD8wn1taqsn7eHVACnHeo3cU3R+BbEU5081L1vzvhcy5
 9aI1XzzMe3GHEo=
Subject: [Buildroot] [PATCH/next v1 2/2] package/qt5quickcontrols2: fix
 project URL
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- https://doc.qt.io/qt-5/qtquickcontrols2-index.html is re-directed to
  https://doc.qt.io/qt-5/qtquickcontrols-index.html so use it directly

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5quickcontrols2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index 3f81e20d52..02e36257cc 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
 	  This module was in tech preview in Qt 5.6, and promoted
 	  to a core module in Qt 5.7.0.
 
-	  https://doc.qt.io/qt-5/qtquickcontrols2-index.html
+	  https://doc.qt.io/qt-5/qtquickcontrols-index.html
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
