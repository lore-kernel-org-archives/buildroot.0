Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B81FF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 14:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9399A40B44;
	Thu, 30 Apr 2026 14:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuPS6RRTQXqe; Thu, 30 Apr 2026 14:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B691140B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777558203;
	bh=P13GVNtdk5xihAN6Al3tmK5ypriOztAOAvzxiDcjLg0=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A+Ggou0AmIaLALL4r2n8TdX9oWo8VaFWxgSxs5D2kRu/fgx7RNkne131bXD2IhJ4u
	 IM37H+hLvecKwka3213lnySyRg1dROsPETI1qtjJDh3WKMELQ1YgkcrBxbQIMnBc+y
	 EN3qtj0xVmkGeQ+XhH2i6/BmfEz+ZAmYz3+gO8tOqf7Y86Qml0VDJpONmqzRFGJsrF
	 6g3pJmanagBWsk8pcaLLvJojnrLTWoFeBWIliWchI46ESUlvH2XGkwUxD+4gQnP7O2
	 hBZBmQtWC0C46zYZ9ZVzL3QiDvGK4f4qZv6plD35hrUcJ2Wgu3S0XDHdJY4up7CsA4
	 nUXeJQA8vOyxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B691140B46;
	Thu, 30 Apr 2026 14:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC791192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE61483BB2
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fw7La0gjDbQU for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 14:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B1A783AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B1A783AE0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B1A783AE0
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:09:59 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 3CD30C15AB
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:09:54 +0200 (CEST)
Message-ID: <eabb6434-6827-48cb-bd2c-964b94ea07ba@grenoble.cnrs.fr>
Date: Thu, 30 Apr 2026 16:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1777558194;
 bh=ut/UKv7FfAyMvoMAA+UfeOXQxhkABR0RRjyqfVZWSJI=;
 h=Date:To:From:Subject:From;
 b=MecgXH3zMFbrRpnzpuF/HyUCw+DPMOYns4UCuLTeDG/UOi+9gsdPxJfrldLJsY5lM
 4wGCszYhA37zvCOGYGOmRXk9/PGzSCkUQjOB6iG9+wj5LRuLqPVZh0oLBf46vXx48V
 LNc2b4IEIbasU/dX2VrIxfXn2X8sXeTYHOif/3bkfZ57PnOeTPiqvBqUC0h/3mUVhe
 JeFplBSvxsbUCycue5ijK1ldT3y7Sv/OQIylgq/2fYB77BxqRX6Jl+CUu6yjJ63Iss
 rIi0NSoaFV+OqB9CS3rSDS5lm2U69tYJ/65TNkCqoKKcKme+QhmJ2DlLiXHsJFPnpI
 1h3YApdkX6sFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=MecgXH3z
Subject: [Buildroot] [PATCH 1/1] package/libgpiod: enable the kernel GPIO
 ABI v1
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unlike libgpiod2, this version of libgpiod relies on the deprecated GPIO
ABI version 1. This ABI used to be enabled by default. However, since
Linux 7.1-rc1 (commit 7673e4c7f7f9 "Do not enable the v1 uAPI by
default"), this is not the case anymore. Failing to enable the ABI
results in a non-functional libgpiod. For instance:

    # gpioinfo
    gpioinfo: error creating line iterator: Invalid argument

Fix this by enabling the ABI v1 in LIBGPIOD_LINUX_CONFIG_FIXUPS.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
I noticed the problem on an Acmesystems Acqua-A5 board. Tested the patch
in qemu as follows:

    sed -i -e '/# CONFIG_GPIOLIB is not set/d' \
        board/qemu/arm-versatile/linux.fragment
    make qemu_arm_versatile_defconfig
    utils/config -d PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
    utils/config -e PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0  # "7.0 or later"
    utils/config -d DOWNLOAD_FORCE_CHECK_HASHES
    utils/config --set-str LINUX_KERNEL_CUSTOM_VERSION_VALUE 7.1-rc1
    utils/config -e PACKAGE_LIBGPIOD
    utils/config -e PACKAGE_LIBGPIOD_TOOLS
    make
    output/images/start-qemu.sh
---
 package/libgpiod/libgpiod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index f669643b39..f5584a9f1e 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -24,6 +24,10 @@ else
 LIBGPIOD_CONF_OPTS += --disable-tools
 endif
 
+define LIBGPIOD_LINUX_CONFIG_FIXUPS
+    $(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_CDEV_V1)
+endef
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD_CONF_OPTS += --enable-bindings-cxx
 else
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
