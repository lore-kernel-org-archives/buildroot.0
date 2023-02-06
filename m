Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D49BC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB0460AF0;
	Mon,  6 Feb 2023 13:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB0460AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwteyCeI4WJ9; Mon,  6 Feb 2023 13:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585B360AEE;
	Mon,  6 Feb 2023 13:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585B360AEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 486A21BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F5B081214
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5B081214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kumbG2OuXZHD for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:39:00 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEEA28138D
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEEA28138D
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:38:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id P1b4p8VuPUpapP1b4pXKwu; Mon, 06 Feb 2023 14:31:50 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 14:31:49 +0100
Message-Id: <20230206133149.910237-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOhH7tubmHCWbcSf2D6ykpKGMLncUho/Z4NsOEXMvQ6pADvEKRUdknzzBQHZRqEkKTjEG92EEznTd7FKJ6dXFdoplrtXtilBK0y4K6R7MkRYVhC7/rJQ
 YvkReO550LQbl7zltwycP6up7k+ekoq43hypnuFjErr7u2CHjMTaEXpFer/PLikFiuHHEz0lGDR6+QXpSx8C0lbdDsV1ww9N7zcg85exD5ATTXzsGeLrOlMk
 YyjyZs9+WPEaLuK6vBCzk2vk9MvkfAi4yrW2XLODZ3RnVliIlBX5g9G7+vd2M8ZBY9VD6Te8xTj8RQPmYX9yblxRKbIlN2IJsKMTmFZicOQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675690310; bh=3Xju0fw2rBPwp/peX7cw7O+kA2RD1LifxPaF7uMj3b0=;
 h=From:To:Subject:Date:MIME-Version;
 b=mfQROx0MofB8cX4HlrNSqm+ZAlKkAiWZTSWQdWQiYAjehH8ZKadNQeg2kv9+L7b9Y
 83lQLSRTRaILZ/vVaIMoAitPncpZjRhf+0prUfFTxhMH5L3549iwtKKygXGTMhmvNq
 O868bcWy8bncPI4NtypuAlAWsPbPqDLrCfYP3tTmnPf9H2QIB2DZzdBnFzfcjB+UFj
 A2e1KS2+4CYznJ6lKSruvQZ+sPeP1vhwYEUzr7V9ARx2Rz741lwFPXPNg3Yy5c/O/D
 Fdb0DVPNQmNtjEn5ZNAyOu5Dp5DSUO2NIdSuhRHtizzGky12ZcLY/iN4p8aGRCA3Cr
 X9NgiQzsCIeJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mfQROx0M
Subject: [Buildroot] [PATCH] package/rtl8192eu: disable package for s390x
 architecture
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/9987dfc041c7cc3327b73b8d97e8d482b20555e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8192eu/Config.in b/package/rtl8192eu/Config.in
index 4d71b711c3..969ba090ce 100644
--- a/package/rtl8192eu/Config.in
+++ b/package/rtl8192eu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8192EU
 	bool "rtl8192eu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8192EU USB Wi-Fi adapter.
@@ -10,4 +11,5 @@ config BR2_PACKAGE_RTL8192EU
 	  https://github.com/clnhub/rtl8192eu-linux
 
 comment "rtl8192eu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
