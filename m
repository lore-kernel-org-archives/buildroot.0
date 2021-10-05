Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18986C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:09:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7689460F43
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7689460F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2353A606E2;
	Tue,  5 Oct 2021 19:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QHeUsL7KFsx; Tue,  5 Oct 2021 19:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832F760C03;
	Tue,  5 Oct 2021 19:09:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC981BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7996E83BA8
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAXmQY9fA8qp for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A03083BA0
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633460970;
 bh=l4TIItDHdYeit290fN+WkdD3Pa0Q8cVvPx9SaK+mKAQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EQfq/aGI0mcoW/ek4ys4ZTUNSmwlN6x0zKD7BU0L9zoJh7utS0hAdNDUFWcvouAfV
 1KZC8FADqmrUemhSsOBRQxs/mlm7/J39GEmwXS5ahTLkO7WW7eRIJvnBXzyW+9uGDq
 /GW5+JXnlqQghtXQcSJlMP3B2XQ7I5PiWe7p3v+Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MZTqg-1mK8gJ43ZG-00WRnt; Tue, 05 Oct 2021 21:09:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 21:09:28 +0200
Message-Id: <20211005190928.17057-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005190928.17057-1-ps.report@gmx.net>
References: <20211005190928.17057-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zfK0qBlB3jaU1J8ILMJFEQy5JlVDWgcPs5XTE+qeuf5MiqCe9De
 rs2FR8FWho2OL7Zwu4ArXOz4jwL4iQMUqfyEzGXoniD//4bcnFPOYi0DllM4r+zU+Fw51cA
 hs5w9Wk2dXqDVdxC8q843jLXawgx55Hchj0FWMIk4ijMZkuP+5HOLS723u7T1Q57fvffxx8
 pcFvjl7KuxOmdRpTXWmqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O5TyhTN7NPU=:IiGXT1dhUkSmSNtUEBrrNK
 iATH9ukpcOA+0ESzYapqwWJ8CKxXZMcZ7fSEJ080fZYkCpns6nK4vDDhhiO8ouSkM6K3njpmO
 zPqb9fAi/qY93xJVlal2EBZvO7d5l+nYgQCQWWTN3gsP8cHTyyc8H0Lnv5MI8Z1cV4qqUGCf2
 9sjjFVTQJkBM/A91pZqzJ2xFBmx2hBj/vj5DzoIlZnCYpA5kGZXqwG/U1ucY7zKQwbc37jAHh
 w8ojGt4FBlYC+90iJ1gkUsEKZ5jrelZdfGjOOD+ZL1ow5Kq9/DbhsTf2z0LrIGbOPtle3ZRsK
 BeiaHRWigdYMXlsR0T0XUABbJDorTobaxZEEjyN+UCUH+MeMMhmSibyeFMCFyktbFGvP0gF+c
 YneXBn1cm+x4fIvMJKb3bH1RHGuHfJyuFZIdvGOIryT4H4Vvu6ED5/mANkyR8pb/f9o5ChGHA
 pDfneI95Fhz/nWBOxiK+okjvshy83dGfIBA2Yp9Lj1wFz3XHn2Ae/bzXU1e1z4tjGwmQpCqWJ
 5yDgHpYGPG9lwO4aihZisDizW1eB4a6ryW4UK3wQdwX5vc5+bxOXKoFxcDsQCSirxA8s9uYPe
 35bvOhrlGyxDgpGCy6xplz/tZ2ThVpEcr7Z6sXCQz0Ac3fnbTcaItUw/BC8CRC/7NFaVdXoO7
 RFi/ONBtwAc96bNR4ICXFF1zL3MYTYRugIrRLAyhnnnmp1DKyLYi8luBkDj8e0vjgGLX6RYVt
 NnrUTnhEjjNwvX8sVTjLmmAgfeDP4DRUdGqb2zW2sR+BxVYek8rrHKPBAAgltOBBZvTEjDhge
 8uv5kkzEL05l1Z33Ppw1Io5Y2hqxMxXHFTcHsPto0fzlS/+87YMLL53HVMpzIIsv1dygVHq4l
 iWRfzfHENeo9iA4s5jB6t1W0aycn+xQhCAZ+Fc51fqpv81+7MFx8jKbhhDsL+3poeZJ0LKENX
 ekMBfmPyjsX0+dT4vSyhUR22MYJZrbVDlAJBK2IvUEf75aNa5qwts3KU3lFQ88xYuclhlBXrA
 ejMNiD0D+eRfoVGZoidMj/KssSrn+Kl3sRnuLpwZ1yuG0QnbX899l/AdNbDQdkaijyC9qzLST
 LS9FN8HS+n/Bno=
Subject: [Buildroot] [PATCH v1 2/2] package/apache: change project URL to
 https
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apache/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 693ee20a1b..8b6a5bf7ea 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_APACHE
 	  server that provides HTTP services in sync with the current
 	  HTTP standards.
 
-	  http://httpd.apache.org
+	  https://httpd.apache.org
 
 if BR2_PACKAGE_APACHE
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
