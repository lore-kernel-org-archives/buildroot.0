Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE9DC282C5
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF7981E80;
	Mon,  3 Mar 2025 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKKfOhTMhhG8; Mon,  3 Mar 2025 12:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93CB2821B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93CB2821B1;
	Mon,  3 Mar 2025 12:15:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B054C1
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7960581E80
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 12:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-4mxq_56DTK for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 12:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 058BC81E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058BC81E7F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 058BC81E7F
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 12:15:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.139]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1u06Gb1TiK-004YaX; Mon, 03
 Mar 2025 13:15:17 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  3 Mar 2025 13:14:49 +0100
Message-ID: <20250303121450.140083-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:vMQmb7zkbC/ROJ8RxUKQJ9/halWQPtO95ZOkuzSm7M64phCFehU
 3vw5bSmhHpoNk5DeeKlxtcbMgWPLp2prngzkQL0i9Xmu5weA+JV139Mq079gizWDUipJ4ft
 vRdI/xYTehNDfqMvGz5vwd55VTI+cI8ZMk8MFiEy3CgZ8ZzX4quKIzLjsBPiQbXpBtq3msH
 71wLq6XXAbvpbpMBr8JSA==
UI-OutboundReport: notjunk:1;M01:P0:AOKeRHvSgkY=;pC/RtGq/kdQXLQMzoudhWAwO+Kw
 qH+gKCr7qG6CmcRBhh/BBXGmDmjr26bTF/4/qR/Gc7za7NGjB3kDxqbgQcEGMenncQgrYt2+P
 SlgN3hWzERVq1cj5XsWfKcNk1ctpvRkREV5sPFITcBozoFiMAuCXIymvNXbf0F1K1vXNB+4JC
 o9PM/7lN7D7UOwHjuJu5xWkhLKMH9m+Zk+YpbMc9OdOSxvrq6JC5TPfwlAL5oSL8KnKJOq/HD
 yhziFTwxfIK/wHlIr6LSHWr8F4n44WkUpg8kQO2hmMR2ow12ffZATA8B4quLj6pHufcbxTquY
 yK6MNaq9ORHq2B+JDl4Ym0BhOO2XQquUnuALZCTMPQ4S5A3qRh4Ihc/Z9rue7UJXZvVIgWrhf
 d6VrRrbT+m7lpEYg3CFt9zXxKPkI8qiDiVFROFDsw8CKsOEuLnb4mECVp41SSwXbkomfkVHLh
 49kj090LETVTl2xKpBxEXAo7cjttR743D5pUG92BO9mEGso6quRKZdgqmhWcufLGn86NxTqvH
 DZUFCzJ0VmNZuPe69SriuLdYRMmqP6AKF/Ty5h/EKLcpQptH0mPiyNqbil/iOkFMkwMWlbpsm
 v6YikqVKrj7QFQv1UQ2Klw+/lw3FftTQE7t/Fi2zxWmTn2moPn0/uttgCdqNCps8Ueg1vQvH2
 1OcirbA/A+w/GIWmE2EyeOZzj3IVuSfcTkSfDvy75FC52zG6hKUrGLCfbeaHoAXsW9Y1tF+aX
 B/LnJTIe6lEREw6OpsOwkmpwe55/NzAWDCF1uITUbHx7O6+iuE2RqQK10KBiMHplX2MmIGs8h
 XVwneD7Z/bBCjgUo+vxqDwRbHRNS0pvZnOroP4h5rBSJ80ibTiZKTfN1cvTtmQnTH/OFo8g0y
 jemJw77N0yeE+dUvzxWzXamUVk1rEc5B2yzyeGEYlpeXYqyANGky20mW6SLdl5SglWn3QdOmM
 z/id2QslCbu5ryh46U0zmApX21FoZVg9z6KvLd6Uyqbco8TX9PjiG2qCbOSas4vWsvc2KBrdv
 afMw0LVIjLt9yfe6U1oMnhSFYtAx4870lpllAdLBjiyT0fOs9zt39xVzyQJq1rxC5lvhXFyXO
 wYcWprjswQKqHNFyecCR+gmIwAIsyCcAsqMzmStWE0tmP7WkZv02mDgrNP7l6EGzvZtWiNHui
 wyGx7ItWl3Q9xPO1Q9qe1MeCrDzlMf3l7fPPMwnuaK6YsJisp5VkyRLzzE8Owo/cKhlBw1Z2B
 0Ctub+fmoMmwJ4J7IYWubVXM2Oy1SnvKQLbNYR8w0tNbfPOJQ9Vjq2dTWjQvU0r2z29t9Qs0z
 jVYOy7GPQiis356RVyUlB32Orh6F4pjfey7gLEtZi6zaEeVRL7lGsusiK5ITw+b3mm6eTHH6V
 LhdbuRmPCCsbHnm4fpjtgFqwZ3HbIRL8EE1BPYL8sCWCZpya51o7oVKCbUArAp9O+Is6tyMc7
 2/pFx7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741004117; x=1741608917; i=fiona.klute@gmx.de;
 bh=bAMOfd9+5x1Pv2DWCXCzhum6WRMSnFBXFNFV6KlyrxM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UvnkqSbMkpC+okgj21us4UqQCDKJzRyYesq9hNgbRJn6Sy1N6EGdX83vByPPFrxA
 Foo0UJq15tC6HUWl9/vvd3ugo4h+KfR7lYfaC9KL/25nrH49XfUTkiMP6VET/lWom
 B0EGZSZoIBjoQUGAJ7IoaPhD2IT8z2KR1RRAsFVoCbm/e37kI+zg7BEmM1aiiReAV
 f5GBN4ZR5P+hXb3QMAt7j6LSJ/xVJgHORwbnAOP+WihRaw+9/gDNEkiY/SwCfF9WM
 4O8y2FOM7j4AtuXCpRUqKzpR2M24s1BkICsw6EFLcfv9T2+E1w1TeVLJYB3nHIj+R
 UyBUg+2maIvZxjyehw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UvnkqSbM
Subject: [Buildroot] [PATCH 1/1] package/busybox: save shell history only on
 exit
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Both busybox.config and busybox-minimal.config set
CONFIG_FEATURE_EDITING_SAVEHISTORY=y. This causes the Busybox shell to
write the history file after every command, which can be a problem on
storage with limited write cycles (e.g. eMMC).

Set CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y to change behavior to write
the history file only on exit, which reduces writes without losing the
history feature.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Of course writes would be reduced even more by disabling history
entirely, but "save on exit" seems like a reasonable tradeoff to
me. It is also what Bash does, so it's unlikely to cause issues.

 package/busybox/busybox-minimal.config | 2 +-
 package/busybox/busybox.config         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 9733dd2156..1e4b404479 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -105,7 +105,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024
 CONFIG_FEATURE_EDITING_VI=y
 CONFIG_FEATURE_EDITING_HISTORY=999
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
+CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y
 CONFIG_FEATURE_REVERSE_SEARCH=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 # CONFIG_FEATURE_USERNAME_COMPLETION is not set
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 69d896bebd..823fcd2b46 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -108,7 +108,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024
 CONFIG_FEATURE_EDITING_VI=y
 CONFIG_FEATURE_EDITING_HISTORY=999
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
+CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y
 CONFIG_FEATURE_REVERSE_SEARCH=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 # CONFIG_FEATURE_USERNAME_COMPLETION is not set
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
