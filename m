Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F30AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0138284AD9;
	Fri, 27 May 2022 10:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3w-tKpC2hgKX; Fri, 27 May 2022 10:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCCC8493A;
	Fri, 27 May 2022 10:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5A41BF841
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D0B28493A
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFQ5HYpbRb-A for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 10:33:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20E8884AD6
 for <buildroot@buildroot.org>; Fri, 27 May 2022 10:33:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id rq11so7942192ejc.4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4IXBKXDSSFEuVlJRXSZHqEevosZ3N4hk8LYyfESIp88=;
 b=m3U0ErCt5Z2sV7dmowVYXXlukOLJQilt+QKz47VnvvqjMywgfdMqgc4DpC9SJ7Q1DH
 acPAjZ0sigaW9P8+srbbNHmSSbYsRDXb/mRh7UQp2bD+dk8iud92wTwUmic597hrKpQJ
 s9r04mIJT6s02veJrDM9r2lUHiu7HDqidtSc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IXBKXDSSFEuVlJRXSZHqEevosZ3N4hk8LYyfESIp88=;
 b=5dM9eZDxaXPy5W5haEoUDtzE9DB6D1CpqEuDuT2+F8Frffo4zmPVsZdNaWGzIYbGgD
 jhNXahF3cPnRpYo2cSTYLfpxHeyGaLlJ9afjxLiSp10cHPYAP9uFyKDo8+4jRz95pUq2
 6exfxOPcWdLWV6zOEeGfPHmR/lFhBeCZN2ymxD1K9U+b4W2RbRAZtwN24JVnuFwx+aOI
 4cjGNm+5tjlG0gKuiQXWP1St/c1SlQ88bUQ+AEa/Eu5mBH1l0I7DIPLwZacNLrfZdXtY
 3+LD9ep5o1w/65KMfAFhWcRtwD/0AAqrf8F5CLTN/711BObymlLdG9+nDbD+7UUiR/ME
 0w1Q==
X-Gm-Message-State: AOAM533z+9aHEyZ+4Vcj9DV/PVJk6xSUgpgAB0zV2xcQdM6QBz5QvsE3
 d9JNSj3spiVjAa9tyIXWgbpjytkXgL1ulg==
X-Google-Smtp-Source: ABdhPJynBnwlLAolorLL8hqycwjt79avxSZp/BlQYGrfV/dZIYZnxqeU6bfCM/tJnKnUeUq9TSNGYw==
X-Received: by 2002:a17:906:478c:b0:6ff:2f5d:7e29 with SMTP id
 cw12-20020a170906478c00b006ff2f5d7e29mr4442419ejc.333.1653647631307; 
 Fri, 27 May 2022 03:33:51 -0700 (PDT)
Received: from localhost.localdomain (host185251138155.static.fidoka.tech.
 [185.251.138.155]) by smtp.gmail.com with ESMTPSA id
 e8-20020a1709061e8800b006f3ef214e34sm1313306ejj.154.2022.05.27.03.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:33:51 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 12:33:32 +0200
Message-Id: <20220527103335.1968203-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527103335.1968203-1-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default configuration file is wrong for the default compiling options.

Fixes:

Successfully initialized wpa_supplicant
Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
Line 1: Invalid configuration line
'ctrl_interface=/var/run/wpa_supplicant'.
Failed to read or parse configuration '/etc/wpa_supplicant.conf'.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/wpa_supplicant/wpa_supplicant.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
index 1994a6c739..f8a73d465f 100644
--- a/package/wpa_supplicant/wpa_supplicant.conf
+++ b/package/wpa_supplicant/wpa_supplicant.conf
@@ -1,4 +1,3 @@
-ctrl_interface=/var/run/wpa_supplicant
 ap_scan=1
 
 network={
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
