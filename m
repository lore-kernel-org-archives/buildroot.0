Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCC7C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 016CE40FFE;
	Wed, 11 Jan 2023 19:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 016CE40FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0v8HTfeYH76p; Wed, 11 Jan 2023 19:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ABD940FF8;
	Wed, 11 Jan 2023 19:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ABD940FF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84CB81BF3ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C63F081F30
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C63F081F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IlsnvgmvmpAV for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D0B81F68
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D0B81F68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91CC68793D; Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:42:47 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4b0c6e11cf60dc5159058488a0f3471b36ad25cc
X-Git-Newrev: 35c47ed4d94c9cdb79c7dc8856808fd460b13945
X-Patchwork-Hint: ignore
Message-Id: <20230111194538.91CC68793D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wireshark: add
 libcap optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=35c47ed4d94c9cdb79c7dc8856808fd460b13945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

libcap is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/9250a69a9976617c735679aa5383e53802e5b43e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f70149c80cda5d2f6bbe2266b247d52818391cda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c1efef2280..d9314fb211 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -65,6 +65,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=ON
+WIRESHARK_DEPENDENCIES += libcap
+else
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=ON
 WIRESHARK_DEPENDENCIES += libkrb5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
