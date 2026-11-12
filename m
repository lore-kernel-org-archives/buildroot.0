Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF680606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hOfaEXEw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JqsMFM7V
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CAA40D96;
	Thu, 12 Nov 2026 19:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzXIXgesLsBg; Thu, 12 Nov 2026 19:25:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ADCBD40D8F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794511529;
	b=H6UFM6OlWvQPaNt8We4k8btPnnIcGqbzp/N7/c4grdwEaq/cUmKdx42kCtp5fxmd+rai
	 1r6Z+jkVS4otDfXu6gt1E/jTurTnQLZzKCqLi68t04KO5N03UinvxDCn7HRWshjT95/gV
	 sxX6uGzmmdM2/t25kn4zbVoYznY4KGWR0oJSi2g3qsqJctSn9/z6bNbYnQB+cb1QI5wxH
	 HxeHLwcV3Iwm5htoDv4EBw94RQP11sWqpYpSWTw2YuUwGlD/L7RQTBkhsmx4XsRrHSm+s
	 IDxuax/kKh34xqVxFgNIdutPxVtMC1WlFt2cvibOGcx5fb/ihmdXx1ABbIEv9lSbasA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794511529;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4u60C/X3jhViuQw9SElg2d1gHFlOhvwHhoPM7NdWpbw=;
	b=ka4TtOoTIqL+hYNsSSUxDqDK9CEiHDHVjjeV6SCtnfgbKHwF2gARMgFyhY9RTf8OeR7N
	 1B1S0ihWreIrMNGxW4ygg8eOMDzTeZALto5/6Ax7ijWXovU78XAKkvIYvruEOM9lC0kEL
	 F0OyB+EcxphEYY5YH+XLzV+ZPf426QmAYRZmxpdNHaEKQWuO/pZIGmld24uI/qkWwd/l2
	 VN6Ks3zuhDCz0e5ofn3hvLt37+EAUmGgy+RF9oPIcmApDhmtic7rbuUk2qNkoXouc+yhJ
	 ZMGSlKVI4e6kFLqrQmcRy4py/VTQKVll9VQl/w+VuJl3phpi72WkcyvwMhw0K2WmNIw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JqsMFM7V;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794511529;
	bh=4u60C/X3jhViuQw9SElg2d1gHFlOhvwHhoPM7NdWpbw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hOfaEXEwOATC0MeBNyBterl+hT3K5jE8M18vfoaqbnEQ5lYtwtiXcyvt712EsOFzm
	 C3hNp7zr8t9KtnnighbqVoe+aHHjE9832+OXuznTyqvZNP9769diQ5N64j7z6BCWqM
	 z+4NPQ4OnamTtpnNWjDCBqbzlIkGw/0bsfJ9hI6US9pslPCjJ8YNZTKv+JcNa0VJtx
	 Raf3D/9JvJstARNRuPBc6UBRoDd75ESp/GKKOkJQ94kGLMvvAq15dfsZsDzBQmiod2
	 JPORC3x52VlDYwGqWH6KbO1vORgaT5YyeTbYf/du+aX6o3+GeMxfQP0NTg/A+8zAmi
	 KSFeRp1MhG2wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCBD40D8F;
	Thu, 12 Nov 2026 19:25:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBFEB1790
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8FC140D8F
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrNZR3zy1JWa for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:25:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1027C40D74
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JqsMFM7V
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1027C40D74
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794511524;
 bh=/pgRu/JECW1YeI8UZWrkKHHosfiSNc2a8A2Zhv3JaQQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JqsMFM7VtIpjAepDu6h2wUNtPhCv/t2fOOr7hlzGf9m/W+HmGClGKGspFwCjnZlpM
 eHzMzFO63bV4/ExvD5tfLjEk8w3g/V+uN/ocEq7R21paUH7T0LZS1qHWC6eyrgVKZ/
 IHkjdhdUD3PTEHXrqVMjm6YVSu2YAcruxrRktgxjOksoQ6IMALCLteloiZKz0JFTfR
 NzSZpoWni1C48cCGoOVLl9hW/Hct6xRvRIlP69Vp8l3MY5AXY0wq1VfiU3bWnG3gm6
 I/YIXv5WBOwBgj0P4jrUx0s7yA82VGdpCPkp70nuZtjrVgsVwC07IWHbAmzQJ8SE8M
 t2e5vO53bhb+g==
X-KAS-Sym: v3:f51bdf72230551df:Clbr0x+vcQ+nh8vBqvFoeZstHusRJYrRDDnZznkXjRYlN
 ebf6e7/iHV/u9RUYEfS4E0HJ6KsO48+V/xEOn5+Cg7YfAAMuZXQQYhoLw9y4MTpkcyz2l8s900H
 teTo6LqQtb59w/+q6FSzp4L2qxSCANHJvRVokv3rVcpk1QnraAosmkIulJqTmlcrxPkrG+iaHfW
 TMy2RGQXSDOsYZZske4MwoIehla6vD2WGp+Ss+N70BpW/K5niNVj6AY8sac7aEyGuBTbAOp1L99
 rAeX55JwxJy1koM809WZ+qR2MB9hNg3x4WkKIZc+h9dFkHqDHChn0WJFJ9irW0BvXmZ2fX9g==:
 NwOb0NrMjJh7rco2FQytdytgmsJdfFK54H9irLcsiFM4dRVAXNlRtCJSLcNtUfB8FdqL+WvSNlw
 ZH1I2c/Fl0YBtgpqtmjnkapijgx0NDvF4u32Ir4zd0lXMSG1Mu3W8/3SS+6CEn+XiofCpgGylYg
 kbWUnpj0v3JwhTVRbH/ciwmP5Yy3LSBoZB/UBlUZnht5P4hgpejhPicNKaDsmViz3jOpWS9SV+o
 Fe3sOqOVgK/ZDLnVNXm9eXyZAz7Ly70IumxFSd1vYO8PFiczNYMp91qyhLOIKW4d+ahfuWwhT6g
 bB/rQy0Ire/TDOhg+zVMytzQX3nQOk/I1nCyscbW1bzBftR2TYqe/Bzbooe3FcNDWCZRENQ4y/T
 WApArb2GyNoZaBMv8ZZmBQxzKUsYtUVMPgQnyEHAlYioj6nX6Q+jd7sJbbZVCWRGpivarJiTNX/
 Z9UNv/IGKuG1N7LU+0waWe/D4YSiAadt6Lzmc04QOOQS18o2J/9HZI4L1PF1k1VXeEssHHxEQgO
 2OEG3ixa0IiC2qXp/SomnV2UrK/2GqprIFRN0XR+ba77cQ+jqDvgDAPZR/36jaW314+5t25x3be
 Cgw=
Received: from fli4l.lan.fli4l (p5b3a07b2.dip0.t-ipconnect.de [91.58.7.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6304A4C45AB;
 Thu, 12 Nov 2026 20:25:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37768)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRaQG-000000007Fe-1DPk;
 Thu, 12 Nov 2026 19:25:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 12 Nov 2026 20:25:24 +0100
Message-ID: <20261112192524.103778-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/php: fix build on i386
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes build error:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 ext/pcre/.libs/php_pcre.o: warning:
 relocation in read-only section `.text'
/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 read-only segment has dynamic relocations

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281

No autobuilders errors were recorded, nonetheless a backport to LTS
branches is advised because other packages needing the same fix showed
autobuilder errors for older branches.

The build error can be reproduced using this defconfig:

BR2_i386=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_SAPI_APACHE=y
BR2_PACKAGE_APACHE=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 1bb25d0863..3094bc999d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -77,6 +77,7 @@ PHP_CONFIG_SCRIPTS = php-config
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
 PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
+PHP_LDFLAGS = $(TARGET_LDFLAGS)
 
 # We need to force dl "detection"
 ifeq ($(BR2_STATIC_LIBS),)
@@ -93,6 +94,10 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 PHP_CFLAGS += -marm
 endif
 
+ifeq ($(BR2_i386),y)
+PHP_LDFLAGS += -Wl,-z,notext
+endif
+
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
@@ -361,7 +366,10 @@ endef
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_CERTIFICATES_FIXUP
 endif
 
-PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
+PHP_CONF_ENV += \
+	CFLAGS="$(PHP_CFLAGS)" \
+	CXXFLAGS="$(PHP_CXXFLAGS)" \
+	LDFLAGS="$(PHP_LDFLAGS)"
 
 HOST_PHP_CONF_OPTS = \
 	--disable-all \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
