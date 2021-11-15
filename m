Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1F7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 13:30:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192F263212
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 13:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 192F263212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF713403A5;
	Mon, 15 Nov 2021 13:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JYetHjdb5XO; Mon, 15 Nov 2021 13:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C141440177;
	Mon, 15 Nov 2021 13:30:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42F8A1BF97E
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 13:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D02E40177
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 13:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kbf1KpaNK6Jo for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 13:30:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE3E0400E8
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 13:30:03 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2D49560010;
 Mon, 15 Nov 2021 13:30:01 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 14:30:00 +0100
Message-Id: <20211115133000.72041-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115133000.72041-1-kory.maincent@bootlin.com>
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support to three configure options:
--disable-startup-msg: Disable text banner output on startup
--disable-progress-bar: Disable progress bar
--enable-img-fullscreen: Enable the logo image in fullscreen mode

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/psplash/.Config.in.swp | Bin 0 -> 12288 bytes
 package/psplash/Config.in      |  15 +++++++++++++++
 package/psplash/psplash.mk     |  12 ++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/psplash/.Config.in.swp

diff --git a/package/psplash/.Config.in.swp b/package/psplash/.Config.in.swp
new file mode 100644
index 0000000000000000000000000000000000000000..e484556922e96c824ecda0725e674bc8223d8d00
GIT binary patch
literal 12288
zcmeHNO>Y}T7@lwd0<<8wfso$15&=Z*e6$dy0?7?d8j%kZ$G`z(jdy45Np@#eJF{`z
z14tlo;{yDMN_?G=KwLQS4>%!}18_hH^(T~PcGp%KHR+jZ96j01?mO?t^L{8%-v0bM
z8(XwoUtst=#n^AJea>%w_r}a4Uz}$LIvcyk_xtp78Ha^}vn4-t3L9yr_eEe$BOEKO
zdi+poB?Hqav}9V_M#_T&J`j!6q%k+c#;R749Mq*cTfKkl8So68#z1bPOUvij(&ECr
z6S-KsK+ingJx$s__Y8OjJOiEq&wyvZGvFEU40r|}Kn83&!#+Y>4^^=(SJ#;n*Xl=q
z@eFtdJOiEq&wyvZGvFEU40r}S1D*lTfM?);$N&!+yZtC*|IEU9{QrOQ_y1o{GWIL*
z6YxE719%;{bDpuEfiD592(b5n=YVH{Tjv<N348*43>*O+U=dgV?mWTR@4zkK7vO8)
zD<B6f@B#2Xa22=+JP-W)IAh-e-vFNi`#=a>29|(X;P1y6`vdq9_yPC~NP&IeDzE}v
z29|(_0T=6^E?)of40r}S1D*lTfM>un@Srj<8<t-p6)H5O6<xTtyV&b?TD^ByuQzvD
zpp!%>OSNj{l9Uh-<YcvugCUoSMhzO_E~_yHB{IUVUPNz7!~3xyI~0^~g{93xjgE>Z
z*z_D^!WioFtj=bKB2L+C9~!9^RtJxZ)Zm6&^d#q7ySe&SbG_ATciNlH&h_5*POrVY
zv%cHvbb8m|@m<!%k%bMVL`FKdX>MJJ#`4VO=_!V*x0Jv?xP3p{oxSGnUbo%b>Z}*0
zTWT8jgff{x4}qyDk7E;LLMTdfC{8$#8*x(NOyg_a&COnCb+^^pE-Y^fOVW}^QadIY
z(OBm+;>exVbRa}pGGA`aQYa#x$2j18gCj&;nCFy=%xJ}9c|(MhszE709I3(rE|sUJ
zjvJdv$V`i)&~~QN8(YX7V{q>txh%pMTAQvk8UtzTV;xvsZ3WkLHfRKRT70YHZn_0r
z93!gezBJ0D6;yk>yRlbufxS$7B1@#=cv{J<-1`V}NRiek%IYAh7>mZ^Ni9&VdP}^o
z525W?8K0tZQkrySzS7x2nvNfI>A5oRh!4<cD`hH>lv1JVzZ_f8++rD;M$!%^F_du@
zsY|sn65Up(ZEeNMM1oLi2-<b)+Q!<BtH6d$QiPZ}D;?JcMNxzqAGtijt-y6<VP<Yp
zzL(SsbFKgc&*Cv|3htzWmZbCw0Ze2~9t@|&GL7<>aN%z=HX7apaUP<|q;qgCh$X_G
zBNs4NA>~%a5`_#iWZYa)gVL~ph#LlZRy10Fj0QI{Aft0INSH)wAWUJWd{Go7Y(S}X
z^T6FeD2%~Orfm^Joi?nYLuqmzQ>^uYBPhyvBKmn0iOjvnAw!WEp?BQ06e^I=@Zx@M
zEXA@Pyz~m0JWX|GjXRxSHi9pa^hM~x+>|Om!r4O!jwh0ibxsSf_S2LQ=+Yu?+~Ibo
wSa2`7!C=S?R^J5;GM)}m4Ds=9q-vxTX)Q-->0vR??;hvXkgd{nR;RN60O4Ltxc~qF

literal 0
HcmV?d00001

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index da99b264e0..e79e9e85c4 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -35,6 +35,21 @@ config BR2_PACKAGE_PSPLASH_IMAGE
 	  Use a personalized png image as boot splash.
 	  Let it empty if you want to keep the psplash default image.
 
+config BR2_PACKAGE_PSPLASH_FULL_SCREEN
+	bool "use fullscreen mode"
+	help
+	  Enable the psplash image in fullscreen mode.
+
+config BR2_PACKAGE_PSPLASH_NO_STARTUP_MSG
+	bool "disable startup message"
+	help
+	  Disable text banner output on startup.
+
+config BR2_PACKAGE_PSPLASH_NO_PROGRESS_BAR
+	bool "disable progress bar"
+	help
+	  Disable the management of the progress bar.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 5e61f2392f..a7d36697a6 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -18,6 +18,18 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
+PSPLASH_CONF_OPTS += --enable-img-fullscreen
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_NO_STARTUP_MSG),y)
+PSPLASH_CONF_OPTS += --disable-startup-msg
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_NO_PROGRESS_BAR),y)
+PSPLASH_CONF_OPTS += --disable-progress-bar
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
