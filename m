Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EAD606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f3jSnvCH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GPJFJdgy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F8C381000;
	Tue, 27 Oct 2026 16:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZFh-RwIHULp; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6639580FFB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119227;
	b=hmIcMzvkgoLFBc5brtdwNZ8mWiDgqgCPCfs1IpNWy9rAx6zAsVRKjcTqt+W9fj3JUu9x
	 J39xYRZzhEL0Tk/jf3WRfXjZq/Xbkn0wvcwzE213je1TTkgDjPvh1f/5uR/OSZ4zinp/i
	 wyoaBkzWuN+yCbXa1gRfegnEEuVUnFAdIMUuayClqVqPqfe19YosP+3UPrwvUusRIqhdk
	 M4NF/9sjENSYnKxyKHn53un5tIZ+CvPNoCfw6SrpMJ1i30+OOyVgzlLf0oWhQjPVEiQiB
	 UJu109YbRyF4Atp4ielJS4kt17p/q+oq91PP8oNdLCxIFH0xxu3puwO3fFsAinsTosg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1hs3QUWS4m3wKs/NK7HbDZX9+ypOBaqzQAuVpM+rwaE=;
	b=K9N7yD108AV1uYKXzkmnMHjvEsSlnV1qgiC+vnW0qXHO1AYhPv3cU0bHJ4K9qoAX2sED
	 yNFO8wGE8Bi3jXYst/ijyk1wzRSTKsuRkhch00y6BReYqad7L0E58kB89WRtEtarufVGQ
	 YZ4gOXmHXkZQr9ha6xLG96rttUAnFwGrD1rOnFixEN1Il/kCdvQVGFFRSwu1Bk071Khwa
	 jcEXT0WXhLm8xhHbQmVFRspEfnwIf7YElLVhvA8593J7LB8/saFlyfqK2gASsosSTWOFJ
	 lWdKfXuxUGdydFHCxz0J/JB39tEzIg2T0ZtieA0vaTcQEP3QJrTybRJch7aqqIRtiyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119227;
	bh=1hs3QUWS4m3wKs/NK7HbDZX9+ypOBaqzQAuVpM+rwaE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f3jSnvCHiyo7Rc5FW77sItG4eZOVpCo3JMVRIaTDDPnQgnux/jEFU02wLY9v9aWEP
	 fJOhM9dY0CoP+TDOOd+ZqdYOlbblcoc8Ea2d15UYmf7+xmes24NCs1KIs62Q6fhjkV
	 EtT4U2FX/qBW6z8JONZTmfTT/27tsLdAU7AZA6Pq5zikvwguSQSmYJqXwUQaUa+KG3
	 MaSxKZXnrXMpc94O6UZXbRpI9A75/JghC7pB13vTFvWZRlMKjb2YnOiLFHJSzRj8kF
	 FJzS7JBo5C55bZsrHSG16pECiATLdfZpwUlSkZfd7bZ5QeVc3EzWpW+nzaGi6g9Xeb
	 6gw0Cdj9ORIZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6639580FFB;
	Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F239A4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8703406FD
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhNElyMgKQyF for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F0E9A40534
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119221;
 b=kp/HJoH5pSWBG6vv8YDEg6Fbp1GU4DtrCGur7ncR4M8Sef6JOr8vhGq/YKmyYaMEzDaA
 nLxJpbuqPhqx6JSJLjWaU1+y4qq5TLzhkNik0GjiteXnFsFOT6MAs/cgjAZ3J6WHAOs5Q
 G1zqQOY30DVrzfnHl4wnVHNd/cREcHvdcCWFLRnD2QfIjcO6dLVAN0csQnM/vDPc3q5vE
 q6qwKmln2TpaUVD+ymsZC7N7vIkHgW529cMDxHy2py33RHmKhMPxvpR+MoTDRfw1xnV2W
 zX+WWXddJ0ZobFRoy3LWp0jD71lzi6+SkvayyfRNi8QWP5KHme43lR7kvuprFzADTdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119221;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=hNVkVyWA5+mKU5deFKnedPbCw0XR3yD/ldqyQPkfGD0=;
 b=gciXXdvS7PLiZS/SKHyUEq1YjJ2FaYIV+C3pb6Splr4vGJUU1JbEznMiayynmYycER1h
 m2mgD+ZN6bNF+TEwnrb84hz7BXiZWgleFkNGpm9ITsWVyuY/v6Ty+4/tgfALhDKhdebnN
 WVn+HmSLYz89zPY+wySxRFB8GXNlcWr00CHNTj1ap7RrroXFwsAh8OGEysonvZlnfdcj3
 Cla5xlCyfscBMXWzFQDFz8XCkMEHS75H1e9el9kKAcarojQVlAdqQaEFABE8mpUW5Xmi+
 hIWZILgEc9AvnHtNfae3mtVE5o4LRA2yMe0FM3d8IZ12yyJeBO3WgEJ7uFvW1LFjQww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GPJFJdgy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GPJFJdgy
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0E9A40534
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c4015fb0b42so70266b.2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119219; x=1793724019;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hNVkVyWA5+mKU5deFKnedPbCw0XR3yD/ldqyQPkfGD0=;
 b=GPJFJdgysXCH6RjApPvHlQx8EaOXU/u8BXrWVmUnxzNHhIs8PB2qhDXHqhoumHQrQ5
 xyWNMuD8wLDiIelmQydYBnE+3QyG/FJJV23KQXBZG+YP7hq11x1Cc0Wdz7B0i6CsLXAr
 Jtd6+RtTZwtKZq9EZfN3dH2DNrz2zdRG3S5Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119219; x=1793724019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hNVkVyWA5+mKU5deFKnedPbCw0XR3yD/ldqyQPkfGD0=;
 b=d2W1bp4M/z+cEyBbQXy8yK5zSw1PMM/L6Dwe8cDQ605fo9gYzQukGyYqMu+E+91B29
 T78IiAIOpG9l4Yu52IE7+ZbOitH80zo/7RXa7qvGmE927O62LHQXtAS49Htm1wOefIqj
 Xlh7VX0zi+zhOrgf1FTTduH7qZf5zoC2F6pc5iMaw5/XAckxtSXZwaZqisVE4hPJRe8z
 6JSLh57TtvGf4dXmweAa/IDSMyhiaqsRa2XuiIVmC5GMR3dFDsr4JcjtMROsgM7Gk790
 lzspYt2ZwA1PqLTOvOdKE0NNQfIYdlDVNiKA7+2FDR/7nZDMo4OeQNStdDxUgv2zXSwX
 ZCRg==
X-Gm-Message-State: AFq9FYLV5dwH2y4aJEliAJ1NYZhz2uasLU69AJBKpzSMN+KN30onCoBs
 s+UIFc+aPcu0WVv2fwqYygwtsPAx/I+zGA3TlfRb1IWhviy/la8Uxb8LSBebw9NHNj7PmENECog
 8PGDWvGo=
X-Gm-Gg: AYBFou2xh2e+jP0SwyBTcGezzEAuj4SM/HUQ6t5hougYowtZ8m0t1DMhBT1numSaYRX
 XLfjALREm8pdZLJwGbZNrRfqRbeIInQNXetBlcfvzHB4vSnYnoKIAzeCg/7lQnYCe6FjVGOKutt
 bHkBCd3/j4SpTzzycxGPeZeH6mV0aV5K8GxgSRrhQAlcWdO+kkp0IYEaoIzwmJcLGjD9pD1QCjR
 90oUIlglwImOmCu3/EeZ4nkAhHOMRSs1MjiDIUi0VGxcGkkJ90cALCnhlHlTX2H/Ul2hY5jWjIk
 ug+FhiJK0FmdmwDZp1xUh/BQ0fKR0hSDqQHXzXwR0gR/cW2rTc/JfmOXorJ6QVsRwZ51fSlOyp8
 cmXE+R7mkeyD5ADIcfQ9MxiFp0sFzVLC2m+mFlHVKA2gSpTyBvxnXcV3r5G4ioGpkLQUV3r1mIj
 T+T2mQwelikE4KREpxthRLK8H4+FsV9U29PRBSRaSw3gT/TurSz8++LXDcyo6mhEtzhy0WezMlH
 CCaom0HjHEmLQnswuntVVrEercRkSl0we4bybVVVz1HmGFfHmHaNgMvW9w3WnwsCHb8b6V7fQ5z
 6DTc8umlEdS2g2QwneLe9CLd6kc7TdUqVgt0wOl6hTWYNXEDZk5dKCbtPfIOiWyX5NaArACsbzQ
 CfngXuHrShqu+lJQ+qEj1fxyJqrfGNxRRlzJRAMpdj10Pv7PHIGL1xMK1PvxM/tU=
X-Received: by 2002:a17:906:3688:b0:c2d:bbae:703b with SMTP id
 a640c23a62f3a-c46bdbf9296mr1069578366b.2.1793119218735; 
 Tue, 27 Oct 2026 09:40:18 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:02 +0100
Message-ID: <20261027164013.1602502-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 05/14] package/mender-update-modules: bump to
 version 3745bbea3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 package/mender-update-modules/mender-update-modules.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index f6de69c42c..08dd47cf98 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
+sha256  52b3b19bd3ad437caa7d1bce7f4766055a204909889f3436c8459da28dcef771  mender-update-modules-3745bbea3fc8ce73cf6489a58fb77dfb66660ebf.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index 0024acc189..d18b5111ae 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_UPDATE_MODULES_VERSION = d8c4683e6660af6c65069e10ee4b8ee50ec1af46
+MENDER_UPDATE_MODULES_VERSION = 3745bbea3fc8ce73cf6489a58fb77dfb66660ebf
 MENDER_UPDATE_MODULES_SITE = $(call github,mendersoftware,mender-update-modules,$(MENDER_UPDATE_MODULES_VERSION))
 MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
 MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
