Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAADC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1497160EE7
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1497160EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC8D401B1;
	Sat, 11 Sep 2021 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xuWc-j1_bRB; Sat, 11 Sep 2021 20:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5777A403A1;
	Sat, 11 Sep 2021 20:43:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE5531BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD1080D05
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aF4tBZQgwpnQ for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EAB280B9F
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C7F389156; Sat, 11 Sep 2021 20:42:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:33:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 429e247b869027f6ecd4efa0f31bccd2765e3875
X-Git-Newrev: e7e362332436dda6adc65266366ad89c540c4d80
X-Patchwork-Hint: ignore
Message-Id: <20210911204216.5C7F389156@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: explicit audit option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7e362332436dda6adc65266366ad89c540c4d80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for Linux audit has existed [1] since a v4.15 release; manage
the configuration option explicitly.

[1]: https://github.com/rpm-software-management/rpm/commit/ad16a04b6e41612cdef6ab8755ad31c8b880a9fd

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 816deceff7..e9d2adf690 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -38,6 +38,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+RPM_DEPENDENCIES += audit
+RPM_CONF_OPTS += --with-audit
+else
+RPM_CONF_OPTS += --without-audit
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
 RPM_CONF_OPTS += --enable-plugins
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
