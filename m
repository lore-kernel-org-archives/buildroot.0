Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F0C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 18:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59F0D40133;
	Fri,  1 Apr 2022 18:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EF7gODdH13AT; Fri,  1 Apr 2022 18:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F49E403A7;
	Fri,  1 Apr 2022 18:05:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE9781BF20F
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DB4760B24
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIKNxxpJ2iQB for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 18:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6760060AB0
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648836321;
 bh=4tLsUmwDPqSEMOjMl5eyRpwkbRcYbsVDXOokffWQpC4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RQoQCcPUoUmLjHhqynWMW1dWiKH8WXOcv+td9djkUInAQc0aY4CuFXAH0l3kgomZP
 tAkLabIBAJ3WS9Q4cSLrakCBflU+w7ylQ7R8xF/suBK47/UjBEt0j6TJEPR3Tw57vZ
 nM5gy4uhczXnxjEim3hOr54jm1E4RbnaglkKTJGA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.24]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1neSO02IK1-004ftL; Fri, 01
 Apr 2022 20:05:21 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 20:05:18 +0200
Message-Id: <20220401180520.15772-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401180520.15772-1-ps.report@gmx.net>
References: <20220401180520.15772-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:f8SAFQYYNnDDi+iCh7MkHUDLMK7lZHIQchDXAobjRiGWn5oamSP
 Wl/psDmflmuxKz4fJU0zWQzpTVmVrmabKhOthGy8Sx4FX0tL6rHJH8iInepmGvEDfJCw7O+
 jPqTw63c2XoW5ppobioUHV/0EM3dcGxMK2MvEHEKuYfjCDjwH3GdBvS0DxZKp/PdOEURA5R
 /ymgVd/64hnyjKGyI8hHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f9mJ4jJteZM=:A8b3MGi8M3x3NBZm536Unj
 UImZ1u39I0y76LaGPoKRcgySsnrtnrDd5KwpiP0Ee4oq92be8FZV1JgPq2pfXo4uQJz3lEcec
 H/DtabQ3N+EzBopuWKEpWnp2MqhjcEiGVFGyvprxctV8Gxreo9mKFPEQaO6QyBsp7vNyN6qZS
 7Jh2V72ksM454w27PPDojzSkEJq+jMvkWZeYRzts3KCEc4Vq3oLu6jXnC75TrL8aMDeole4fX
 /N+Y1ruEiXHpE8Yu0LvOial4Tt/GgUtAZ0ItGCiYdmuIi4erRIWCgfTDMtwalFHjZkZ1eRV4Z
 /llduCNzBczrpKiUg28yAhMP/A9ALeyHZjPimprrN+2ZRMnIFFtELjndB7oQpJi8Xz1DzXyOK
 muzVKunWC0CG5+eGglUk0QX8FvIiEAryMeUDiOocb4EaiDJ+tMymOGwwi2C8Lwv8JOWpDCs9N
 W9IM0yPW4KFRb4axnwXXB3LklJ7uEzhtglvr9CrLIGAuGjk594qWrL7i+f1NTpYOg3xWbTfbm
 VhFYN7WNy88I38kpjm+n2nATvGcj7jDrKXk3OA3rU0U0RTwrLvJj8NW1bFbxYcEu0dnQzuT7/
 XJStdDyc3JLIysXxl+Sq5zlNGKPbwa1GJ0Q2pDAYKm327sCeLL6valD3fLUI+2CBCm5CkoRVk
 /lHKYAdKexBAoOul6Ut1oEv6dnXF9oyb5fmFZ2MD64RJ45K+Lm8nPUpEbQSamrOKGrSeL8Y4D
 bRoQVaqkMx0nEUSuWizEGONvmkoOUGwtVl/fUmCpO/YrgejTIDl8Bu8inYG5tvxT0I4iYWL+d
 Fyv3sH6Ykg+H/TTIzoaKUz+pcvla3L6cea0JFx0iSjYuDa4csO9vgWBvGYrZ1LLX11ycJWB4f
 bal39B4eXImdsQC1UZRoz4JFqMf9jzaLzoNbqcAAEeKC/lNUu9stVjaJM+Ac2qZSwL99YQShk
 cUM/31pWWr4FBI3iyUGhpVS13PU0gkwcHRfWC8jj3AMFcmnQvJr1vuTyweNhhJVdZL9twErey
 ZrJi1DXyQ6eK1Hax/xXrmNzyV4cAS2pwOoAScYeYsrroObW29GxRYSJzm6gbEFmMijOgIufw8
 UOh2PNypIBTTag=
Subject: [Buildroot] [PATCH v1 2/4] package/apr: change project url from
 http to https
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change project url from http to https (and remove trailing slash)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr/Config.in b/package/apr/Config.in
index 67de925474..4606fc5378 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_APR
 	  predictable and consistent interface to underlying
 	  platform-specific implementations
 
-	  http://apr.apache.org/
+	  https://apr.apache.org
 
 comment "apr needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
