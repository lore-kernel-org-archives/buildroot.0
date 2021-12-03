Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788ACC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 07:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26F740306;
	Fri,  3 Dec 2021 07:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUZPAuuxf7cE; Fri,  3 Dec 2021 07:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47ED0402F2;
	Fri,  3 Dec 2021 07:34:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDA51BF2F9
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 07:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B19D4022F
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 07:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfV7LyC_0KPX for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 07:34:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0354340229
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 07:34:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d9so3823208wrw.4
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 23:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nkrex5spbOWQ/8fN80I9mKv6v1RvLCeIniRzQMuGmew=;
 b=kFmUUiH2x5VlSHQwlUIdkf0gig9Upzkv4QRUYEeJ/FugWCrxBy7D1kIroQ+Sbf42BZ
 0j0Yyr1Vnj2qyQx3kWl54TTnftDfWgG59ogFTKTjxdNfv+E+kTlgZFiL4T0Yo537+hUh
 AxVY7uNmjPmNpC+VHeYo9adCr+GYdDmOFMpKStX1Wcsot7Og1O6Pf78tJi45OE9RiEhL
 PG2IvdVPJO7h6Wa17ixO9iUu2zLIXkp3Gj0Trs5xGIdRRrt2BgSX0NUFamzVF6C7AK2+
 xVXu2n4Ib1R3mckpi8oOms+AHKoHSIq/ibmBNUJ2ydTneqr+rcykUtWtPPceyo//G8QJ
 CM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nkrex5spbOWQ/8fN80I9mKv6v1RvLCeIniRzQMuGmew=;
 b=zVxojiMH0MFZFSJUvM34ZS/5fzQnm0xWAcJ3HMwx7QGtlzD8HmggYN7cep6vuLCzxK
 NIiqeVFoWqqvWxDjI9JuuayvOXnRcC4ow7fAvgoEfquonYWw2jaoXuCULGoeCn5bzStm
 CQUET9ZY/cwfkQoZG0Dxph4uClgXX/LgMfcfXdQz1jI4gh44TS3Iz7GVL+XUhUHCeeqz
 sub/YvWQWFG6xbdbF9/4FpVRT2HrZYH+2xg+2jmY9Hg6XwmqwM9Bad44Bhai7T0b6/xa
 nNokVTeRIXVo1n1nZcPDXI20W8h7rMhAw16FmUN13KfBtzTrXAW0EVMHgOXd2Co3AJjQ
 ofPA==
X-Gm-Message-State: AOAM530Y/L3AnTdK0i+xrgPO6HE5lrvAHJ5dW8m59YrH4TrwdBq7rALR
 RRsgZY2ufA10Bos+uJiwe+f7cILEQxSp8w==
X-Google-Smtp-Source: ABdhPJzKo4KcyWbcg8bpwdb6Hm3/39yCSJRkSsjdfR6wTlRFEgMYTEzZsbRzttnQ8gZtxwBf1ZX1MA==
X-Received: by 2002:a5d:54c5:: with SMTP id x5mr19741314wrv.442.1638516856858; 
 Thu, 02 Dec 2021 23:34:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g19sm4373456wmg.12.2021.12.02.23.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 23:34:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 08:34:20 +0100
Message-Id: <20211203073420.1890466-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstreamer1: fix girdir
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

As already done for libglib2 in commit
b094f88a4d501101bfba9b65491209e6a0fe0397, fix girdir to avoid the
following build failure with gst1-plugins-base and introspection:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst-libs/gst/tag/GstTag-1.0.gir --output gst-libs/gst/tag/GstTag-1.0.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir

Fixes:
 - http://autobuild.buildroot.org/results/d1e2bdde97777ff61c185d375ba412a93e7ca467

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 9bdd00caec..1aab035e05 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -49,4 +49,14 @@ endif
 
 GSTREAMER1_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+# By default, girdir uses datadir as its prefix of which pkg-config will not
+# append the sysroot directory. This results in a build failure with
+# gst1-plugins-base. Changing prefix to ${libdir}/../share prevents this error.
+define GSTREAMER1_FIX_GIRDIR
+	$(SED) "s%girdir=.*%girdir=\$${libdir}/../share/gir-1.0%g" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gstreamer-1.0.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gstreamer-base-1.0.pc
+endef
+GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_FIX_GIRDIR
+
 $(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
