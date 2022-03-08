Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D44FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 23:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CAA400DA;
	Tue,  8 Mar 2022 23:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_Gj7RkZvwFA; Tue,  8 Mar 2022 23:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFC2540131;
	Tue,  8 Mar 2022 23:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4751F1BF363
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 23:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D0C40131
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 23:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FttZJEhf54-u for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 23:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD276400DA
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 23:18:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t11so431748wrm.5
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 15:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wXa/eVyGH3otGTWdDVvcsl8ZfvIKzb6zUYCglOWP2Co=;
 b=nhs59RwFbJtehtss4rWmfdM8Y3O9l68v74hnMXRXCm/mLZZsHHSlhvWdPNNETQ3/s9
 tMHXLMytHG24q089L9ecnzeBca2vIydu8VKhWt8N6Tsr0yEStKMr/O+8+DI8hgVmZpDg
 AHNa1bLhiGzhMDz12Dy+BiQDn9rui8Azp2De9QzDcafi8d4GChLMmpfYE7x+NQybN1in
 sJrD4Y5PqrADksgwuD/uztWUnkfSwgG4C/0qxTPthodJQb7M0WJdKk45c4KIlRdRFX1H
 R592vyqHmaMj740OeMap3msZriV48N/vbqayC/XJVqa8XN9WOgZs4zK6E9EqDWzOhp7t
 O8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wXa/eVyGH3otGTWdDVvcsl8ZfvIKzb6zUYCglOWP2Co=;
 b=YRPzZo2YnxW7wrd7YFTdi/NOgxIrULXC/8TkFR/J3UMHna1XXS46j/gw5d30TsoN7v
 j0NCher4Yob/jqBlGVklgOrloeAm/V0CHRnlFA/y4QWDLcNLfJvu7hymVFOHJID025Sw
 PdGFZ8a9Yw/oVYKm+/EdSivmj/2i+QK7dWsXO3qfUmd8bSYhw/Ln04N09ONquTWwg6+f
 /8AIbVnUHlh9ypVhcxqit2PXeG4Df3JPY/hJRBNA9EHvJF2pdaMIhdOD9T/ZScC+cJMZ
 W/YQMzTnK31PjNRLQKSM+nZF8XaaYQ8B0ZpaXUA7/AZCkKzSROrXDI6IwJxcCpM3wtkH
 rmww==
X-Gm-Message-State: AOAM530JsVloNXVfSbgpaI+D+oWee1FCJ6CDCgG+JTPIzyqo8oWu50/y
 Vq+musngq5zrsaLmiDiWbuATvKqAYUE=
X-Google-Smtp-Source: ABdhPJy0glS0pfmDldBsKHzDfMPrUekzjTC9d2mY0ra0MQC/ELtnErPbFer9Fvpg9qw63WtTrjcXeg==
X-Received: by 2002:a5d:5507:0:b0:1f0:5eb8:c7b3 with SMTP id
 b7-20020a5d5507000000b001f05eb8c7b3mr13626764wrv.13.1646781503613; 
 Tue, 08 Mar 2022 15:18:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-1338-205.w86-229.abo.wanadoo.fr.
 [86.229.185.205]) by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm142048wmj.34.2022.03.08.15.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 15:18:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 00:17:33 +0100
Message-Id: <20220308231733.176991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: fix dnssec static build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop -DHAVE_DNSSEC_STATIC which has been added by commit
e913527b94e2e47b4ea6fcf13e281d5969f54fd6 but is not needed and raises
the following static build failure because dnsmasq will wrongly append
"-Wl,-Bstatic -lgmp -Wl,-Bdynamic":

/home/buildroot/autobuild/instance-2/output-1/host/bin/x86_64-linux-gcc -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o pattern.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o hash-questions.o domain-match.o -Wl,-Bstatic -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lhogweed -lgmp -lnettle  -Wl,-Bdynamic -Wl,-Bstatic -lgmp -Wl,-Bdynamic
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: attempted static link of dynamic object `/home/buildroot/autobuild/instance-2/output-1/host/x86_64-buildroot-linux-musl/sysroot/lib/../lib64/libc.so'

Strangely enough, this is the first time this build failure is raised by
the autobuilders whereas "-Wl,-Bdynamic" is set since a very long time:
https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=c979fa04a40ff12370c8d3a82ad27d9d3b5907e3

Fixes:
 - http://autobuild.buildroot.org/results/99b419ddb5a3be561d39e715833510a59519213e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dnsmasq/dnsmasq.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 0569475fc4..230e4a8116 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -26,9 +26,6 @@ endif
 ifeq ($(BR2_PACKAGE_DNSMASQ_DNSSEC),y)
 DNSMASQ_DEPENDENCIES += gmp nettle
 DNSMASQ_COPTS += -DHAVE_DNSSEC
-ifeq ($(BR2_STATIC_LIBS),y)
-DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
-endif
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
