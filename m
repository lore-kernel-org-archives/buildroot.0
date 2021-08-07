Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216A3C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:15:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B196E61042
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B196E61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E4F8339C;
	Sat,  7 Aug 2021 19:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1cBQkkhh-yB; Sat,  7 Aug 2021 19:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F5B83342;
	Sat,  7 Aug 2021 19:15:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 786FA1BF3AB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 657B183342
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCX_uETzImvd for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 19:15:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic309-24.consmr.mail.ne1.yahoo.com
 (sonic309-24.consmr.mail.ne1.yahoo.com [66.163.184.150])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC455831F5
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1628363724; bh=RcuIijrS8gSkQ993CUOXY+VVc6XiGEEE/SgIEmtzs3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=B52Aj03ItWWQANMPk7YwbwjvwQG2jvAHPUmV/qeqHHqAJvXOIYIAYovTtFpPDW50zxNiRmx9rs4fU5IhaMxshkS+0GAzsL5QATOLrO+e7A163jTDqr2O8ZxemSeEi9a0irQRFyYPjf7Cyeb7eue1r+etgFDnRdrf7nk4OL4JRcs=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1628363724; bh=Y669nh/oJnJYuyuGsShtowF6i4HIBMzXOMI2WZgqhwL=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=hn0sCwhJBMLc4sn0GIEgUsbRY5E8o5iSCM5r4dKbla2oIC3T47xHHxwbmLiZbqS3qzSz4w9VPkt6/ow7BcUkcjAcwNaRaEFlr5XuwaJ7nFyjnruyvGm55Kh3rHXlxGHomoyv59dnifksdF6Gcm0mXrIA0QuuvhhdbUxE6zvqI0jgZuy5bwDKmTx2IT+7Irrac5ctsyzpks1m1h73ZhfeokohcHorkfRzA5DJIOe8fBt610kSQNTIusMtTCbXibUy2AgXgwnKG1KF0E7e63BAIyF/atVgn/5ph151PyRjucskXnR6aeE5gnoNuStT/TVtc3jG6Wf7ULra0YcAd+wWMg==
X-YMail-OSG: wLsh7NEVM1nVRZCN0lOdAnfRAGgcGi4h9sGh0faZ945rHFoyVQ9p0iYjsjg6bq5
 9x89OoUOsAP8kEfSm8vPATwEB2hO.T3Mjd.JUhyyYLG95ZYet5kwyTM5DRZiydCGdNNDHRCLkJ_w
 QvZZmaR7jpDAmTK8TYgYtX6v8EnJQBIKp7.SGZC2vIzOS3jl4ZJ0hil8yEfB4lyriE.JWHYocP3u
 90VW9CaKJLv4_DoqFF0ag3XQZpAgY1puXHWsiipK_j9mdL.CGLQyB9sxHTWdXvDwy1lVftFcNm3B
 4BSQYWf6Wgh1sVmjAF0BatNhQImraWG5uy8stvUPbgCvf1tehpO7J8mMP6Lwj1.N3aQIThZPoa.9
 00DgRBmcmkS2o6WScxn6PJ9t4w8l7zyD11S1X7N6tfHZvcDThk06gRlRqEiteS_KXp8ca7fv_xUL
 t2Lthd25FRoszTPY9OLw1l._qkq_X8u7ECzsJuyzi3.k7t07wnKBAOi5yKRHLbqIZQ1ptXluwRrn
 Bm18_qpz9LBMHM9PT.3qXJvy0QpnG65pKh.sdKGzbFQzhCiL.nmsjO2w9a9HNMXGYAzliT_VfAu3
 gDWuST2KJ.yN0RR1UGEjEZk9TI7JnSCWG7uK1eG4V7BvJQ8WRlO7pmYCtd5UjiCpZ6gOGzXq2oFD
 xVQdopgswT.0xbCG9MNwL1b0BwqAwo2j8HS6KC8Y.HS25zzh5.UIJzKTDRWG3bDVFJp.rnjTmdE1
 oq6vK2WsiTWxSZgrsacdfsMbDkaaFGiRA_eo92Tm8DYdMuVGruMll4tiziBHXT8NRmWRk4M3SV0j
 MZiCxXs0r4k6P5yxCsA9H7QLr4nu1FPS9zM6rrruRXD6GazZzE3KNSDY5MlNYX0i9XtKSncVTTsF
 i2rKQDUzgX2hmOyhfR1brpdWN3.85stPsGS2.9Sf8cjUuxgvh8vNwYh.PAR3_sGegr6JAvEJNMCW
 Q1.YN2Dy.EQ5vfhadKcVjZHuQnxTEkCbt1Xy8zYdcxU1UpQlbO9uS6xmZfosxvMmumPbYJQFtLns
 QXZcT8u79CF4GjU_BQeCfc4RsdjQm0McYRkqpO2EWAulsijtqQgVLh6jAwZLbeLap2rwRehBqYKU
 LQtlPSv5UdCu16SmJi0hr6E0mozstDyplhPwy2lXR_vq_MVD0hLf6DCe65YXNw23i3alNVrVTuZC
 nDsTHL94OD.uOdeOX7h6NTJFjCSLiyl0gpkm.8zAYxV50Vw7nMYFL7_mY2OG9VpbUegZJ1xPaLxi
 7B8Il9Zfa_B14x9WDfKY1_dD7Acz8GTv7JLrK3UvBtYmzjmtYLEfQ_MYp0V2Z0IAHKW1mVWb68Ni
 _uaeGf01wGpzGsgBiXr732t9GzdaNsNiwX5Uxh_NOp2h7zVLims_HVtbeknZOoQIlNrCQj52ofKR
 _poUsWL6rtnhkQhj_RcqLesqHwYh980W5F_gSZlNFCn7QRQzTjgPsWKoYuovxQiopkMXaG8iW_rV
 utdeyZAE_BM_UmC4e9fTDm7fcUcS.s5KHPMe.CQS5eODNJl_5EOQcBNhyUedLWhL2l2cRNrDj53D
 ISWwsDYLI12RgInreaQkWQXURg5XfCupETD0aQiAHtDO6thpRVcpFyaBojfq3630WbGhulJG0dDW
 hxwdQLLIX9x5F_KeLHgkDYTtS.RK_ZNaG0LiUNxP9XrNBvgtagilefI5Y01vc3hQVvVxMTAxppYA
 hugkWXSwc6NkOq91FBCas.b2xXUXztMY8ZJFMD6iJV2SXLH2TdVN3I7aA2oE3WGbTgXz2Iduu91P
 sVES6zB.GDTy4wwFimZLbzCS_RMvF52r8u2fRbMlX9bSrU_6xF3.IQxOqlHAlr.HWkRM.vxzB5eo
 uFVELhfMYBDOJ7AjR9g8IeVUIjN8O6ZLgLQOIX7Mzc0itWabhXu7wxXS2WieL2TnR46uOEKH_Qm3
 wJf4l9RReBPWXLzu_O0pFGO32sieWzvpz34m1qNO.TJEXuKlTEj2hSrmhawfv1abz19.kvgNLsCf
 Yxv6S2HTcbTidfRGUgC_qSLQ_0EL7oke4.fVCW0LGkemQjf41z_9FcJY25nPtexF4YZtdq49XUM4
 223prDayQybVXWwPsddIrUTlzYey0uUy2fb_58Fja8pTXwhs5lpHJnKLJhUUsMAruoXRta_tuUNq
 nb0aFiuAhVtoYAQLzM3gcRerMy93Il7Vftqyv2IcC2p0CU48mwos9PY9Zo..n3m9YIXRZ58Zcb.o
 49pG90qSAYRdx8Oxq.ui4AQdJe2GURwhBez8Fm1NVeJLGqihRx6DzJKxevNhkfIm03V8Bokwaoaa
 pSUOotRkDmzps8hzxqcRjM8FBPvAyATkKqAIfKb3nihhdOPT1JihIJoTQqKwrLbAk.pgw___Z97W
 QNdzj0_kg_6LGk5KzcsfwzNhv9wHoO36yI1BfEtE907AppBLtPDCr32Uz6FBpABFatOVGahXB1_G
 5Q0fOQR__jC2oQN6UlUCvW2dBjOPgndIq7IT.p8_XK.x9M9DEHvWbrAOkGbY-
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sat, 7 Aug 2021 19:15:24 +0000
Received: by kubenode542.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID dc630da0d41cd16354ecbe95fea41c65; 
 Sat, 07 Aug 2021 19:15:21 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: buildroot@busybox.net
Date: Sat,  7 Aug 2021 12:15:07 -0700
Message-Id: <20210807191507.700901-1-stilor@att.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724002628.2b736bc1@windsurf>
References: <20210724002628.2b736bc1@windsurf>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qemu: filter out long make options
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
Cc: Alexey Neyman <stilor@att.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since qemu started using ninja, they have the following fragment in the
Makefile:

MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
NINJAFLAGS = ... $(if $(MAKE.n), -n) ...

Buildroot's generated makefile in the O= directory invokes make in the
base buildroot with --no-print-directory. However, make's placement of
the --no-print-directory in MAKEFLAGS varies between the versions of
the host make; make 4.3 places that at the end while make 3.82 places
it at the beginning. As a result, if building on a system with an older
host make, qemu's makefile invokes `ninja -n` which does not generate
any outputs.

To reproduce, on a CentOS 7 machine or docker image:
  mkdir /tmp/br-build && cd /tmp/br-build
  make -C ~/buildroot pc_x86_64_bios_defconfig O=`pwd`
  make menuconfig # Switch to glibc, enable "QEMU" and "QEMU tools"
  make all # Build succeeds
  find target -name qemu-img # No binary has been built

Pick up the fix commited in Qemu upstream.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 .../0004-Makefile-ignore-long-options.patch   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/qemu/0004-Makefile-ignore-long-options.patch

diff --git a/package/qemu/0004-Makefile-ignore-long-options.patch b/package/qemu/0004-Makefile-ignore-long-options.patch
new file mode 100644
index 0000000000..2d14b70c03
--- /dev/null
+++ b/package/qemu/0004-Makefile-ignore-long-options.patch
@@ -0,0 +1,41 @@
+From 14833e24dea49303ebc2464813601054b6cdfcac Mon Sep 17 00:00:00 2001
+From: Alexey Neyman <stilor@att.net>
+Date: Wed, 21 Jul 2021 19:08:46 -0700
+Subject: [PATCH] Makefile: ignore long options
+
+When searching for options like -n in MAKEFLAGS, current code may result
+in a false positive match when make is invoked with long options like
+--no-print-directory. This has been observed with certain versions of
+host make (e.g. 3.82) while building the Qemu package in buildroot.
+
+Filter out such long options before searching for one-character options.
+
+Signed-off-by: Alexey Neyman <stilor@att.net>
+Message-Id: <20210722020846.3678817-1-stilor@att.net>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+---
+ Makefile | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6c36330eef..401c623a65 100644
+--- a/Makefile
++++ b/Makefile
+@@ -129,9 +129,11 @@ endif
+ # 4. Rules to bridge to other makefiles
+ 
+ ifneq ($(NINJA),)
+-MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
+-MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
+-MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
++# Filter out long options to avoid flags like --no-print-directory which
++# may result in false positive match for MAKE.n
++MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
++MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
++MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+ MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
+ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
+         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
+-- 
+2.27.0
+
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
