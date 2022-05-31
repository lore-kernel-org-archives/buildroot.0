Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE679C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 19:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6288D84098;
	Tue, 31 May 2022 19:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THzoMFFUstDK; Tue, 31 May 2022 19:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1A08409A;
	Tue, 31 May 2022 19:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2231BF48C
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A00941C85
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIKtZQd7ye7F for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 19:09:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1E3541C73
 for <buildroot@buildroot.org>; Tue, 31 May 2022 19:09:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t6so19944232wra.4
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZDiDejIvhTcvI8W8CZriwnEqcq05YVyEbC2tt+TLp0=;
 b=JUOWnzKD7jaqjRNShaBnw35uJDdT5AocoIBkMdmhZkrAVFZWzGqlGSK1FAB2vNIc8W
 /u/VEdKLfFU3MvFGDJivCehgx1qG8gvnJZqE+/k/2wDB2L5aVN2w4VA3iiJcGmrHe+0U
 Qlr55FesbOQUuiL18RNK/RutR2/WaTZzsUrqaeWEYFao+7+HTL/UGR/IK4LX4MQXdgbb
 A6u3l8AlMNpo7M4tVqam1mi+Do0qKUXElVBhqoQdUExmPGbl92Sm3njAyNlwXwefgdtG
 J7/HzzQIGpUikdaym4ynMbsZvQZI1oQRKjusOFDPr5d5stXi3IdH2ifNqbiCzXpcVJFC
 nqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZDiDejIvhTcvI8W8CZriwnEqcq05YVyEbC2tt+TLp0=;
 b=vBm0LikgNOV63xlaFOccti2wci0xDRJmxEm6sc9Q8yNrkzcosUz8pKGN3rQD/R+K66
 sUxawUvLZElO5DNEgr308lVyIqczbD9A0nALIdLh3FXcVyW0z/ltwuONC0hsiAVl25HI
 xH3ms2BV4+mrejpALUblehasrEay9mPJclTpaIgc2MDILfJl4002L9AiqzKPwWeDU5PD
 tXiZoeRq2SDNGnWLXBn490aAZJc2J4ptw3a65WoWy7voQ4PTD59nH2Hxd3KXe2TX7DT+
 yc0V8a7ptd32CkCvd8u90znB7UXZYDj8pQHpinyh3U1DdCAgpwLyU3poutr8hSFf57Va
 3HSg==
X-Gm-Message-State: AOAM531RYiLi4Y27cR/5t9CjUwXmsqibYqNVv8x8O2dQrie3PoBb8cAg
 iIltFK5/SKxtO7Ppd9objPRFZZwmGPA=
X-Google-Smtp-Source: ABdhPJx7Mra4GKyabF933fpHeeRejov9MlDI0Ipc0Dnr4efbpBG0JGqxtPjA64+42PsxHhxLGRuAdA==
X-Received: by 2002:a5d:4e08:0:b0:210:297:7d4b with SMTP id
 p8-20020a5d4e08000000b0021002977d4bmr25945514wrt.112.1654024175806; 
 Tue, 31 May 2022 12:09:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b0039b006bd6d9sm3577373wmq.6.2022.05.31.12.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 12:09:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 21:07:02 +0200
Message-Id: <20220531190702.107175-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zabbix: fix BR2_SHARED_STATIC_LIBS
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--static is added to pkg-config call with BR2_SHARED_STATIC_LIBS
resulting in the following build failure with openssl or libcurl:

configure:13132: /home/autobuild/autobuild/instance-6/output-1/host/bin/or1k-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -I/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static -L/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib conftest.c -lssl -lcrypto -lm   >&5
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o): in function `dlfcn_globallookup':
dso_dlfcn.c:(.text+0x2c): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_addr.o): in function `BIO_lookup_ex':
b_addr.c:(.text+0x1128): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_sock.o): in function `BIO_gethostbyname':
b_sock.c:(.text+0x90): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /tmp/cceWHjDi.o: in function `main':
conftest.c:(.text.startup+0x8): undefined reference to `SSL_connect'

[...]

configure: error: OpenSSL library libssl or libcrypto not found

---

configure:15199: checking for main in -lz
configure:15219: /home/autobuild/autobuild/instance-13/output-1/host/bin/s390x-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2  -I/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static   -L/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib conftest.c -lz   -lm    >&5
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: cannot find -lz
collect2: error: ld returned 1 exit status

[...]

configure: error: static library z required for linking libcurl not found

Fixes:
 - http://autobuild.buildroot.org/results/c05230d13fa0538323bb77e8f35533e6dd02453f
 - http://autobuild.buildroot.org/results/cc947038510e16417298b381521f226f7c45f986

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zabbix/zabbix.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index adc54028ad..85fd193b4d 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -125,6 +125,13 @@ endif
 
 endif # BR2_PACKAGE_ZABBIX_SERVER
 
+# With BR2_SHARED_STATIC_LIBS=y, the generic infrastructure adds
+# --static when calling pkg-config resulting in a build failure with
+# libcurl or openssl. Adding --disable-static reverts this
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ZABBIX_CONF_OPTS += --disable-static
+endif
+
 define ZABBIX_INSTALL_INIT_SYSTEMD
 	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
 		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
