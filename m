Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAAEE8B370
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75CCD8059D;
	Tue,  3 Feb 2026 22:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOoUg5l9aNte; Tue,  3 Feb 2026 22:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA2C8174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158666;
	bh=pI7qae0logOb7qXIZMioo9VpHvYaW/u+kN/d3I7MGDc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hl95bx2ZYBIW7XBtq+llBNbZdTYGf3l5SWfG6HD0Zywpn9aYyQhyN076C/AqVB27i
	 BbdXMDA56HvfW/eX2irPryLLSyYS3Wo3urf4UFU5PsXXi6sSWWSbAo4bI+D0GBcn/G
	 KONy0NlTOZUT0Zv0l3zQ1cMohlQqd+jdnrPcISPsHLWTJrRnxyldpgE3FU6UzqqW55
	 i/+xmOBHeyO+JmE/7g/vzFKEw37z8kOSfY9vl0r+j0f16mnTQ554ZcdomR4dGk/Ggm
	 XiVmkvJx8TsULEjR1/VSfAbXYHid5AHauHp54PsAotfXw9R6Be5/xM0nTqkTV1E9kE
	 Stu4jNYot+Niw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA2C8174C;
	Tue,  3 Feb 2026 22:44:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5EC13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0F81608AE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yR3bP3Itj5BW for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C9A5607F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C9A5607F7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C9A5607F7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:44:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so47125305e9.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 14:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770158661; x=1770763461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZ0qnyYSZvy0Gpdy0F4csIq/LwDXgJ8yAOhnIZY5A2M=;
 b=guTZkuv7cShMnsjx3JiFhFGgKbR7q/IAS4zbAEYg22Biht91A7t2JajnAqxaj8Ws+x
 6hOSH0afPBe9agJt9sCuBXh86Y5WDcGVExmnmR5nnnrJNiP7RhTfQZYw3PX32IqpU30E
 +HmNuCVAZoPpjRUUBAVvhcy32MvZiM617hwm/s9GjRRPSoWUHtnLwkB2zuZNt+XZ9V/Z
 2MINooQlWrDu9iOnNimOfu6eeWfA3/Rbh3gFoeEttO5c2FjqNQkUkXXh5bLHZ66NnBew
 uWJYV5xn7VQEzOj/QUzqwmn3Xok7O6peEH4mr+nSAhYT7JdBPu82gTC9/pQYpjxUPoeJ
 khJA==
X-Gm-Message-State: AOJu0YxjG3z+W9Osso7yz0IEXbFNl28Vck5Ygcb1x9kbhT5QLHrn3OYO
 lo5mEFJO/qhNuD1sy2WPxHAxOVzxCGhJe3NfisAvyQ9qwWkFYWJ/u/SPyeUZ5w==
X-Gm-Gg: AZuq6aL5JEIFTYQSOjjTySpLy7WUuefrGz65affwy6JLHQO6NG20H8ERddgz2gMfRvP
 Di2sGPm0jm67sMJZnssUIxYrlxqsOLutQhpq4tMa3XIony2BeTebmXHtoA7UejQqAGWOnVFFIh1
 ttPH18/gqlC4RbMX/r7WIikwNMC2pjd2MLEoNAfTbz0q/3Au1AlDrkzqMczE5uDmxpUIrVgNVyC
 O3fc1y8vGlyCFC9Hzt6fz6Pdsz4MfvmxrRiG5+zETF/zDDEIiPMF7Eu9U3gFhVBPB4eijv8/Rs3
 wl8+JXPL4Hhoj5K1QYuvB/fUoX1zeO5SOtEiSgPwQ3uPj0gmqqSAcAGW4XXID5p9ik6r77w6fqd
 gmPGDAHMCmgbuCcO5G73eE+76MyoQ6BZ3KHcjCFw1aVYWu3ci5eG+0rq1chu61YDudouVhuEdY/
 vOh2dG9+BB0JdWDCAY3UN/19Vbx2zEV9v2BHsL8iad2qOHtsg=
X-Received: by 2002:a05:600c:8712:b0:480:4be7:4f53 with SMTP id
 5b1f17b1804b1-4830e99333amr18532745e9.31.1770158661154; 
 Tue, 03 Feb 2026 14:44:21 -0800 (PST)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310841614sm2321035e9.3.2026.02.03.14.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 14:44:19 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 23:44:12 +0100
Message-ID: <20260203224414.192218-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770158661; x=1770763461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nZ0qnyYSZvy0Gpdy0F4csIq/LwDXgJ8yAOhnIZY5A2M=;
 b=jGtFSNoWtl+qYs+Bd9vXk6by426GkACjlBywm61ZNjJJLUy2SrkGJ5lmE78jJHdpRV
 8CjvoCgybz/w9JD2niHCVYoyt0eraZsJkxNZ+5AFvbOizioYvzoc2HMxJILeMdUR9sU3
 8/Z41apySgQwCC/Ghya8f93+TbZc4FmzSJ9GfBgyvwyJe8+kmMGwH40+t4CNOkxLRII0
 PcvPxvwLsjSOD9TBNQs5ec3F9gLv9T3v1injO5E9P8aCV8etQjYzu5QLhD3m/yrf5QX6
 3a5dmFrsUcUkEfsqmw39INzyZtZ86EbPmes9cmu0Hg9lUU8HqFptqORKufWjWuwwRfaa
 LTfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jGtFSNoW
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Always require
 host-pkgconf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Require host-pkgconf only for libtirpc is not enough because libmnl
requires as well.

Upstream added it since 20200515 commit
553ca8ea3b ("net/route: Add netlink based route change tests")
using it in m4/ltp-libmnl.m4.

Later, in 20210524 in commit
6e17e2ba13 ("configure: Improve error message on missing pkg-config")
configure.ac required it explicitly:

m4_ifndef([PKG_CHECK_EXISTS],
	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL])])

This fixes error:
checking pkg-config is at least version 0.9.0... ./configure: line 7419: br-mips64r6-el-hf-glibc/host/bin/pkg-config: No such file or directory

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

It fixes failures on these old toolchains:
* br-mips64r6-el-hf-glibc [33/35]: FAILED
* br-powerpc64-power7-glibc [35/35]: FAILED

Although both removed in 8bab0acff6 and 573a113edd it's a valid change.

 package/ltp-testsuite/ltp-testsuite.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index e4e3ff8717..12db8f2d3b 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -11,6 +11,8 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
+LTP_TESTSUITE_DEPENDENCIES += host-pkgconf
+
 LTP_TESTSUITE_CONF_OPTS += --disable-metadata
 
 ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
@@ -51,7 +53,7 @@ LTP_TESTSUITE_CFLAGS = $(TARGET_CFLAGS)
 LTP_TESTSUITE_LIBS =
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
+LTP_TESTSUITE_DEPENDENCIES += libtirpc
 LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
