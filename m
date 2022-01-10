Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9FAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17F940236;
	Mon, 10 Jan 2022 14:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYNMque_ZOhG; Mon, 10 Jan 2022 14:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525DA4022B;
	Mon, 10 Jan 2022 14:11:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE8971BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD1D340225
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjfW8zgt2Jrs for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC5D140219
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:11:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q8so26939850wra.12
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z3TV8RIzlZLRWtdLriAdoI0Zo/Oo9IW/GNnGHaIxlpM=;
 b=dPYmWAAnmvVOknNLatq5UiExErf4bAjAaPJl0kB3wGvZWnT995OVjrjRmEefXBwMyG
 8Ls+Q2Arc5fHKPRwTr7vDe/NHVWN/IVBdNfiW2qIlXu+pHSrH1vCTYOQjHF5Y14HBOVg
 3D6Ipbp9W0wlE+Cso0iS2DiNU0x0kANhMzYOIhzH510Erda/vHQH3oMXyjhqUY1CiVls
 Y0qrinkylVIygItHDQluMNyXeP2pgbglAlRKvMT0Q4+yoRNBZVx0tW0QBEUJRnIkd+PV
 7o2gCy517ersiLNDk5lCgSzjNswDAQWT5qunthGDONPmvzFoxLL0AHjkVpLBox4bfyFG
 QO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z3TV8RIzlZLRWtdLriAdoI0Zo/Oo9IW/GNnGHaIxlpM=;
 b=FzUmRlSYx6fG3yTxHdjak+WCwmzXUNUPMNbSKA+cJ/pZsvvJirM858caUN5FVd5R5d
 VstZ3LjCeGjjo8xlhC/G8BEAUSZ+nstMuJmoX+hQRJsGPJ++ROdAR2MfEijaqdOD64kc
 ygrs/Soh8RyYFoG7tzNwPGO2+NltMzPqyrd0w0eb5VxKYNwWq5vWpmKPIQcclY5ChYFp
 y5FbABctEVhZevmgf1b6bylHEX3GTBH1DF+nGidD5H93Lw9KrER/6zCCARU2xj740PBV
 obqsXBUofaBNQO8F/rj7KaV0ZuqAt2pmTl6SU3/wf8FE9jxEmvMO1ap3nYSiQ7AWQZdB
 coIQ==
X-Gm-Message-State: AOAM5305qaej/23U9b+01t//peYtjRCNR5yjjBbUR8A2zZ7WdYaZtcjG
 yOwK7S7FF99mQ2M9nTrRIOpB8ho5Ilk3HA==
X-Google-Smtp-Source: ABdhPJy30K8QBRqSaJBz8fhJVkkzNm+OGtdX87yEF9nXKqbN1vXJIkCqw+c9OCxvBsBN46jQOor/7A==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr63159828wry.289.1641823913864; 
 Mon, 10 Jan 2022 06:11:53 -0800 (PST)
Received: from camb691.localdomain (ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id q3sm6867947wrr.55.2022.01.10.06.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:11:53 -0800 (PST)
Date: Mon, 10 Jan 2022 14:11:40 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: buildroot@buildroot.org, romain.naour@smile.fr
Message-ID: <20220110141140.77224ac0@camb691.localdomain>
In-Reply-To: <20210623145231.19243-1-cyrilbur@gmail.com>
References: <20210623145231.19243-1-cyrilbur@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/python-greenlet: enable as host
 package
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

While currently there is no in-tree Buildroot package which depends on
host-python-greenlet, we (Adder Technology) have some proprietary
modules that use it as part of their builds.

I've tested python-greenlet as host package and confirmed that it builds
and works correctly. Someone else might require it, so I'm proposing its
inclusion.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
v2: Half completed commit message update - sorry
v3: Updated commit message and Config.in.host

 package/Config.in.host                     | 1 +
 package/python-greenlet/Config.in.host     | 7 +++++++
 package/python-greenlet/python-greenlet.mk | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 package/python-greenlet/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index b3e00bb482..6e027d96c2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -69,6 +69,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-greenlet/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/python-greenlet/Config.in.host b/package/python-greenlet/Config.in.host
new file mode 100644
index 0000000000..673fee8cc5
--- /dev/null
+++ b/package/python-greenlet/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_GREENLET
+	bool "host python-greenlet"
+	help
+	  Greenlets are lightweight coroutines for in-process concurrent
+	  programming.
+
+	  https://greenlet.readthedocs.io/
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 7b983ff0ef..3b1ef7e314 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
