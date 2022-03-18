Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28815C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 20:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A66402F7;
	Fri, 18 Mar 2022 20:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFiWklv2_uQz; Fri, 18 Mar 2022 20:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C1140278;
	Fri, 18 Mar 2022 20:21:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD9091BF2C6
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA40260757
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aaJGnvD1CdJU for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C88C260758
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647634846;
 bh=NIoOzGL77+gQFgZ3+jz49hBzp42iC0atMCpI1ie4Ty4=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=PmfjD6TvC7egdzoqv7qoaMEyy6h6vzjMlM2FGnaS36lRKXU6UWyxKciEm4/dikDwQ
 ZM5mt9HY866QnUF+rkxkdK2UScQTDX+6ADJ4rn1+btp8kGRMrJ/Q5CILkGBTSAhivi
 UoEaOVRyZLIfoGY1Rpl5kJvqjT7xxjZ17tykLDwM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.106]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mo6qp-1nuAS51efr-00paoE for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 21:20:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 21:20:43 +0100
Message-Id: <20220318202044.10413-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318202044.10413-1-ps.report@gmx.net>
References: <20220318202044.10413-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:201z9WVtnExEIKIIstsxhUGPo+lO1B98FaMdtz+70vHfDreBGkw
 tvfxTC5WgeDPooO4NHW8mzT7eqGYeEpVtXO0d3RRCFg7wiFgXVrdlP5kr+Agvidm8Cxmw3O
 RkkHUmoD+ipDMaXqFgJXiXOX/UmQlKgpnw6Hqd4OIVBfmovIQozMyoLYJUFLMAUx4FPJQXA
 XgJxKDZyTGTRox+1QF7qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+uhp4kef1MA=:nLNIbRqgnuEoeQCvBZ77uT
 KqBTjeYW5ICM166blTS2RQIS7ji1n5bNVlxoopl+f1fWrjrS7CMPETPmjQmrGnAAGkoLqwYwV
 K8pfHZo0JFQ/lhdYKX/0pwGVehz35s8Vwg4UmUhnAG/GY/10HF8U6c/i5OR9gko4k2D5BOvXu
 xSKsmmgkG36AaiyIuxlyugeylWrSq3Wo6Jg5JvyoLOEo0/OXavhRA/3GkMFx7QzC4o8wEiV72
 sgGugDGXkHTKxYQe2rUbeN6JI0zo/3qNQfeCe7n+jkkWj9ClznTPj5P0HhmwCXysStfyIqZXi
 kTEzw3F0O5dnmp4Wu72uDKppUsj+0KmJFhXIM5z+zcaQ1FxAFaPLrUOR9xZpYhOXeKj9tC0Jh
 jzWMowLWUGR1o29/88RCQbu6P+WymJ8Qa3fQiix1t4qH6oSLuN559iN1OlYXxqOqfTt6IOmZc
 fyfPuCLi8zAAFeF/JJ/Mv7uh9RC5BDpBfUDf9dMVcM7OUcVcOLmuP8aBeoYuYmqjgcA9VZylR
 m2ZXg/mm19frf6vzElVr0ADlZUuJ5PB49LVmt/BkkSB9HH17ajByX2EXc4jgGKy/jzTH09B1M
 3piqged23x4RFUCf7ai4R9sLe5RqcvIU8D8cEn+AAhe3ZvbNWAN84B3vEhqhAdiJscOOBJZb6
 a4bTSLA9Tpyy9Px3Cj9UqFysweYANDyceg3hLOHWw6lmV7zowDwAsNFHFMfQhBdK3XInEprKe
 pl4MrPLdA0GeDTMBuKKZhIi5z1cgVW6q10o9phyeGV9RTJofQzGxWsy3Wg1nFqsu56clZpzEz
 CeyB1fT7cN2UyDsl80NrrMzVnOn7EOp1N7HEfW0vHCDqID7s7brezHPDY58uH/a9XtLbTezKE
 wX/hF3wRUn/Onb7zplkQcB5ljdxtqQOq8EUR9KjtRRF/xf4addAsdf0iWF77UCv9X0t+0+SWJ
 ChR9zzvj4DSAhe1PEhQs2Xeu12rWj1mxLDKtmeIgrl4eibiulg3J0VzsYlzJYt+VNCes3GU4d
 0M8PzByCXd2V/c3+mfseapbBRae9jf8AMhk6zJR8IfPQJvhGVYgxiIz4yxyqsJHOHKeRtcQyl
 SCxBWjmxds8Ip0=
Subject: [Buildroot] [PATCH v2 4/5] package/wget: add optional c-ares
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add optional c-ares dependency

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split out from original patch
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d0556e323c..69ca8f261c 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -63,6 +63,13 @@ else
 WGET_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+WGET_CONF_OPTS += --with-cares
+WGET_DEPENDENCIES += c-ares
+else
+WGET_CONF_OPTS += --without-cares
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 WGET_CONF_OPTS += --disable-pcre --enable-pcre2
 WGET_DEPENDENCIES += pcre2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
