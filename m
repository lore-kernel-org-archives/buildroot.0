Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EA3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61FD8409E3;
	Fri, 22 Jul 2022 07:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61FD8409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Th0WgJ335p2w; Fri, 22 Jul 2022 07:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6324140A2A;
	Fri, 22 Jul 2022 07:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6324140A2A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAB061BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3586F847D2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3586F847D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7g880O0FG09 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714E484020
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714E484020
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 647608414C; Fri, 22 Jul 2022 06:55:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:05:25 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: dfe7913b41848beb999605a3dbc1e9111dc53245
X-Git-Newrev: 45e044076df009dc5cbe76dedff0837c823aa2d9
X-Patchwork-Hint: ignore
Message-Id: <20220722065519.647608414C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/tcpreplay:
 replace TCPREPLAY_CPE_ID_VENDOR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45e044076df009dc5cbe76dedff0837c823aa2d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

tcpreplay has been replaced by broadcom since April 2022:

<cpe-item name="cpe:/a:tcpreplay:tcpreplay:4.3.1" deprecated="true" deprecation_date="2022-04-02T03:29:17.303Z">
    <title xml:lang="en-US">tcpreplay 4.3.1</title>
      <reference href="http://tcpreplay.synfin.net/wiki/Download">Vendor</reference>
      <reference href="https://sourceforge.net/projects/tcpreplay/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:tcpreplay:tcpreplay:4.3.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:broadcom:tcpreplay:4.3.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abroadcom%3Atcpreplay

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 77bf0a1e630da4d9c597cd92c9f2c49b6738da31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index ef65403974..9f2da6439b 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -9,7 +9,7 @@ TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPRE
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-TCPREPLAY_CPE_ID_VENDOR = tcpreplay
+TCPREPLAY_CPE_ID_VENDOR = broadcom
 TCPREPLAY_CONF_ENV = \
 	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
