Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F8DC77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 21:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DF883E59;
	Tue, 18 Apr 2023 21:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DF883E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zVfCCeOci5A; Tue, 18 Apr 2023 21:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A297E83EBC;
	Tue, 18 Apr 2023 21:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A297E83EBC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3A781C3F95
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 21:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAD8983EB9
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 21:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD8983EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRFuE2E2lH69 for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 21:32:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247F483E59
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 247F483E59
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 21:32:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.98]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1psIgw0w2G-00Vuw1; Tue, 18
 Apr 2023 23:32:42 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 23:32:41 +0200
Message-Id: <20230418213241.28635-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Jxf60K8e50fGnugSX0ntCLVq5DoYsi1/XwVRQaSRhAGFeoM+XHy
 zg8JAlcEzQnElzDPewofmyjDGth+V9g88qKz9Vvii9Jpr/hXmY006HeMVSVgeJwRlQhU2bM
 lyl3qdzVTAN4G9hRX8kL84pWMYf2fmJm7RXbM58Xe6T9/E/iHAIkSXAUtzU/SvUzZDLU0vu
 OPFhvmfIjtkQlLZtiuREA==
UI-OutboundReport: notjunk:1;M01:P0:3wKe/sK/DTA=;CDzE/LiegNCEjO+z+QqtjmxaCKT
 uOVX8ys4+H7P+ZUXErbo481XF82uG9n9WB8uVRrFQhlkS4dMFdo3YChk0i0/RVpsNe8BYu9Ur
 7YC6PAEUgriEwu8BW2tuMFmamhPykQW+UJq6VQkT4IBxOp1V5WsuptvA87c0+L2szDLRN0Ikz
 SgjQ5S/RK7T9XgjIuc5HioEOWF9u1zgNt1UpRXuOv+ex/4U7DNEqJ9qKQ8e1L+vvFhzu2LHz6
 rBRXK6pnKy6YNAE/4xZoFEgAJ3+IZ1Yv1WrtPZuJDxRZ1pxeI7ztltCGcmKoA7/DpF3Ef62FP
 EM2T3P2PBfIJP8wJ+aoUzls8diX/mRSOrLKjK3HGNdcZ+18JS5jlodD1K7xCxjbKPzG1ECgav
 FQ0ifQ59ZjTwMVn/tHrcDrIZAryu32gDhgY81rqoMmJ8XrC6udi/un3Qt15g6tsjwa0ulIxTd
 9RhIQdGXeAXueFTwtAyKBRqL/GgkFwd9zVvwQG3pVg0SnAjxoFK065IuK+xzqCYdKMBcXVww8
 jbxUW/7+4d6DCzA2oFVLIPB2SOXxFfMC8GE5FJnIn8k37KP+ShlVzHqjWY3gwkxDd1bJI0kAN
 Q8gzBhf6KnpwlNcrdBoQnFqrdxr0T8uckUnc8e34AZCbNA25WbA8nT8/Q1m0Ie0Cm3npqcsrU
 MIbxzK0dL8Li/DFhtsvpaneKiF6sPq5VGJMEzt5ZKSbJqUYRXjhT81/2IUyAb1HU8/T6LqPt/
 sM9I7uQsNZyQ/aLklxe0RjDc0Fpz+S1yDz/8nGZZYG1YGRlJru8S9Ua2WitbWrfQjkE/K41Fh
 A7sTY0SwP0k4vtBb3hu8P6UvMAv68Yg+V8ndQIZ00jGvNG8ehfhZf7eB/a7my8Bg7u/a1Dzy+
 Ty8y6asAztIWQI2MZtCpt6V0lYKiq/yBQ+NbvMWbOZR4GK3A1Ac9BrlaHrbRfEGhxUTdPnk7H
 BSCK8VNK9p8FVMbAgNB3jryZPuc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1681853562; i=ps.report@gmx.net;
 bh=e3ZihJMjG8AeYekwcCKPfx4B21ixFGzBjIKLSKI1cm4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NQqQNmTC0ZCttXBZKq04OniGuk5UUOlCn0lXVeA2bm1UJ9PQCCB5Wsj4fU+EoWPvX
 LD5VdrviAMCFq+a14EYk4uYjK+h+EaWvkrQtXNbAdkqcycLe/u25p5L2TN7E4qmAkG
 Nel9yshWxIiajXQe9w+UTvCVfxR1ARLeMWV5pgFzWOuHULGfOlh4suEhJwobOoQNTo
 rDuy8Y4yuG/6jEfNpn26lEeZCCK/XI8GCnRU/xi0GcBW6UTtzNnDRtzslaVUinfNjj
 L0d15dZlZRXQZJJ11vzXngi3+rkPF4M0REURAz9IR35MHZc4x7JG3PwttkhxyLgNKi
 wdm0yX5b+RzXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NQqQNmTC
Subject: [Buildroot] [RFC v1] package/python-babel: add purge locale data
 support
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
handling in Makefile) to reduce target space allocation by the
python-babel package, e.g. from 32MB to 24K for
target/usr/lib/python3.11/site-packages/babel/locale-data with
BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-babel/python-babel.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 890a8b02b9..ea383e9c05 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -12,5 +12,17 @@ PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
 HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
 
+# purge locale data (if enabled), keep special en_US_POSIX data by default
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+define PYTHON_BABEL_CLEANUP_LOCALE
+	for i in `ls $(TARGET_DIR)/usr/lib/python3.11/site-packages/babel/locale-data/*.dat`; \
+	do \
+		i_base=`basename "$$i" .dat`; \
+		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \
+	done
+endef
+endif
+PYTHON_BABEL_POST_INSTALL_TARGET_HOOKS += PYTHON_BABEL_CLEANUP_LOCALE
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
