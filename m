Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF115C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:28:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5924E60F6C
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5924E60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C54340389;
	Fri, 27 Aug 2021 21:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAHIJWjs0kZO; Fri, 27 Aug 2021 21:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5042403CC;
	Fri, 27 Aug 2021 21:28:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11E3A1BF384
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014C140389
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NkUMxhD18nUE for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:28:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC81D40637
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CD4988EA77; Fri, 27 Aug 2021 21:27:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 23:26:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 61730de4c0a83e7309bfd766df58c14410a543b3
X-Git-Newrev: e1ddac352de6c86511a1a27efd8e79495519bcd8
X-Patchwork-Hint: ignore
Message-Id: <20210827212717.CD4988EA77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: add systemd
 service for telnetd
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e1ddac352de6c86511a1a27efd8e79495519bcd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Sam Voss <sam.voss@collins.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr:
  - introduce BUSYBOX_INSTALL_TELNET_SERVICE
  - move _INSTALL_INIT_SYSTEMD alphabetically between openrc and sysv
  - drop the comment about Type=simple  (Arnout)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk      | 10 ++++++++++
 package/busybox/telnetd.service | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4b1fbade1d..560c4fe7b6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -332,6 +332,12 @@ define BUSYBOX_INSTALL_TELNET_SCRIPT
 			$(TARGET_DIR)/etc/init.d/S50telnet ; \
 	fi
 endef
+define BUSYBOX_INSTALL_TELNET_SERVICE
+	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
+		$(INSTALL) -D -m 0644 package/busybox/telnetd.service \
+			$(TARGET_DIR)/usr/lib/systemd/system/telnetd.service ; \
+	fi
+endef
 
 # Add /bin/{a,hu}sh to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
@@ -384,6 +390,10 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
 
+define BUSYBOX_INSTALL_INIT_SYSTEMD
+	$(BUSYBOX_INSTALL_TELNET_SERVICE)
+endef
+
 define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
diff --git a/package/busybox/telnetd.service b/package/busybox/telnetd.service
new file mode 100644
index 0000000000..8a640b761f
--- /dev/null
+++ b/package/busybox/telnetd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Telnetd Service
+After=network.target
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/telnetd -F
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
