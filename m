Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ADE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mMGMBBJV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43A560618;
	Fri, 23 Oct 2026 21:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK35QkbpEg_B; Fri, 23 Oct 2026 21:52:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1255A60A81
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792353;
	b=H3MR7SNkSlncdd2TXhu8LbsuE820MrqD/bYROqomDm2zdYAxiL6MDZQZmvZ/PjLMqFm/
	 IbnqrUFBUFYkqu9mBu/fy+O8e4pJy8/Ga1wyEuTuG6de/GFEQ03je8JbInmjhOBpNSOaf
	 b+abJrxfs+rn6pHB1MbhowCkkqEQR5hd2eLV3NCG6Ui/VNQUaofhGcQu9fdNJAY9Tp/ZS
	 uJA3sGY1khawgeQgFEQmHALYmxtwseYnnhozcjQOCOSDqzlVgpQrDJbhtCY4WSvJ9z/lY
	 okS/JlUOsPG22ze+7VWwMp2HslbffTcODN1EYnsCdWr6d9eHmOBJKbj6MekU4TySA2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Q1Hw8g9prInOVEgYgyzjaI0wcQdZUHZgBTS4rBSHdM4=;
	b=GAf56YURWsvLxSvYaXp1TJZCrMQsufkXeD7r1dMxcyIbJMXExwX/vZ+d4k6z8tJePA7x
	 iZVGt2nGJp+9V8SCPlQsoyISWTLdZVVQE0AAYCp65cP/BGEqypCQkXIPWi6kyYGHF6oOM
	 PpNlPNQGKmCOSarvKElRlr8yR8h4EK2wJINFWcnJzhDBJd8rGptUCFPxF+LONmUiBh4pO
	 ZYsAs7CUsat2/+9AvvL7edIUMnRkv8Fe+w1vm8t392k5bPWjgcpbiQaQoAfGUNJd1/kGE
	 5XUAahFiClHBbnJ6jH0vFUwfnyZ0OyriGFtiYMNoFUBcJ3zahDowzCnRtPihGSDW5Gg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792353;
	bh=Q1Hw8g9prInOVEgYgyzjaI0wcQdZUHZgBTS4rBSHdM4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mMGMBBJVOc+Cs2cED97p5DH76X9/mZGaBEngHJHAuzLhRCiOqFa3NZzWOvYCxYPeC
	 UeEAn/9K0L9puf8eXqz/szX/C5ORLHL5FHuF5YOgbduznTojN+VLINqTCAMQXsEV2J
	 wwg3kIIpLvtPdFAYs5zXGATqOnjCOO5M+ne8PxidZ8yNPJgLwAm24nPRXpYssPN9rv
	 Vgfer+AkL79RB6b6h1YeKVsFjphB9Nt3UtjZNqSrRlVPB69kwFJd296JqlYh0fWy1K
	 rSP/Q7prQmLaagcY3I/9tUJ1+Cv2iWiCrcOJt+4BAUpu4btbdpagiYJlrArFT9SaKD
	 cNvfMP/MSRZEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1255A60A81;
	Fri, 23 Oct 2026 21:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B96CD31
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F960404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c65gKKe-_Gwk for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E003B40488
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792346;
 b=DRNKpj932PSmoKmGNfyzbE7I7SGQTt3Gsy0GCtNWVvhmWwsZnSw/A4BH0/QIhhhLNFGE
 gh7+UOFZw/INHjTnet4DIlMfrj6eH/2GGdRlxAhDp2EGQTkzYOav7DOQVwbwyoIxNphQQ
 OtPwyb18EkUOwbBAxY3YTqja4MFK3DU32+VeYIjLpR1WRCmGRoRfuRP3CYmb4xrUme8Sn
 IgxLnWdrnhd9wHmx6hHh8UXzDAWapRqGllbz7KNRkeDRKSC7QImUFBqIn+Rga9Q305NHD
 sKpQ+dMI4KIv/LXmipMnpP8Bp0ZnRGHxq7M/Ji1xr9MYE8Ft1If7JgR8jrIVdoK7HSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792346;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=PJgOINrsRK6HiZH574scepPSFp6ct75/J5bMOVuuOBc=;
 b=Ndaab8TSsxZaRaJ3KtHLVK0vlqg9pS5hTT/cAiEQ+2xczeXobu0evcpr6knfyyZ09sYW
 fo9g8AFtc5gzMOC2fQYwWpwavHgbzFaaAYn4gK5kvUcxbn22TdUGSdLOd9wTEy56FiKMK
 L20KsE1Ygr7iOkyXGVsC4tqRh26U/JU7eQVNjfnu9MfjbqsDe5sz0ukSRr9ha5mYSuNvd
 /Y1jL9DQLKzLdvJQuMVrwcaWNKvbp/6vydA68gpZq+paEod6ifPp2MxYMxS2KNT6PzhHw
 anv6za8Dkzh/D9x4dbVqxGLOqqIfZNIOllKFRYW9uClldn89WoBOeDJzhgnJjXmn5MA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=cNnRjIvy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E003B40488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:25 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ad787b79ffso782570a91.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792345; x=1793397145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PJgOINrsRK6HiZH574scepPSFp6ct75/J5bMOVuuOBc=;
 b=IKqe6ycDkrgzc9KwkuAm8evWLgd65N3HpvRja5to2sM149qCiiqV5QRbCnVoVZK3SD
 HKlPaHgufTgFcz/Scq+HhnJzlRFyRK1Dh6uZugNPEqb3P4WUm58xVTIolw926MqNJw4K
 X7OA/IGGeQpMsIz5Z7HYKaI7jcXSgwrqlZD/7SiE2P5CK4pKVYQsuVykc/ZGj6LHxt2o
 ePv7UwHKGwW+taWy6zL3+hGm63nQ9VWCja8WT029l16umsYL61z5HRIGnqbKSZd/vEp1
 AIXdOKtCEL+ySAMhvJnUwnlDr1LcWoCeoiMSDIRH+orSPLv9EW9jktnR7y2/agSaEuKC
 8lpg==
X-Gm-Message-State: AFq9FYLHOkIuvXKf/DWAU++In5TYWlGEx0k/rBiYy3rBJqf70eonZ6Hv
 VwgMe6T1+ePWClh5xvnNf7FFetNzjCYnMDGu/JDVt3eZ8KEgpt4/FD2dLekVRmX1/Q2U0fLjbj9
 +2MeEG9eSpulLyM66+Z7BxD79dCotGvisncdmUaDJ5hvUjRI+lFh7WBqz66roWe4n5pLnS32qDs
 hXVMlAt8GQjn+aw6eKKOJWfvSECksoovaZf2p7c1NzlrVhwepmf8BXuadoLsfKPVNELEsMbfMzB
 nblx2b03xbZtBo8camn
X-Gm-Gg: AYBFou2NMnN7TSd+vNl6YX1/CeWm2IG1FNvXurG5xTln0eKGBxIgCsPDYzyFP0BIRDt
 OiDG5GZAmtn69oM4690cbhGtsqhl9mfc0UVU45grmg1Xp4lthzjcbmdp2HARUUA1O2uIQg0C0g5
 fL+S8W6QKdhNHNdsRRmieOr15eMU3YFXpVeS2tv0dj53xNgN+pdsN4WTADZLpLZDcaUCC0beXPe
 Dqt480esHrLQdJe9TlXGbSqAlL42nFfSRvz6CGoOhrjDDvgOTdrVx36Z7mrZ4d7wjvsloaBS0pN
 HBlpANAiydCXabcTHaZDyqrZw2rPBNKDV+08v7u81w1SwfBcSG5kV1Utvj1EX9TDfg54unpkBH9
 sppwL+KsTgUiHhwEHlGFIjOvSFbZpafzmQwsWoxg/RUGtkim7REJiACNGOSzm+pJD7usTToG4vI
 1ZYAfkS+unrMWv5IBfPhnYRchxnOjBIUCTURso79V5
X-Received: by 2002:a17:90b:314a:b0:3ab:413:49bc with SMTP id
 98e67ed59e1d1-3adead4f73bmr380616a91.37.1792792344621; 
 Fri, 23 Oct 2026 14:52:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebab0050sm358481a91.0.2026.10.23.14.52.24
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3552883bd19so4255527eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:23 -0700 (PDT)
X-Received: by 2002:a05:693c:8814:10b0:361:7ab9:479d with SMTP id
 5a478bee46e88-369e84a69bcmr804768eec.27.1792792339103; 
 Fri, 23 Oct 2026 14:52:19 -0700 (PDT)
X-Received: by 2002:a05:693c:8814:10b0:361:7ab9:479d with SMTP id
 5a478bee46e88-369e84a69bcmr804696eec.27.1792792338141; 
 Fri, 23 Oct 2026 14:52:18 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:36 -0700
Message-Id: <20261023215138.2301146-15-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 21/23] package/linux-tools: support an
 out-of-tree kernel build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel build directory no longer contains the kernel sources, so:

 - check which tools the kernel provides against $(LINUX_SRCDIR)/tools
   rather than $(LINUX_DIR)/tools;
 - build the tools, which build in-tree, in a shadow of the kernel
   sources so that the original sources are not modified. When the kernel
   is built in-tree, nothing changes.

Also: stop python from writing bytecode next to the real perf scripts,
and make the selftests find the headers installed in the kernel build
directory, which fixes a cold-build failure. The host-built net ynl
selftests are excluded from the target architecture check.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/linux-tools/linux-tool-cpupower.mk.in |  8 ++---
 package/linux-tools/linux-tool-gpio.mk.in     |  6 ++--
 package/linux-tools/linux-tool-hv.mk.in       |  6 ++--
 package/linux-tools/linux-tool-iio.mk.in      |  6 ++--
 package/linux-tools/linux-tool-mm.mk.in       | 10 +++----
 package/linux-tools/linux-tool-pci.mk.in      | 12 ++++----
 package/linux-tools/linux-tool-perf.mk.in     | 29 +++++++++++--------
 package/linux-tools/linux-tool-rtla.mk.in     | 10 +++----
 .../linux-tools/linux-tool-selftests.mk.in    | 15 ++++++----
 package/linux-tools/linux-tool-tmon.mk.in     |  8 ++---
 package/linux-tools/linux-tool-usbtools.mk.in |  6 ++--
 package/linux-tools/linux-tools.mk            | 20 ++++++++++++-
 12 files changed, 82 insertions(+), 54 deletions(-)

diff --git a/package/linux-tools/linux-tool-cpupower.mk.in b/package/linux-tools/linux-tool-cpupower.mk.in
index 2a2d3e01dd5a..aca57ff02bcb 100644
--- a/package/linux-tools/linux-tool-cpupower.mk.in
+++ b/package/linux-tools/linux-tool-cpupower.mk.in
@@ -15,26 +15,26 @@ CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
 	DEBUG=false
 
 define CPUPOWER_BUILD_CMDS
-	$(Q)if test ! -f $(LINUX_DIR)/tools/power/cpupower/Makefile ; then \
+	$(Q)if test ! -f $(LINUX_TOOLS_KSRC)/power/cpupower/Makefile ; then \
 		echo "Your kernel version is too old and does not have the cpupower tool." ; \
 		echo "At least kernel 3.4 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		cpupower
 endef
 
 define CPUPOWER_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(STAGING_DIR) \
 		cpupower_install
 endef
 
 define CPUPOWER_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		cpupower_install
diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index e825db1b1127..32e3343fc1aa 100644
--- a/package/linux-tools/linux-tool-gpio.mk.in
+++ b/package/linux-tools/linux-tool-gpio.mk.in
@@ -9,19 +9,19 @@ LINUX_TOOLS += gpio
 GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define GPIO_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/gpio/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not have the gpio tools." ; \
 		echo "At least kernel 4.8 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(GPIO_MAKE_OPTS) \
 		gpio
 endef
 
 define GPIO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(GPIO_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		gpio_install
diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
index e638fecfc63e..73c20e3ed542 100644
--- a/package/linux-tools/linux-tool-hv.mk.in
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -20,13 +20,13 @@ HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
 
 define HV_BUILD_CMDS
 	$(Q)for prog in $(HV_PROGS_y); do \
-		if test ! -f $(LINUX_DIR)/tools/hv/$${prog}.c ; then \
+		if test ! -f $(LINUX_TOOLS_KSRC)/hv/$${prog}.c ; then \
 			printf "Your kernel version is too old and does not have the HyperV %s tool." "$${prog}" ; \
 			exit 1 ; \
 		fi; \
 	done
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/hv \
 		$(HV_MAKE_OPTS) \
 		$(HV_PROGS_y)
 endef
@@ -40,7 +40,7 @@ endif
 
 define HV_INSTALL_TARGET_CMDS
 	$(foreach prog,$(HV_PROGS_y), \
-		$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/$(prog) \
+		$(INSTALL) -m 0755 -D $(LINUX_TOOLS_KDIR)/tools/hv/$(prog) \
 			$(TARGET_DIR)/usr/sbin/$(HV_$(prog))
 	)
 	$(HV_KVP_HELPER)
diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
index 27ab0ed7ed63..b975a548e473 100644
--- a/package/linux-tools/linux-tool-iio.mk.in
+++ b/package/linux-tools/linux-tool-iio.mk.in
@@ -9,19 +9,19 @@ LINUX_TOOLS += iio
 IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define IIO_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/iio/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not have install section in the iio tools." ; \
 		echo "At least kernel 4.7 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/iio \
 		$(IIO_MAKE_OPTS)
 endef
 
 # DESTDIR used since kernel version 4.14
 define IIO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/iio \
 		$(IIO_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
index b2ec090fc086..703d3681ae43 100644
--- a/package/linux-tools/linux-tool-mm.mk.in
+++ b/package/linux-tools/linux-tool-mm.mk.in
@@ -7,16 +7,16 @@
 LINUX_TOOLS += mm
 
 define MM_BUILD_CMDS
-	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+	$(Q)if test -f $(LINUX_TOOLS_KSRC)/vm/Makefile ; then \
 		MM_SUBDIR=vm; \
-	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
+	elif test -f $(LINUX_TOOLS_KSRC)/mm/Makefile ; then \
 		MM_SUBDIR=mm; \
 	else \
 		echo "Your kernel version is too old and does not have the mm tool." ; \
 		echo "At least kernel 3.4 must be used." ; \
 		exit 1 ; \
 	fi ; \
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(MM_MAKE_OPTS) $${MM_SUBDIR}
 endef
 
@@ -24,12 +24,12 @@ endef
 # exists, because that was checked at build time already; we just
 # need to find which of the two: if not one, then the other.
 define MM_INSTALL_TARGET_CMDS
-	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+	$(Q)if test -f $(LINUX_TOOLS_KSRC)/vm/Makefile ; then \
 		MM_SUBDIR=vm; \
 	else \
 		MM_SUBDIR=mm; \
 	fi ; \
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(LINUX_MAKE_FLAGS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 52d7639bb102..a6f6ef265643 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -7,11 +7,13 @@
 LINUX_TOOLS += pci
 
 # Linux 6.14 moved the PCI endpoint tests into Kselftests.
-PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
-	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
+PCI_SUBDIR = $(strip $(if $(wildcard $(LINUX_TOOLS_KSRC)/testing/selftests/pci_endpoint/Makefile),\
+	testing/selftests/pci_endpoint,pci))
+PCI_SRCDIR = $(LINUX_TOOLS_KSRC)/$(PCI_SUBDIR)
+PCI_BUILDDIR = $(LINUX_TOOLS_KDIR)/tools/$(PCI_SUBDIR)
 
 PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
-	OUTPUT=$(PCI_SRCDIR)/ \
+	OUTPUT=$(PCI_BUILDDIR)/ \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDLIBS="-lrt -lm"
 
@@ -22,12 +24,12 @@ define PCI_BUILD_CMDS
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_BUILDDIR) \
 		$(PCI_MAKE_OPTS)
 endef
 
 define PCI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_BUILDDIR) \
 		$(PCI_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests/pci_endpoint \
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 8c91c2cc6b0f..a2218263a208 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -18,6 +18,11 @@ else
 PERF_ARCH=$(NORMALIZED_ARCH)
 endif
 
+# The python scripts run by the perf build are run through symlinks when
+# building out of tree: do not let python write its bytecode next to the
+# real script, in the kernel sources.
+PERF_MAKE_ENV = PYTHONDONTWRITEBYTECODE=1
+
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	JOBS=$(PARALLEL_JOBS) \
@@ -142,25 +147,25 @@ endif
 # We name it 'GNUmakefile' so that GNU make will use it instead of
 # the existing 'Makefile'.
 define PERF_DISABLE_DOCUMENTATION
-	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
-		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
+	if [ -f $(LINUX_TOOLS_KDIR)/tools/perf/Documentation/Makefile ]; then \
+		printf "%%:\n\t@:\n" >$(LINUX_TOOLS_KDIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_PRE_CONFIGURE_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
+# out of tree build. We build perf in $(LINUX_TOOLS_KDIR)/tools/perf/ and not just
 # $(LINUX_DIR) so that it isn't built in the root directory of the kernel
 # sources.
 define PERF_BUILD_CMDS
-	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
+	$(Q)if test ! -f $(LINUX_TOOLS_KSRC)/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
 		echo "At least kernel 2.6.31 must be used." ; \
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile* ; then \
-			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
+		if ! grep -q NO_LIBELF $(LINUX_TOOLS_KSRC)/perf/Makefile* ; then \
+			if ! test -r $(LINUX_TOOLS_KSRC)/perf/config/Makefile ; then \
 				echo "The perf tool in your kernel cannot be built without libelf." ; \
 				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 				exit 1 ; \
@@ -168,14 +173,14 @@ define PERF_BUILD_CMDS
 		fi \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_LINUX_TOOLS_PERF_TUI)" = "y" ; then \
-		if ! grep -q NO_SLANG $(LINUX_DIR)/tools/perf/Makefile* ; then \
+		if ! grep -q NO_SLANG $(LINUX_TOOLS_KSRC)/perf/Makefile* ; then \
 			echo "The perf tool in your kernel cannot be build with the TUI." ; \
 			echo "Either upgrade your kernel to >= 3.10, or disable the TUI." ; \
 			exit 1 ; \
 		fi \
 	fi
-	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/
+	$(TARGET_MAKE_ENV) $(PERF_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(LINUX_TOOLS_KDIR)/tools/perf O=$(LINUX_TOOLS_KDIR)/tools/perf/
 endef
 
 # After installation, we remove the Perl and Python scripts from the
@@ -191,8 +196,8 @@ LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 endif
 
 define PERF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/ install
+	$(TARGET_MAKE_ENV) $(PERF_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(LINUX_TOOLS_KDIR)/tools/perf O=$(LINUX_TOOLS_KDIR)/tools/perf/ install
 	$(PERF_INSTALL_REMOVE_SCRIPTS)
 endef
 
diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
index d9bdcc3016e7..aef4343010c8 100644
--- a/package/linux-tools/linux-tool-rtla.mk.in
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -16,7 +16,7 @@ RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 define RTLA_DISABLE_STACK_PROTECTOR
-	$(SED) 's/-fstack-protector.* //' $(LINUX_DIR)/tools/tracing/rtla/Makefile
+	$(SED) 's/-fstack-protector.* //' $(LINUX_TOOLS_KDIR)/tools/tracing/rtla/Makefile
 endef
 endif
 
@@ -27,14 +27,14 @@ define RTLA_LINUX_CONFIG_FIXUPS
 endef
 
 define RTLA_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not implement the rtla tool." ; \
 		echo "At least kernel 5.19 must be used." ; \
 		exit 1 ; \
 	fi
 	$(RTLA_DISABLE_STACK_PROTECTOR)
 	$(TARGET_MAKE_ENV) $(MAKE) $(RTLA_MAKE_OPTS) \
-		-C $(LINUX_DIR)/tools/tracing rtla
+		-C $(LINUX_TOOLS_KDIR)/tools/tracing rtla
 endef
 
 # make rtla_install build and install by default documentation using rst2man
@@ -42,12 +42,12 @@ endef
 # folder so let's simply install the resulting rtla binary and create symlinks
 # like Linux does in its tools/tracing/rtla/Makefile
 define RTLA_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(LINUX_TOOLS_KDIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
 	ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
 	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
 
 	# Check if hwnoise is provided or not
-	if grep -q hwnoise $(LINUX_DIR)/tools/tracing/rtla/Makefile; then \
+	if grep -q hwnoise $(LINUX_TOOLS_KSRC)/tracing/rtla/Makefile; then \
 		ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise ; \
 	fi
 endef
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index 032a71e32000..4f25c4a922c1 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -27,11 +27,14 @@ SELFTESTS_MAKE_FLAGS = \
 	KHDR_DIR=$(LINUX_DIR)/usr/include \
 	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
 
+# The ynl library of the net selftests is built with the host compiler
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
-	/usr/lib/kselftests/tc-testing/
+	/usr/lib/kselftests/tc-testing/ \
+	/usr/lib/kselftests/net/lib/ynl/ \
+	/usr/lib/kselftests/drivers/net/
 
 # O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
+# out of tree build. We build the selftests in $(LINUX_TOOLS_KDIR)/tools/selftests and
 # not just $(LINUX_DIR) so that it isn't built in the root directory of the kernel
 # sources.
 #
@@ -43,12 +46,12 @@ LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 define SELFTESTS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR) $(SELFTESTS_MAKE_FLAGS) \
 		headers_install
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/testing/selftests \
-		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_DIR)/tools/testing/selftests
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_TOOLS_KDIR)/tools/testing/selftests
 endef
 
 define SELFTESTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/testing/selftests \
-		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_DIR)/tools/testing/selftests \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_TOOLS_KDIR)/tools/testing/selftests \
 		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests install
 endef
diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 56c328c51fd7..cb071f5fee12 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -14,24 +14,24 @@ TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 define TMON_DISABLE_STACK_PROTECTOR
-	$(SED) 's%-fstack-protector%%' $(LINUX_DIR)/tools/thermal/tmon/Makefile
+	$(SED) 's%-fstack-protector%%' $(LINUX_TOOLS_KDIR)/tools/thermal/tmon/Makefile
 endef
 endif
 
 define TMON_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not have the tmon tool." ; \
 		echo "At least kernel 3.13 must be used." ; \
 		exit 1 ; \
 	fi
 	$(TMON_DISABLE_STACK_PROTECTOR)
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		tmon
 endef
 
 define TMON_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		tmon_install
diff --git a/package/linux-tools/linux-tool-usbtools.mk.in b/package/linux-tools/linux-tool-usbtools.mk.in
index 797758adce51..6e72fe6de79a 100644
--- a/package/linux-tools/linux-tool-usbtools.mk.in
+++ b/package/linux-tools/linux-tool-usbtools.mk.in
@@ -13,20 +13,20 @@ LINUX_TOOLS_USBTOOLS_LIST = \
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),ffs-test)
 
 define USBTOOLS_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/usb/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/usb/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old to build the USB tools." ; \
 		echo "At least kernel 5.9 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/usb \
 		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
 		$(USBTOOLS_MAKE_OPTS) \
 		all
 endef
 
 define USBTOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/usb \
 		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
 		$(USBTOOLS_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 49e73a9ca4ec..c1b13af0dd4c 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -8,7 +8,25 @@
 # Instead, we directly build in the sources of the linux package. We can do
 # that, because we're not building in the same location and the same files.
 #
-# So, all tools refer to $(LINUX_DIR) instead of $(@D).
+# So, all tools refer to $(LINUX_TOOLS_KDIR) to build, instead of $(@D).
+#
+# Which tools can be built, though, is checked against the kernel sources
+# in $(LINUX_SRCDIR), which is not $(LINUX_DIR), the kernel build directory,
+# when the kernel is built out of tree.
+#
+# The tools build in-tree, and we do not want to pollute the kernel sources
+# of an out-of-tree build. So in that case, we build in a shadow of the
+# kernel sources, which is a tree of real directories with symlinks to the
+# files.
+LINUX_TOOLS_KSRC = $(LINUX_SRCDIR)/tools
+LINUX_TOOLS_KDIR = $(if $(LINUX_OUT_OF_TREE),$(LINUX_TOOLS_BUILDDIR)/linux,$(LINUX_DIR))
+
+define LINUX_TOOLS_SHADOW_SOURCES
+	$(if $(LINUX_OUT_OF_TREE),\
+		support/scripts/symlink-tree -f tools $(LINUX_SRCDIR) $(LINUX_TOOLS_KDIR))
+endef
+# Must come first, before the hooks that tweak the kernel sources
+LINUX_TOOLS_PRE_CONFIGURE_HOOKS += LINUX_TOOLS_SHADOW_SOURCES
 
 # Note: we need individual tools makefiles to be included *before* we build
 # the list of build and install hooks below to guarantee that each tool has
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
