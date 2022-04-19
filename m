Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E64C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 16:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3170D40391;
	Tue, 19 Apr 2022 16:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWNho7HngbXE; Tue, 19 Apr 2022 16:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CB540190;
	Tue, 19 Apr 2022 16:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE4941BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC0FF40190
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDdYmwc9W7TV for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 16:13:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95E04400AF
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 16:13:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x18so15273145wrc.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SC7E1Fqlowj1j6iyzrzhJ/sLBxCIn9mbu3+e61rWgK0=;
 b=hC1zxWwV+jNrYwl1CxilAqLGemGT8ptzaaZ7dG4SqYs95EXRuXzqKC0tWqxbLbTUFC
 nXwrctHG6lYlTG7uWQwlUr7YLLFSxtNxrphXS5JZOxbA2Bq1IXEcJhYHroNS8U4woVOB
 kONQhx0/j3NsWFQInGw8IDu/NanW7a3usx0c7SfPcfgX/1xv7P2H6OTxUcjD49+XoiyS
 dENz99c2nSdhL0yP+CFnZI8UsYCvBapw1jX3C+71pP9noGkR115hNIWPvvIqOJmM5nHs
 yG7nysQtbUTJG3ZxONyQFSZjdHREmaVA44PB0zEvjjT8nQPqOLz9pmMDcug/cxRvWnNN
 P0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SC7E1Fqlowj1j6iyzrzhJ/sLBxCIn9mbu3+e61rWgK0=;
 b=21GCIG3PfkSpUs1hplmc/fOIOUEFQhHQNIXMEc4+KkmQLr3kPEt89BINpYi3hPfMPY
 1zFzdk0ovhxrujKhBCVMUxdL7GX+Y7L9sROFwmZykDXPS5lTXJrOC5n2W+l58F/Wyrqx
 e7DXNdxYJeMiPgmfPtjicBdJcKrrhL1MFSICMAY3gACqy05tcWrnhZ+RZd1oWnmKtaCf
 Kwx/ML6u+8en/LwiVnadSWEE1ZdSstl6ViqYkuJihALRjxc/ta0z5kZiE+FvkXAUCxkl
 WnqAA42HGNaatbZC1krDJ+JLeHGQNX8NqEHacDlZTwTfGZlBA/bL7eKsBtdsHqQ8Qe2D
 yQHw==
X-Gm-Message-State: AOAM532Qj5EaFriPzogd0yzQL/zbEq1IZoVYGH0PtNL8E6YGBmLMjtNW
 DORLE54hJtDJcnQgslE2WZKvfEOBTOw=
X-Google-Smtp-Source: ABdhPJzxThNtZLI/pVVf0NFVGbYKtbwLINYc7vlqmAw8C3JjCXsdaNic5wMZmDmjt5CGvan682KqZA==
X-Received: by 2002:adf:8002:0:b0:206:de8:85c with SMTP id
 2-20020adf8002000000b002060de8085cmr12402942wrk.237.1650384812498; 
 Tue, 19 Apr 2022 09:13:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6c63000000b0020a94e82a3dsm5594944wrz.64.2022.04.19.09.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:13:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 18:11:30 +0200
Message-Id: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Untar internal bind so libtool patches will be applied on bind's
libtool. This will fix:
 - installation of some libraries such as libisccfg. Indeed, if libtool
   is not patched those libraries will be "relinked" and so not
   installed.
 - build failures with riscv and or1k:

  Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized

  Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized

Fixes:
 - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2
 - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202fb161c40e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index e6f4c419f4..f815c6c802 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -14,6 +14,13 @@ DHCP_CPE_ID_VENDOR = isc
 # internal bind does not support parallel builds.
 DHCP_MAKE = $(MAKE1)
 
+# untar internal bind so libtool patches will be applied on bind's libtool
+define DHCP_UNTAR_INTERNAL_BIND
+	$(TAR) xf $(@D)/bind/bind.tar.gz -C $(@D)/bind/
+endef
+
+DHCP_POST_EXTRACT_HOOKS = DHCP_UNTAR_INTERNAL_BIND
+
 # use libtool-enabled configure.ac
 define DHCP_LIBTOOL_AUTORECONF
 	cp $(@D)/configure.ac+lt $(@D)/configure.ac
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
