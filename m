Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9147AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 12:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED55260727;
	Tue, 23 Nov 2021 12:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rz_SYLT5bjKm; Tue, 23 Nov 2021 12:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684F5606F1;
	Tue, 23 Nov 2021 12:15:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1601BF2B7
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 12:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B655606F1
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 12:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCkVbYDpMA8E for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 12:15:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3ECB606EE
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 12:15:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id i12so18549112wmq.4
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=nwaNweciR37PQzI4sjg6ZGepZ6tVlxWuHAtTJv+S4q4=;
 b=FcWmowVt1pziwDDYBca40OHayJmEkgRtDTjsWKomTBkug3Gx/r/ypWZR9ZCGB8B5mo
 0tDaPLcEZDkN8mOMBfHxU0Hev16lo+QAPu8LIGRQRHDCCJeMK133Fh+xGfUzWgZQWlg+
 blV1bQXn5sash5wI5pUfJR9X+z334GGk7JTxFZdwCE+SgkNPRvn8+X1e/C7JmiRiwRqw
 Zx+MU3O8eSACul5mSyGn0dtdZ5H6PMewDaIOJ58ixwXghSe251o0kYsfd3iRP5EnpIkB
 FBxCdSxv3vaHXzpw2dtpoSaP+WyaIufYrG6zy+Z2yRi7O0Hj0X0XdbxF4Dd7Y0JnjP91
 c+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=nwaNweciR37PQzI4sjg6ZGepZ6tVlxWuHAtTJv+S4q4=;
 b=VG+K4JfK/oN0UrFRQACLHf7UnrkZ7hArWzK131HwAz+9RXXXpv0K0EhGoJqWT1U4XE
 mctf7eXjI7So0ATrQgRktoXwj/2yUZOPR19wrh05bTkCMn0yFnRuUpArWgj+5sZ8aaWr
 kMoDK12dr1ntHeknM1V98tRL5FVNSihWC1tLvUj6731RynBP9OouflTPHGOt0/2Kle5U
 BXn+Z0BHQ9h05qh5Yg/nTTIxTko6wPUEgXMU6V+q6WiQ1sqeg4TuuBIunyxxD0jrggxK
 l3llGJlgolhltV1DJkh5YH8tjCNTQrnBDM/HoBTrodOV+vE4FPZlGsZdhiVWZ1nLM3K+
 TS4Q==
X-Gm-Message-State: AOAM533hJipNBRVhdvKl/nzvdMcyo0dNAFMFaDw5h3rlC9eOePyr3lxy
 oyiMGvPXPNp8nJfsRQMa5NB1wYXq5qmJvQ==
X-Google-Smtp-Source: ABdhPJyeDUyhetIBBB8dTCdAT4qLndENrhzc6cX6bzXd+hOgMTb6U30+uvzhAa4oOL7yUXyshJGjoA==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr2382069wmm.189.1637669748908; 
 Tue, 23 Nov 2021 04:15:48 -0800 (PST)
Received: from camb691.localdomain (ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id g18sm1395916wmq.4.2021.11.23.04.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 04:15:48 -0800 (PST)
Date: Tue, 23 Nov 2021 12:15:30 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20211123121530.3714511f@camb691.localdomain>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH] pkg-stats: Ignore make output without '='
 character
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
Cc: luca@lucaceresoli.net, thomas.de_schampheleire@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is possible that some users of buildroot have put it in a repository
and call into it from another Makefile such as:
.DEFAULT:
	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)

This technique works well except that Make tells us that it changes into
the buildroot directory:
make[1]: Entering directory 'buildroot'

Because this line doesn't have an equals within it, python raises a
ValueError exception within pkg-stats.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
I have no idea if this technique fits in the buildroot philosophy
or if buildroot even wants to accommodate this but it sure would be
nice for me.

 support/scripts/pkg-stats | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3992c8312a..814e6f8855 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -388,7 +388,10 @@ def package_init_make_info():
 
     for item in variable_list:
         # Get variable name and value
-        pkgvar, value = item.split("=", maxsplit=1)
+        try:
+            pkgvar, value = item.split("=", maxsplit=1)
+        except ValueError e:
+            continue
 
         # Strip the suffix according to the variable
         if pkgvar.endswith("_LICENSE"):
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
