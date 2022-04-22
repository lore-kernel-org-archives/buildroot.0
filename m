Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D53C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0709041A50;
	Fri, 22 Apr 2022 18:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPoOUFa9ZHfF; Fri, 22 Apr 2022 18:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC73A41A1E;
	Fri, 22 Apr 2022 18:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38A1B1BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3658A823CF
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZXjFlBwfsDD for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:14:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0E4481DCB
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:14:41 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c12so12559815plr.6
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+IDzeznOBU7hkY8WxgF+h3spDeRSGJsxmFEN1kP0c8c=;
 b=qGMQjENByd1N6a2V1IQXehezQvdaVRMJhYEz7gdnUh1JFyO7fVeJvx7NkWUqB25u8X
 lOPdDP42DMQ7mR3ib7hjQQQRb59PqZfDtlSkS3v15vTD7NLY7Kh5Hg/sqleP/k+5+hQ5
 AwB03MgPzzzwHhTCjU9HMFhyWR94X87eu3A6srHkYaWYXOLfltGX6tFGHpoKlajA8X39
 +QUfjCjvhEKk+V3x/HrBKQyFVytHQ1NohI1PKpwchFtAl1BTs+MgSZhsobWuI2nRXLfG
 PvlGua0WtWNeYSys/dUR2AjVRi3jEHl0vFqLD2EpgA1lDW+yPigLhCnhEY7lwQ40sQX7
 KgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+IDzeznOBU7hkY8WxgF+h3spDeRSGJsxmFEN1kP0c8c=;
 b=1PClX1D6qE0Akihm9/QpoQAiJYPbOQdwN/OQSD/l/2eQAchcg7LkAmAegNWv4f4PgO
 JjJ0OqZbP2Rh4dfhT16v+ZsKrYJJ/+YCgoNcFjdbLmJeTA8c+OEtHkWTpapFZrcQsj32
 wBc6mELKvH4XRvMvXaUW4XbaZDoUZEVpgFwIFOL3J8nyq85KJ/2I0qj7aXMhc/1XDS9d
 +Ln/ABDVb5Ayl50gBIqCqcHg5x8QpI24Y/awNZRjDxDsno1l7/V8d7vv/F8jS/XyJr2a
 mF1nJ3MnDf4qypRzSnZUzioFRCN6tN8THGtKyMaF7xpMkJo6YY/KL/ao9vobv2zbxPks
 MA9Q==
X-Gm-Message-State: AOAM531lXHayk635vvF9EbCzjQ5eQuoeLCywXe5efBLwS+sa7HHhzW/L
 jSrNCodrOOCbEJrSbHyupH2McYwZjNiBow==
X-Google-Smtp-Source: ABdhPJwSWkA11d+y5ZQm+Fnx8B0v87tzBdyRbxNzca5Hz4HuVPFJ8qTTsElj9Pm6c6wYm1G/uN0B1g==
X-Received: by 2002:a17:902:e88a:b0:15a:3463:4dce with SMTP id
 w10-20020a170902e88a00b0015a34634dcemr5785366plg.120.1650651280456; 
 Fri, 22 Apr 2022 11:14:40 -0700 (PDT)
Received: from localhost.localdomain (172-223-248-144.res.spectrum.com.
 [172.223.248.144]) by smtp.gmail.com with ESMTPSA id
 124-20020a621982000000b0050a73577a37sm3301175pfz.45.2022.04.22.11.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:14:39 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 11:14:18 -0700
Message-Id: <20220422181418.2411463-2-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220422181418.2411463-1-joseph.kogut@gmail.com>
References: <20220422181418.2411463-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libcurl: add host-nghttp2 to host
 deps
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes building host-libcurl, which otherwise would fail with
undefined references to nghttp2 symbols.

/usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_pack_settings_payload'
/usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_http2_strerror'
/usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_request'
/usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_rst_stream'
<snip>
collect2: error: ld returned 1 exit status

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 97857954db..d5805a1d32 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -173,7 +173,7 @@ endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
-HOST_LIBCURL_DEPENDENCIES = host-openssl
+HOST_LIBCURL_DEPENDENCIES = host-openssl host-nghttp2
 HOST_LIBCURL_CONF_OPTS = \
 	--disable-manual \
 	--disable-ntlm-wb \
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
