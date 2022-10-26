Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D164C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CCC94051C;
	Wed, 26 Oct 2022 13:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CCC94051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5VgnhO4yP-N; Wed, 26 Oct 2022 13:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 530A5404B4;
	Wed, 26 Oct 2022 13:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530A5404B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7BF1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34560404B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34560404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jmgqPxwAl91 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E9040407
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9E9040407
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQZoqm7T; Wed, 26 Oct 2022 15:26:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:30 +0200
Message-Id: <20221026132634.999254-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFwOTO0ZufGOmWconwvkkbN9DkS9uuoBzF1qXC1LO6dMHzhwco0m33CHjFix/lgTTbW5WqxgUjJ338c8jeuHqugdjqCij/tjecu7hmtTr3WDpoohVX3r
 GADRlGxgK2OYT8H9kxVoZ45mDvk8Euf5ge1RhyixDZvxmht8A8WvT/Zr31fMvOljpuBIA3oX/Sa4+KIgBBzaE3yPVbEwvPv1IA9C6kiAP4w62pITDzGz9qpA
 /ffbAqOTh09ArLcOA7Q+YG/ZhFvi6DZVbGHhXNGj8AJoKR+BiwAPj7yZ73TM4TNx3NqXKgnIQiZaZNDeX/+m74b0kpO/0jkp5/vBFDxiQZbkhvXnP/PkOCCc
 AS9ytda3moi8Bu4kxVCo453kGRRfLtMc6fyPCUDNioK0wtL7f207kgaP6DQi8eY4fs9Qd12kl7n5UDt3Vakyr3fzTuUsM1iTWwB3td+hTLYLkYFFjN8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790800; bh=oQhF/N28GlQxymaehz/mCivaEGpPnRvcrTsK0YDKzVg=;
 h=From:To:Subject:Date:MIME-Version;
 b=CHyN5WjlOGXfn4ibNpOb55TM4ZH69cxxi9LruXL9EcKG86FRhf4JwH6k9rHr84sKZ
 6X+u0L1qRoT66FN0vax2F2EsMtf3xPut00iTkcYAHcOVfct197sUJ6ch1YAJwetBwA
 avIHj3TsdmboEme6z33Nd7ul7S7n6MffjMQAeiUmjs0FoxLhU0LnA47kLmltt/89FL
 qYgCLPaLSG/NtiYDXg3F0kGnMDE64AuSFVe5dOu+xZXW5bVpIs6wmQDg08wRIVUD1j
 1umlQRe9G47HQ0v8FKCnjp0FN9JtT/dB40MXkPc82zQow2b47CGYfTnFQbRGNRI6iy
 pdR8ZLsCsrZyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CHyN5Wjl
Subject: [Buildroot] [PATCH 3/7] package/rtl8723bu: disable package for
 s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
index 266a794a7d..7c624fc4d4 100644
--- a/package/rtl8723bu/Config.in
+++ b/package/rtl8723bu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8723BU
 	bool "rtl8723bu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8723bu wifi driver
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8723BU
 	  https://github.com/lwfinger/rtl8723bu
 
 comment "rtl8723bu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
