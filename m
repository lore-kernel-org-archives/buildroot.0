Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED9DE95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 20:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B26418C1;
	Sat,  7 Oct 2023 20:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B26418C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGX4N-Va4xkr; Sat,  7 Oct 2023 20:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F301418B2;
	Sat,  7 Oct 2023 20:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F301418B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 993691BF3BD
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 715CF60F83
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 715CF60F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUJGbfrov21Z for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 20:36:38 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CF7D60E15
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 20:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF7D60E15
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so9449406a12.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 13:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696710996; x=1697315796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6NIuow5LXDwk+vb64f/jq5Ri9w2Q0N4+IHOvZp1r+aA=;
 b=rpCatgwwZ5JKt9RrB+GsZiS7nBxc63vtRqaI4x7OZWmL7kMTC7nYLc1/ELgiS0ckt3
 dcIt2kEsfOMl9cdeIM8UgwnDYZTlRpDsJZyMg6aYTDwnzoDp5LehZzU/eoMk18fU9jU6
 sNGNjWXGcKeL4QQP9SF6oUIEvHqbP2yrEIXQlUM1WBsUfY9XtGzI1MZGWul3qPI7jKz2
 40+hNl5RJwKsZKmwtNRufHYplX8rc31/DEinihev8pZ1yZ11ZOgLM30jVcw2DrWxirtk
 XvbI9+BUCc5BlIQ6x0Lh4LSXPYBCwkoX8PeBfxpashk2DlUt7TLDJ9/pMz1QiIwsqvgy
 8MxA==
X-Gm-Message-State: AOJu0YzIWlK++MvcmmT7gV0eTNw6X/VhUSD3gDtMhuAdC3PrUunVtFYn
 45X5tU+GcdC4C8FqzPKwQ9wlYFCchwfNPrQ3LAA=
X-Google-Smtp-Source: AGHT+IEOCjnDDSYTkoD4D4R/xwqXsJW4d1ndVUuGJsAcY23yG7xWRXVk72jwmaKB2xIJTmrz+Z+brA==
X-Received: by 2002:aa7:c318:0:b0:533:dcb1:5ab4 with SMTP id
 l24-20020aa7c318000000b00533dcb15ab4mr8167922edq.18.1696710996420; 
 Sat, 07 Oct 2023 13:36:36 -0700 (PDT)
Received: from arnoutx1.telenet.be
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa7d514000000b00537708be5c6sm4271519edq.73.2023.10.07.13.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 13:36:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 22:36:33 +0200
Message-ID: <20231007203633.2415431-2-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231007203633.2415431-1-arnout@mind.be>
References: <20231007203633.2415431-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696710996; x=1697315796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NIuow5LXDwk+vb64f/jq5Ri9w2Q0N4+IHOvZp1r+aA=;
 b=HcOPku8q3boE4gELfurOvkOACtVeq31SV5wT42jrJofn7sDpoAH31g7Rbu+FprczhA
 Uc0V74WP/meOXAsXxECWIPS843Dwx3kv/DbUlS82ZmpuK7FIUqcNMUuCZvPKhlTBO8ZG
 7BUHabbm0dQCRK45e2t+heOiPbO3SFWQHbu7exZQhA6RiaITvn4ih/slktfXnOMAyjVV
 5J/gfWVHGMCpMnlEwx3YputILXejD0PmtqlbV1yWWGp35vPYgHutuYhTs1i84OpiCWoO
 cYVeVS8oo4QfWiv1h1hxc05z/JDMk9JAMBqsIa0fyWugKJQ+KeP6S35keH3ParJbJTHJ
 jdvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HcOPku8q
Subject: [Buildroot] [PATCH 2/2] package/initscripts: add service to load
 kernel modules at boot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Angelo Compagnucci <angelo@amarulasolutions.com>

In cases where no hotplug is available (by choice or by the lack of a
proper hotplug method for a device), this service can be used to load
kernel module drivers by reading the /etc/modules-load.d/*.conf files.
The modules files matches the one used by systemd, which in turn has
a builtin mechanism to load a module at boot, therefore making systemv
init on par with systemd features.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Arnout:
 - add exception for missing DAEMON variable;
 - fix shellcheck warnings
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/initscripts/init.d/S11modules | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/initscripts/init.d/S11modules

diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
new file mode 100644
index 0000000000..ab9b93dae3
--- /dev/null
+++ b/package/initscripts/init.d/S11modules
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+MODULES_DIR="/etc/modules-load.d/"
+
+[ -z "$(ls -A ${MODULES_DIR} 2> /dev/null)" ] && exit 0
+
+load_unload() {
+	for module_file in "${MODULES_DIR}"/*.conf; do
+		while read -r module args; do
+
+			case "$module" in
+				""|"#"*) continue ;;
+			esac
+
+			if [ "$1" = "load" ]; then
+				# shellcheck disable=SC2086  # We need word splitting for args
+				modprobe -q "${module}" ${args} >/dev/null && \
+					printf '%s ' "$module" || RET='FAIL'
+			else
+				rmmod "${module}" >/dev/null
+			fi
+
+		done < "${module_file}"
+	done
+
+	RET='OK'
+}
+
+start() {
+	printf 'Starting modules: '
+
+	load_unload load
+
+	echo $RET
+}
+
+stop() {
+	printf 'Stopping modules: '
+
+	load_unload unload
+
+	echo $RET
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
+
+# check-package Ignore missing DAEMON Variables
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
