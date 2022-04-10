Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF93BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 17:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C7241528;
	Sun, 10 Apr 2022 17:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id web3HuIbu91E; Sun, 10 Apr 2022 17:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118BF41508;
	Sun, 10 Apr 2022 17:34:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DCF41BF844
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AB9E60F80
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTSztC-Y4802 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 17:34:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A45760E57
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 17:34:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id h16so8593831wmd.0
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mqEZG3MPF22ZvZITiVCdu5BzBZWG0ro2CCU63cMqvg=;
 b=eE37cD3psV4kmBoVMZfFOaM7TOFv4H7WuPZuVAPOZZmigo7CH7utvE40J+Tm9HyF+A
 zKshTfwL0nADiBHDdS/9bd03JYpxIIzCVEKjrNCPBYKakyl2BZerHWUr2+EE7TOmKYML
 xw7A1MXy33yIezwmUh8OjrQdrrlS79eYM0ay6qE0xjbsjA7mXa3Kl4En7y5kwRp8XXMw
 1qEgCyzLwtgMU6Pn6nLA/ZOt3AGmO7yfdgdIL39wQFjlDZs5YLhRZjpp0J/Z974k87jN
 Os+SMOREhgZpHNEsH+WA4WW1jmQ10uqxCRcBVkG+VKsURSD4HTQDlC7o1FLZRn9R/eVW
 5I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mqEZG3MPF22ZvZITiVCdu5BzBZWG0ro2CCU63cMqvg=;
 b=dM0p6vrFVRXGXlWZv2RVXbptRyd+A1mpyX/6oMNilDIa86Ou7Fl04Izmv8m7UjLFfL
 xWhuV28HcTHJjaOEqrK7HJ5Hqc6zf/q8r5ScJrCteRN6KI3k4XH6HO+rKDncF2ip2F5G
 VMsITWplcrKZETT01lMPx1kgHPYQqw8IZPRYRcs/xt2G0ozTvI3LnbQT+E9JUYTpb1Ut
 C91mZoPyEQN7rK6nMkSPh8uVEA85ye7fGGWoFZAs739c7c7bAnXkEVK9lTlU6Ors9g0e
 7MK2fRv9eoMifUfE+Pk0zYpeDYqSGQ3IfyJIy/iq5h79/cNUKqei6hn0kOrf788ORHcM
 nDeQ==
X-Gm-Message-State: AOAM533VtgAHc9hcT6hqope2OAxGrWkcHlQzH/enp6aEguL9V6g5HBP1
 bNnSYLmbzG8doNU3eCFCCMTxqQedUsw=
X-Google-Smtp-Source: ABdhPJwNAV0jepnOIBnVuBNN0Y22IsEySaYchgcX5wnhbPCMyhbFPVz/IW1UanJrt4XxQQLf9nyFKA==
X-Received: by 2002:a05:600c:651:b0:381:3d7b:40e0 with SMTP id
 p17-20020a05600c065100b003813d7b40e0mr26016176wmm.17.1649612088165; 
 Sun, 10 Apr 2022 10:34:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056000188100b002041a652dfdsm24497323wri.25.2022.04.10.10.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 10:34:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 19:32:59 +0200
Message-Id: <20220410173259.604817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/haproxy: security bump to version
 2.4.15
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-0711: A flaw was found in the way HAProxy processed HTTP
responses containing the "Set-Cookie2" header. This flaw could allow an
attacker to send crafted HTTP response packets which lead to an infinite
loop, eventually resulting in a denial of service condition. The highest
threat from this vulnerability is availability.

https://www.mail-archive.com/haproxy@formilux.org/msg41963.html
https://www.mail-archive.com/haproxy@formilux.org/msg41873.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index e3120b521f..18834c29b1 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.13.tar.gz.sha256
-sha256  4788fe975fe7e521746f826c25e80bc95cd15983e2bafa33e43bff23a3fe5ba1  haproxy-2.4.13.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.15.tar.gz.sha256
+sha256  3958b17b7ee80eb79712aaf24f0d83e753683104b36e282a8b3dcd2418e30082  haproxy-2.4.15.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index c162a4c3f4..d50821d8c9 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
