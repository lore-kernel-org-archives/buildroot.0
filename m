Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95759C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 20:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A1C60ABD;
	Fri, 18 Mar 2022 20:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BF0Rzzx4TX06; Fri, 18 Mar 2022 20:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6643860758;
	Fri, 18 Mar 2022 20:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26C7B1BF2C6
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2204140278
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWmQjY4MkORL for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E751640235
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647634845;
 bh=OzkCsyqrN4xl+lj9KQJxwon4FryG28XtCxXyuyMAlYs=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=a2I/VCRL4zq4A2jlfeDv3n+gaqWHohHSwCTzy1nfDa/Gt5bCkC4OsCVXIOxQR9EGz
 roUgp9vaR5OSMiGszv1XFvwHuC1kmgZwjmTVjPEZEwiBC4FE5PnPXuq7mz0d4x2ANc
 m4mtmeEePXtnBfSMmJ1qjuTG6ooXdw7NsEs0rk94=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.106]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N2mFY-1oE9uj2k5E-013A1N for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 21:20:45 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 21:20:41 +0100
Message-Id: <20220318202044.10413-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318202044.10413-1-ps.report@gmx.net>
References: <20220318202044.10413-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YUIJo1uMMJBDaJa1XPlNyCTP99Hx0T6UEwWM+K1a9ADcHTCyJg9
 FSLlgBACBDl++7VNvKBphYWwIgP9m9dHyjChX6kd+JjUPD3vQw/WuQnCMHQSiO3WLY2Y25o
 cs+3QPNbTWXjwTp/vJNiFvBmeeouIRicFQsB8eBWwK2HCreCXxyfSy1jhrtwMPTGkC6tiDh
 9dMnuEr96LjlL4Z+K8uFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U8q7km0qWGg=:ul4XGGCjt1le6rWDNCnOW8
 7O18kmsd+4t1JiYVaM5kAPclipaFAxcohzZjaQhItVkiTelys4TfRyuHbXxaWIL+Oxyz5of/g
 6M7FxaRuwBkjHhxmmp9pSg6esStW/XCVok5xyr7VbNzvOdoRZWAOKazy3NjJgLyqdF29dTQm+
 O+K7ozWzgTO8MT3oF+EZ3fDUtfANFm03QkuOoutXfQ0Ex7S3ZKRT6ozOcph4WqlttC3j/DyD9
 eCKK+flkB5pqSPg2BMajFbSiLIqefMdH83cD1VcclwmCnnUhP86EWBZBdg4FvVl3rXlqBStOS
 aJX2y6Ev2iOh8qHeaboemvu5XCRMx+uD883v0uEhLrJzKHE0lA/ZuBFn5yPe/80IhV1CMmy1r
 n4fmErytxuGLRIcGadD697iEPstYkWeA7byRpwaqDqN91yqDo1CtcBvVewZ7w/c+tMLA9GvX0
 MMkHQHp9VSNzPtt+2uxBLcrRzfN15yHUU7TiyBe5emiTexTQ6AE2a9Tu66CZ9TC+YjJoq2S3n
 vRZD1k+baOPBLl0r75bd9gH9zza1fJaOs6SLapbB/QMqC3UDFpYD7L/dPSu1nGBdsuVmoO5/u
 /1ree6BhPjslqCXdWii3j40g2nG2YUMMu+JtBxwumHDwfBXvFrPxsV0l1+WfJp19cc6IbCkaH
 LRhC2QSeinfyr0UpF/QpXcR/F0rC7rP7Bcf/sMVwldV/4tqCE9GOFfwN8Ag0IxRxkiic2WUOr
 iDmRe96QwVAH/sGJRBSA89Ujwlg4jre74TIp9UwJllei+pZc/Bfve2xFnhaj0MzMF6JfELPIN
 jRUPpfm5qIID4/zktsTLZtJN6x9Kp5lPQjElJksoEJN5cgl5wAsU/fKblkoYrcdpMka8NrfPt
 MLcD+tkHhAaokXtY0hxm7jcYvLXhwqAqDkJe1rBYgqToPUrL1knGSuo+MLBrqd7T6tt2K/LHy
 YyEkVLGLwVh81BlzZGZF6RSe9E7ApA8tHSZoIq1gDZSX4/2wvXNol47YHTL+aCIt1UabJtJC5
 yiZX0Lt70NT2l0ywB/KGnqCR9jGp9RJilLZF9K+kIbXaPziYyEVxDxQBPaXqNqmyUtnTnLPwg
 VyJ1je4sWMUQLk=
Subject: [Buildroot] [PATCH v2 2/5] package/wget: use explicit
 --with/without-libuuid option
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

- use explicit --with/without-libuuid option

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split out from original patch
---
 package/wget/wget.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d100a59eae..7fda36f1f5 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -43,7 +43,10 @@ WGET_CONF_OPTS += --without-libidn
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+WGET_CONF_OPTS += --with-libuuid
 WGET_DEPENDENCIES += util-linux
+else
+WGET_CONF_OPTS += --without-libuuid
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
