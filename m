Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52AEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:27:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F41060F22
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F41060F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AE3240659;
	Tue,  3 Aug 2021 22:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxnUfGfr23Bw; Tue,  3 Aug 2021 22:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D25D40628;
	Tue,  3 Aug 2021 22:26:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF1B1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D65640539
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3GN6evakkiR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB25E404DA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C4B185F62; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 20:16:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75496165dc5aa291941a995d43f65efeb35766f1
X-Git-Newrev: 085d20e5e684a83736897332a7ec9d3363ea3e51
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.0C4B185F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dhcp: add host-gawk
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=085d20e5e684a83736897332a7ec9d3363ea3e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

On hosts where gawk is not available, it is not possible to build the
package with server option (BR2_PACKAGE_DHCP_SERVER).
The build goes through without errors but the binaries are not created
and installed. The reason is that autotools cannot find gawk.

Fixes: Bug 13781

Reported-by: Kay Jeschonneck <kay.jeschonneck@airbus.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/dhcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 988c7792dc..8d7157f357 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -55,6 +55,7 @@ define DHCP_INSTALL_LIBS
 endef
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
+DHCP_DEPENDENCIES += host-gawk
 define DHCP_INSTALL_CTL_LIBS
 	$(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
