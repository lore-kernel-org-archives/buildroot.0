Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FA3C77B7F
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 18:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0ABF41D28;
	Wed,  3 May 2023 18:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0ABF41D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pBmZGUAOLm4; Wed,  3 May 2023 18:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EC3041D2C;
	Wed,  3 May 2023 18:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EC3041D2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE741BF334
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1BE283C70
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1BE283C70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cuy6nwdnPlUX for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 18:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D43C821B5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D43C821B5
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:51:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1qb0rl0sSS-00pu4O; Wed, 03
 May 2023 20:51:45 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 20:51:43 +0200
Message-Id: <20230503185144.13679-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:s+nYgXBpuhx0OkZESc6H/ZrodxbcguEuMctlIfkEoKL/hAE/iSl
 RT68F8SIALe1STUeyYC9chXKUt60kpZi2w5CD84SiwOCKF0lZSV51td7HLfLGbEUWfALf7m
 ok6GJ8rROeLlRzKl8V4yIyiAsjSpYyJzCixS/A8KioK2HcnNzgyUgwMx9/e6+ckxOPLsRLb
 yCF6sWV6doWcl34KQ3eHA==
UI-OutboundReport: notjunk:1;M01:P0:QtVNR5MtmII=;lKv4RmjCyeXg53ozxKRpYRKTsxV
 hpQBcsp2+jZOfXlTNvXKGqFJb7mesKW5BJ8cuzVRzUoHvez7sRa3jDQ7DS0hqWJYuCI82XQPa
 0s/rNKucu7JKzOTxSZLg/vT9PLRVPTEq8xP5KH0KwOo4cw2VpT+1CEi4WitnbIcXZhGoFjwGM
 RvrK8c2EK8g7o41ArYEp2ys+0Zr/fcidqY+tjjvceG5Ne7Ih0RBYyJZGVi0r1SBrl8zNk0WCk
 2nqvGPpNIALimvz8PrO2qxLfIXpWW1xEyJmnxbC9VAoqqa1pHyyxXiTdPweZbFJBoJePsFFcK
 rfKQcROqP0VHWPmL3GsekwXH+fXjK07YU8udvMmlKfS40UStd5IKP1/KziBJLH97Qzo0pJncw
 2XeKaVUk66fhCAsv1aolHai5xXRX6k4mNRWI0Em4b20vT35motwIcffSZysjuvp92xzZNBIzO
 6wJI3pN/usoefkBWwE7A+Fvip+yscdxeS6prsbq4eEB4Ml1mUqQwHsSRv88XSla8ogA5vT0vO
 MmAlK/tD72yOJGvHyF7qBIWtf9133qs0z/OSZjDwX6tgRlY28iHNqINNzY27AQfWismZpTXaU
 BJM5Lx5kFjpMZwSk/9+uRpeQIv+vpP7t6lgz1Ayc1BonuJcCuPnjgJfu8hyjZkuV5DTyAewEk
 1Pn50NTAiPDnfImsPm0JklLW3UBudGsqWtBzZ7/j1hDt4CICdLuOyMr42Ptq6usb7SoCh2i0F
 HCJHAl7AHdsSHgo963quHU/sPIVSY0jx9lmiZ1dnlGWdnZ+NmLAAIGcMxUTVn1U29XztkUTNl
 5XWqnYU5yhKIkBGXf02VqsNs6sO9ZW72m04UB4Xz0ft6i5x+nq64oovfBe3NAQtvgqNiGQxat
 ccEB/xYOdtjCBCDXzm46T0z+9wS6uzHuiKl8vkE5KCpWYwS4HnSqRykdm6ZgO5sC7SuEYSfBa
 d2n9vKwAyQgrrmlx5F9g4KRdvrQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683139905; i=ps.report@gmx.net;
 bh=xcbc4pEuetJ9ETxuP+NorKy6C5nsjHVSXbRS9VqE7jA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BgJThNLWU8fpXUpEoKqrhSRHvxRCHTTgp3xFGhcYUNMG5YfzyZ8rOYK6Jw6WDBRsH
 1MVSZtTJ0Q7dm9G8LzyBdOvsuajUubjadWIro76K4OtTHnyDcEarqHbIRvSSrzO/LW
 2TkROu+/4tIJJ7ANEC2DJHyobK1QuTVxFyFGR3Dht02IGPgOLB4QIkdVPxNnnNrYmA
 tZlFWuTsulBQVD86fB5x9x+NObuM6lSpBSkq5l/WKmqDJzv9CPmnI0U1fwzf5PlxfI
 7RJ/gHzDxsirJ5e+/V1h96CVkrSXM5mIzOv61ul/bxlva03ZHh3JGjL0CH+wtcxLTo
 rfLRV8laifOGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=BgJThNLW
Subject: [Buildroot] [PATCH v1 1/2] package/coreutils: fix cross-compile
 (add gl_cv_macro_MB_CUR_MAX_good=yes)
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add 'gl_cv_macro_MB_CUR_MAX_good=yes' to COREUTILS_CONF_ENV to fix
  cross-compile failure since bump to 9.3

Fixes:

  checking whether MB_CUR_MAX is correct... configure: error: in '.../build/coreutils-9.3':
  configure: error: cannot run test program while cross compiling
  See 'config.log' for more details

Reported-by: Christian Stewart <christian@aperture.us>
Link: https://lore.kernel.org/buildroot/CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com/
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/coreutils/coreutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 2c12e8ef2f..cf42a8aff8 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -51,6 +51,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_func_tzset_clobber=no \
 	gl_cv_func_working_mkstemp=yes \
 	gl_cv_func_working_utimes=yes \
+	gl_cv_macro_MB_CUR_MAX_good=yes \
 	gl_getline_needs_run_time_check=no \
 	gl_cv_have_proc_uptime=yes \
 	utils_cv_localtime_cache=no \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
