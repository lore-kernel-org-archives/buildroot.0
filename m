Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9655CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991B26067F;
	Sat,  3 Oct 2026 16:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VC-L7v3DeVZz; Sat,  3 Oct 2026 16:45:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 961F9606C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045950;
	b=gqeXlqvfCGcYKMhEUsmLnl/FoX+Zz5oQ/E/723ApeS2enUGSUwUgoa6t+nPtR4qdcpR9
	 nraoAQbPPSyb9DKWM2U/4uzbeeHemGx1nExT8im7faRC86CH8kJ7CB+YiUd2UPtdYND4j
	 GMSsYRRy+6KWSP8MT++PiOoUPc3KEpUuHVOW5TWqqppYN10t1mgWykbbwEQqqr+GPSjqg
	 n3NEIdPLGOv1+FnI36bgmCanOJIg/V03mJaBb/sLnU+0OYTC5xtOPis38vRmLRf/Gxbv8
	 P90mTRsZGAkaQnV+DuaJpBQSVYVxR3RZo97h9Esd7YZ7hCjLPP4dWZkY4DsNEsnpqLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/BAXF/YpdfcVzINWp8nk7Lj8wnNeS0WCJRJ8ZShPegk=;
	b=d+nz98uin0/lpFlNNMj06KV2lI9VG4YurWPTf27efc0jMvXqIfTPenYZtQm7yMv/EhcJ
	 P49Qe/G02bsYMpHa3ZBy0dd/02BG0wWHi4pI/VyUCLk/BUXz79q7GlI9r90iJIaMBU0I7
	 ASPBoRJdYMSehVm0eaYGXmona2tUw1E5zNH7LYNbgveBKCBk/qomqpUvOxosz1hte0mGM
	 LWb0S8zXVTfswihQ28WJ35rLnlmMcWzMg4WqEjrU/wVOQZbMM/KQ1mUo0/NuWbQIiXF6D
	 9br285kKg58OL9/ayRbH+uCXUrcOrbVDIgZDRMS87Lg+84ydrwV7in2LUxQ8XmpLc2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045950;
	bh=/BAXF/YpdfcVzINWp8nk7Lj8wnNeS0WCJRJ8ZShPegk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RuYNdgk+H3BvZBKa9YE2NuJ/eJccTHjLozaw9WSP83oO6v9soAc5UbC6NU7NjVG7o
	 RsWl0ybIcTBnaUnhxzfFNdiLyeytYc/mLLH1tvs6zvCB/q3TwALH4b1NKFXQwubyD3
	 oiICL4wYGQ36EChJ8GDkaRsbTaenq94D84sneRYFHrBSF7b5FMERxgLrSFHvTOWLS1
	 ngcKlFwhPA2JcaAJ0OgkatRLviTzGyeL8LYUlWjEOwTf9+XPhlpF5T2ThKMlw1H9WM
	 VP4frAg2Xn8M72H5k4PTSVPYns2n9tIDrxAvAnpSZ/nqKepa3A6ZEx+3Ja10FcFGYw
	 IYhMkQ+3kNLtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 961F9606C9;
	Sat,  3 Oct 2026 16:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD7F31D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEFEA40E62
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHikbxp4p-95 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:45:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 44DA340E60
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045947;
 b=hYfIOjCawV/zrs1y/k5yR5+csONKrdFJRoa5tW/+rV4k+HSY6R6shdirwBE6E011cOQm
 4vEU/PkoT50yQ4CLL15XPnx6rS/hOloQlcGOaR11YAkRTz8qOVrLnwRxlK3LPcoJk/5Bu
 nx7AR10njNpxx1hYeJ5CrAcZ29+AyyWqFgIpSyi8dIlkw9p5TYQ0lr8xTQzfjK55W9GuF
 XWPN6+jfic8zJdRiJDdETKKBVyBeJFMniw59jHdh6tH8sIYOLpvEFopRDoG6vPidW0xEu
 QU2fWM5+RLCEpD5tX1nLHUXqPTeiFLuOXkObrGjx/Xjo+3Y9boghb8DyXBXE4gtdnHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045947;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GGApCs7KYNLLS0HRTpsWLPKdmIfv0cRDZrY7ZBvaW+g=;
 b=Tq1Scumsec/swBSel2etKpgp9d4hOljRmFIQ/nf5aHVRMTO+21p7ziGfr02/D2E9p2YA
 HaDSpVhtzl62TVZ/U5LygSqe2/XLPFX3HVjWrijWMvBGy7jKFrCbiA/vyvU3gcR0JxSe3
 HP3Jw2VMWzYXMQS+WKab1Rqas3lBWAfRHmvCvKbs1T+beB0TzFztDmXL8SN/qgGoJgtd8
 8JQ3WK7Eb5F70JdjQ1Yll/hWeD2uV+CFOgSNi106NSExb+ERgcj3dqFpuvMrUATcUGn17
 butyzQHxiIQfEnacJ6V7ADyWnAMvGXe7A3rCmYJtYl2cqhnBRQHxRfH/xl2zodJvkIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pVUXFTei; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pVUXFTei
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44DA340E60
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791045944;
 bh=GGApCs7KYNLLS0HRTpsWLPKdmIfv0cRDZrY7ZBvaW+g=;
 h=From:To:Subject:Date:From;
 b=pVUXFTeiInydN5Mei+JHpwbc9mGeO4TmEbM6/dQh1EYYeUZjh6qNlYLg3+PafuStj
 4/uzmPRxuKr4hn5tyikJJPP6fWxaYnBo+pfjOQyAW0xP6tT87FZwmDjsR3kvOEnD84
 /a067FxUXtNvNm0+6jVGBHa3zGQz1vKSGy0AnLeYdQGA5CCPsyrWXd3eGwm20ToKar
 koWYaEFLWMyCh27043iDSCe+ShROjOOHgdOdNMaAY7b4GYTWRxYMYfEaZWJ/Or1sT2
 cdz1I2nQZJlpzrWXjAnXhG/RMUWzu3My17faRVfjWGvIwJpjynfAIVUE4mlePkl8E6
 +hVlU7BDjd2lA==
X-KAS-Sym: v3:f51bdf72230551df:FotHwV62hlilLtB4/0eVGVuMI2FDfyvzdxPdHPS8VWUEQ
 y5aQWAmuSf3cuZjfiKmL5IEbsXDONMtP6h0Rwj1h3oXoVIflR2puoyM9l+fiIuYdJRQKEAyX7Uw
 HbQgjWJCkzwqqcQNGR85Rdzd/RL20kOu38wD1JCkRf0/Ha21aJ/gnnCMa06KxXLFMXal+JBAkZG
 CDDLNc0UP6DPCLsMCeS4seU2BU5WKJwkzt8MaG+20tPZYTE6pPwgiF/7ffu8FzfN9JjxtekVC0t
 yJ16v5iChWWw89WX6efVSUMvmmSTop4P9yP7Ud8fovYxv6unoD+qh4FU9FMRvlg+krsX57lA==:
 puLG+3c7IEUVZeClT0env6uXSlsmJR3qyd8IPQBJbIU/d32ztnC5bYNA13oyLJeira+XhqaNfIh
 qhWnHq20/fEhCryiKCKOKaTk5Ilp3pFiwLpNpKxdXRCl/vg63M54ojw9nRW8Rle+9zcEH0d329l
 ZQXIXmtrNHrMcvxO7odDllPHOEb4wUcu8RZba25pafjjtpdqSG/jcSrT9a86MYyFDdAEySJAIwP
 ADdvps/Z/gAs4gkUCFf7yej2EPcHaXUfsag1nuFZeBahlc6jGee26X0WpLe7RO6SaJcyfuq92O0
 zaZG3nj3odv73nEJEoxdodjFiIxKeqUSRhBFzVrRL+lk2KH8Kv7WE5I7aKMh8Uj6DBsG/UumR2o
 PsG/rDYlAFNtyRtVWZFx+SmM6h2Ke/EUH1GNPJ/Q99uVyvP9tq0eoMBGmB7jhRnZfp89s9a8sN4
 8phc8pi/Yrgw20pP2jiVJig1tw2VxDDNgHj/QqTJCBTu9AWnNsshr/4ruPiiWMoXabCudE19c6j
 dsMf76Bl9ud1psZMA4TvgHss2wxnGVGFHLrfIvTzc/1+Pgpx1/u2SEGdhwooRIKO/j7aysWP+DW
 BqQanw==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1A1CA4C52BA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:45:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44456)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xD2rf-000000000xm-0WB8
 for buildroot@buildroot.org; Sat, 03 Oct 2026 16:45:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 18:45:34 +0200
Message-ID: <20261003164534.2876999-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump  7.2.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the latest kernel releases to:
 - 7.2.8 -> 7.2.9
 - 6.18.54 -> 6.18.55
 - 6.12.111 -> 6.12.112
 - 6.6.157 -> 6.6.158
 - 6.1.188 -> 6.1.189
 - 5.15.221 -> 5.15.222
 - 5.10.270 -> 5.10.271

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.8 => 7.2.9}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.270 => 5.10.271} |  0
 package/linux-headers/{5.15.221 => 5.15.222} |  0
 package/linux-headers/{6.1.188 => 6.1.189}   |  0
 package/linux-headers/{6.12.111 => 6.12.112} |  0
 package/linux-headers/{6.18.54 => 6.18.55}   |  0
 package/linux-headers/{6.6.157 => 6.6.158}   |  0
 package/linux-headers/{7.2.8 => 7.2.9}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.2.8 => 7.2.9} (100%)
 rename package/linux-headers/{5.10.270 => 5.10.271} (100%)
 rename package/linux-headers/{5.15.221 => 5.15.222} (100%)
 rename package/linux-headers/{6.1.188 => 6.1.189} (100%)
 rename package/linux-headers/{6.12.111 => 6.12.112} (100%)
 rename package/linux-headers/{6.18.54 => 6.18.55} (100%)
 rename package/linux-headers/{6.6.157 => 6.6.158} (100%)
 rename package/linux-headers/{7.2.8 => 7.2.9} (100%)

diff --git a/linux/7.2.8 b/linux/7.2.9
similarity index 100%
rename from linux/7.2.8
rename to linux/7.2.9
diff --git a/linux/Config.in b/linux/Config.in
index 291d41b897..d9b9356546 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index fc203c9097..bd821b0800 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
-sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
-sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
+sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
+sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c07882e1e528efe206567a26de30b192db8dc4369974d4ef4ce708691fa1148c  linux-5.15.221.tar.xz
-sha256  de73d528b04be91f6eb86660aa67a4d53b96bbf20bb5a326e78f802d744debe7  linux-5.10.270.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
+sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index d5e874c113..d2556506e2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  12e8d5a973d1ad7c5a5c69882e4022b131ed715db7003fdcd760ddf8c3e51941  linux-7.2.8.tar.xz
+sha256  b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba  linux-7.2.9.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9df30b02dd8102bbd0be52556288ef6889ddbe7f1ddb96fbf847d0becf3eacac  linux-6.18.54.tar.xz
+sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.270 b/package/linux-headers/5.10.271
similarity index 100%
rename from package/linux-headers/5.10.270
rename to package/linux-headers/5.10.271
diff --git a/package/linux-headers/5.15.221 b/package/linux-headers/5.15.222
similarity index 100%
rename from package/linux-headers/5.15.221
rename to package/linux-headers/5.15.222
diff --git a/package/linux-headers/6.1.188 b/package/linux-headers/6.1.189
similarity index 100%
rename from package/linux-headers/6.1.188
rename to package/linux-headers/6.1.189
diff --git a/package/linux-headers/6.12.111 b/package/linux-headers/6.12.112
similarity index 100%
rename from package/linux-headers/6.12.111
rename to package/linux-headers/6.12.112
diff --git a/package/linux-headers/6.18.54 b/package/linux-headers/6.18.55
similarity index 100%
rename from package/linux-headers/6.18.54
rename to package/linux-headers/6.18.55
diff --git a/package/linux-headers/6.6.157 b/package/linux-headers/6.6.158
similarity index 100%
rename from package/linux-headers/6.6.157
rename to package/linux-headers/6.6.158
diff --git a/package/linux-headers/7.2.8 b/package/linux-headers/7.2.9
similarity index 100%
rename from package/linux-headers/7.2.8
rename to package/linux-headers/7.2.9
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 88ee7ab17a..b11db18379 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,13 +476,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.8"		if BR2_KERNEL_HEADERS_7_2
+	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.9"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
