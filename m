Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD734CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261E8821BC;
	Sun, 24 Aug 2025 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 789WXY_YZlNq; Sun, 24 Aug 2025 20:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552B981E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552B981E6B;
	Sun, 24 Aug 2025 20:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4519E114
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3577181E6B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kupbP8-HbCK for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 20:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3B3F81D16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B3F81D16
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3B3F81D16
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 20:34:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from thinkpad ([213.147.165.25]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1uAZt80lWy-00ncht for
 <buildroot@buildroot.org>; Sun, 24 Aug 2025 22:34:22 +0200
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 22:00:05 +0200
Message-ID: <20250824200007.834297-2-dalang@gmx.at>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:UO2bXXwajid+E7deGry/LePNzgKsWmfJ/8JouNPglQ6nP46uzFB
 2ebuYy3Ww6hJ/zwSBpfhqBNPv1Fv+twHQ550b1+9w+64d3i6jiQ48X4Pa0OuTfOxBQNL4ou
 QaMauNUAP6le5xUWwBlJ/SHzLVhZ3U0/4RJfDtpfuFWTL3B4meakF/ExAwG60ZQs0iWo0Kj
 MQS/9frjFEESUV67w6KfA==
UI-OutboundReport: notjunk:1;M01:P0:pfEU5jHwkKE=;43uCYPjZz7wgV4vanPhrqyzRx2I
 /lkq2/+sQtqErhhS0+Ck2+24jp8UXShrYETHU2pjp151Q0V6yis8G9/D8FI/FOzNRWoBO4JJO
 +ImKjVF9EB3AdjN9tplPpjd00giolQ1+orPvRgztuN7tcV2iXSBDjtU/iIIclM3wErpn4kIgi
 O7DDWznSA5lbfvvyIvRdBPynHyevpajnPefqCUnkGojkx16RV/1m7q4Soby+N6vMHCSKax3Di
 +yalxBhNA2yT+UXYTmQctKg8nmuYiRwSvu99uFr+W4ShL1yQsMZ6hkyQE6Vr8Rn+EioIWYVaH
 Nluv7CLvGZXKx2kGsVU2/iFsxb21NPe74Vc1/z27whJAFiQR0PvUEdPE3vYN56FDdCSc916Cy
 W69iSsWCGkHG/x6J5JjwevN/iYjvkLvSH1uPTt/jiXO92ir63hRFgF1uFDohuFYbYYaMeCFgO
 zvzZLAauZjhqLS+bzZKy399/1Z9XQarhuxxUskOL6Ip/+6QKdEdA/+a3bHGcYvtWJVtnZWp1s
 AqnQSq6cpuFvmgySUKPGwQ3xXREyJfgEmRPDWT4jr3dnc93IZPxY5fhRGSGhZJcza5Bgr6wjj
 luDecNWwBT9cGSK9fqIk7UBSu4XN8c1LRhIS79BUlQ5A5X+beW+Wz6Jci2P3Eu7jME6zkT44y
 4eTTnaY71T46kLl3clqQayRNxbwBtpvkBPLJg4+IunR2/wf9KxK9l2ORFkFoumMZnjcaKFTHz
 WjwQ9wvkXzupsAwftvFj2JSCtE21tzm9hcvsSzWSBVSCxSf/4NGgaJmgNg0z6wiMLAtSgWfNs
 FOdOsE2/xmQMyEEhebWGgxVI1CIfBFCBowuB4Ab6Apjgrz1cSnkacyPktt+AvAlnUzxGeoax+
 97GSPhlDKBqlyujDDekFadZHvAr6XXIt8T25fyIYj+sgRQfWMlm6Cks1IsbLUErGfP5qrbakJ
 fHR5LdSkuXlZ9QJNUZiYJP+yFbOUcCl8WcBzJNjt9zltJmoHTveQNVj+PwoPGbibnRilYyvZL
 EU78hmSzO/YAJnV48G+2VKCylUAtqGkYGd68yOlxIV14uyvECwvpu8ZE2/aKwYXZ1Ox9FFu2f
 AhlyrDtossYakf7mv2haxra1L0jOn98B0jSVZacU/G91QR7v3SdiSaRYNSBF00mTKs2um4Yx9
 xpRuhCLExW4FxMUFrKVTxMU+Z0RPZ77ZE57t5nLrJ5mZzHL2+wK7RbK0j1I/td50ObuJvuPei
 q163DiQsQNsUhdIkpNegtHugUfMtdwetRy3s0/QIvn/Y68mmJAuwK2a+4qJ+xPhNCw5JftPUl
 fUoQpAC7psw5Q/wsglW9xI1U6DcvNJ1oPGhsvk6BKC2ZL5aYM4DmTpwL84KXCSuBWZ2uyb4kB
 iKXQk1hKIA2gajrPFMRCyuabD2fwBHoTnOiTHc8Lc1XdnOYM9lBAijxGkQba6m3PsnibUeyoD
 vcJE9MpzvA1ypoZEsCXAPNiO2ZU9IGv7mUzZHndTQ7IOh9LMbzngmztEmKDDbJU/Yrku2x1oU
 89MXTwHXwP7+SbH8LZetSkcaZeJlj0GlFDDaLgr6DYzR3S7WF6zCX0Ex8aL36xKaQIwK0RIAd
 iuHwGGXF0C2Cn8q3/6kKVsK6uRFlb4AXRwIHK47PhVDczZpLZ+itHYOy9ebPXFZ9E+vByuLjD
 ip4GGy7PxHsdbsjF29qC/p8dhh0r4vKntycScjvE9v+xWSD+Cuy4Xv3VGp7TxzM/Zf41oqWoE
 z1Vq/eCdLVGF9OYBCs0xl08W/Kw/973KKNIXsLeFI3/ruvI4sWSAsDULCQNAqwfv7g1Enokfu
 UCVHppUVvcDyaklU4p+d0GTns5SbdLfpSSuy79wImG+e2vQPCQIdjnGMrJgTgybDMUOBMiNML
 WXRp9ZUQ8z8zKO6XEsHbgayiT9n/xrx/wDYZ44bQQAVi282PZfiMAQR4MKKn/liTxqWQvwahP
 rN32/3Fv96fys1Yq8WMyFK1NhLNYJdwRr4Ebq/+BZuFZ0mXQIdhgYvqc6mag+laAsJXYR8Wxr
 1dcoNAwmOpq0ENmTHH9/aJrzPJZvu4/CfKIH2DU7VpB3omtV5uEzrGPCT+h4O4eFi97G0ZYV+
 cJupS6UaHMneOxc4Mig5Wnw44EfuzgYpcCWyFQUvUXEOS4mJlN/6WjJ8ref+BmTwEE0lNCoJg
 0BuEIV01zwSPRDR9KQ5IVn4E2+v6KKcrqXafWxLe3ntSqoYufypHRcAQ1NEas1QvbAMxgYDQh
 Asr6vQJzBNlKN8B+DjIjZyOZWsPCW4KQAtboS587c0yNmkNTT4fHex4xjJleJ3pcD6zpX4IQ5
 aCRUkMO5GLr0mmxdMN3xUeMjSO9yWs1jt8HKXzzD18pr+RDGUQqw5LW9qdfXMhsmyDFsusu0a
 Cfybo043V9F2hRwfB2cVuCIpu/btEv5+zTrkLg3bwviYMbzswexlkUYEZYqauMKc3sKqSiZUc
 JKRWrDXGDEm06LuF9L/4YQF0yQEVuGL8Ctg8T7zXrbCXbmuWA0nmP9DfYdP9tOZqJiNATNpEV
 EQ6EeHPeduOz8ahkurN2aP57hAQd+q6QQ70hexWiKuuGAAC3cgdgjvdmiyUyTJ57+6bzM2h0y
 vBvJ0Am58qTSNBK6GUJHJC/bmPJtvp0MxDl8KoGiVbXN6q0PfT6OHd45cUPIrUyR/yhpbnsr4
 dYV5ZAkvLhXdQYw/9D/rYmVWF8pm4YNyIUZeyXcgHZmLLpvuxBUSejdTGe/7rnfSY9IPwg/23
 qXXtIlyk3KEaA4SUnYKCRonz7V0auYNsTHsDbW+qIQ5R809zIPBscirAtW/XYKe72+8OwiVS/
 H5rbjrVlV3PJdJlSJOhU7dDctLJVpgGcOWm6+rmWwy8/PeedxQiTYbkKSF3O6/dLYozSv6cCW
 PS9yQOLZGiOxqZY7NbGTU6UJrg+6AaG6nJnWigugzaFcauabknt9RMQ4wrhxqiYArWUgQPXSL
 Q5y++L5m0D+5Pzd+mEU6IVSdyz8xqu3bmgJx4cSeYUHVInNQEZxU5iNnQvrIsqzSnJFyNG6Bi
 2kfSMAm1dWGINVOT1mAw7M8nPFOmaN/lI1GwKM7FWsIN8iyPtkGjLZt7NTqznM1YDu0kaMBC1
 7ZRagYyKiAFJMp8ObjcLtvq3vy0T2vGBruQMcrZQCBCPLgeRzXa5FAefvOe2hNR2LXatUpWpe
 hPn3zlmqKud6iSnQDpoRLnSnp0qkeRCPG+HAMVrI6dVbYxrvSOrs67lH8hVu2Osszk1mfEZyt
 eooY0JZDljn2n9UROEZcyooc+dddQI1gAFd6rIDnVAON4S5IJ3S+CQx7y/NATYXIYh/NK4l3p
 ucM5uSLZCAPOQsOJsNJtsa9p8PjqQTLKyEzYpeAFlKbYnmYbNrD9bEMfW+xUO9yqAuwQB0852
 9ooLQLehsL2QLIwj1En7l+kIfaOFYyFHp6XQuDqAx6KflfPYAIr7ONL9tYndmlwgBYsCSUJuX
 5mLUs0NJUpy3Xfr5Y7ZPF9F/65S2LIO+E/11IfO2BNUFENll4FxO9nKN/jOotDea4dz3M6car
 ZZhChPa2nGstTvOpG7s6W445mx4jAlaZ+tnD2fPlcYtdj0ruWBZ8LcuGimHFH52uZykCECJtl
 op+NvSRvp660yFdQlebMmaaZCUb65eH952hFxIqbfa/2hM9VBSkUScxQpK84GeCFRKB78x6IM
 cyb8eJLn11mRZlDgn+jAUW25faWyvoIiiq+RMmhm9NTXvDSal+b0kzQfhtJcu8QawBSy4TJYN
 0cHoL9l9LRK7+V7d43u1miFScnbhSha+jyqr9o5gLPvUmtmRgPX/9S2pS5et2v7uHJkLjiaRI
 +Sx9jtIOxF1tQSjrAVs0/5KzuK4o10bNfzQY4ze9KXfE5eIa5LWxQSegJ3fvjdIhG6xG0n5H6
 YuSe2zngCoXwomix3t7/YBPHbHdlD31SO2mOKlGEv2DPUmEwUAxNK9NN8LoWGA/Jw6PFfrcfM
 71U2KM7sGJEz9qELC08LnY2YcOGbGZXzqX8y/OE8zWr7+MgGO401J5mKIb9vd+laOiD0OGzN4
 Ll1B+DwDAOvAiE75/oBSzotfq8jdRTuAbVz4E2a6j6UzSxMAWZrgJj8ajTSgs6zHuNLQI57MU
 oyPJaDqmZ5VS6GXJ4hxUGD75kcZHJbvafaZE+QT2dBfwoiaGHvhLcqE9tKrh9BUPQLtA/Fq/J
 r/9c2VXQOBVVlTbwbMU7gs4o11oLdRh9rFk2xHqRGL5KrC8W+emTH/bVbhp02FoWDWvRLVrT5
 dV/79ofkKcNgFLTMyix8YqZI/Irks+So1/PUFBRPsh5fJljEoZo0oQJAzv7xf2Tt8zsOLeIJf
 SHltuh0+zOvmjndMdt0iYynzCffXVoTMLA639CUmhu/rfbXR7lJkDZWw7t9KE9se/pTrL97cR
 T0spwVCUPhXGN1DsEBp/y/tXvC6MQfr5WkHqWKZRaehEbLxkkx9rtFn+lGDmmfopF7P+jps69
 6dfd8MlaPeyfKIzyDwH+GbMbLGYVcCjDc6i6icaR5qJ7SQjX3e3PajaSx8RQdQ3R+OVv4GXKj
 XHsnJY8t/ABXiC9YQtP2pPU6s3mL2VrwPV8nSLbJEcy/QWvxmEFTjmqQmmmPJ5PGz1pUzuHwc
 MXpryJrF2brQqj7dU9QjfX0jtRVEQCAWJSH2NRi5AcpauJ/2jbzZJXqbn60+fNzKc/c1ed0/7
 num5Jdzj5+8bol2au7oYJDF85sDS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1756067662; x=1756672462; i=dalang@gmx.at;
 bh=5H11OeyGh2VuTWcqa2IYealcNDxYzL0g0j4SSKtCjT8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AyichrHHvKL/IaoR3E492vslNgTj7moC9kd8eLaWS855WZ74NFrkVZM3oHNT8luo
 NXW7qDsFz8ZBDefaJ0v5rj542SDgE2JP7DggR9BcO0IpDM+pl2uWZANRmBx1qyMBu
 glp6uT27qgX6LaUH029oWH//yb7PNVBTvUoEHxRZBaZrKbu3FtfZW+EiXUXhT/koP
 bkoh3chLb41peHBP15ShdPtN+FXbHRaKZiC4+8EhCcpqV87qwYvmxHsfn6nmA/TzW
 md+jTTrHwbph37Foan1AuoNvO4oQybmDeWAzYx0MKQgBIUimFGomoZM71mOsoHKjn
 aCsb4eZpFTRY4Hpaqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=AyichrHH
Subject: [Buildroot] [PATCH v2] package/vim: security bump to version
 9.1.1665
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:
- CVE-2024-41957
- CVE-2024-41965
- CVE-2024-45306
- CVE-2024-47814
- CVE-2025-1215
- CVE-2025-22134
- CVE-2025-24014
- CVE-2025-26603
- CVE-2025-29768
- CVE-2025-53905
- CVE-2025-53906

README.txt got updated three times since the last bump:
- [0] updated some wording regarding who the developers are.
- [1] updated the link to the release archives
- [2] updated the goals of the project

netrw (the builtin file explorer of vim) changed maintainer and was
subsequently restructured [3]. Therefore we need to run installpack,
otherwise we run into this on startup (reported by Julien, thanks!):

Error detected while processing
/usr/share/vim/vim91/plugin/netrwPlugin.vim:
line    7:
E919: Directory not found in 'packpath': "pack/*/opt/netrw"
Press ENTER or type command to continue

[0]: https://github.com/vim/vim/commit/b75825f749cf87feb9ae8e7e5327bd2efe707c86
[1]: https://github.com/vim/vim/commit/4225f28855c5d3023662b3a90a70b22caf9b6ade
[2]: https://github.com/vim/vim/commit/2bfd1ee161e26ece8e5a72cdca4fff22d11728a2
[3]: https://github.com/vim/vim/commit/9cfdabb074feefc9848e9f7a4538f201e28c7f06

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- update to 9.1.1684
- add installpack to fix issue reported by Julien
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 194bcb4378..ae909aaeac 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  vim-9.1.0145.tar.gz
+sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  README.txt
+sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 7d51a6ddab..4297bdd198 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.0145
+VIM_VERSION = 9.1.1684
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
@@ -49,6 +49,7 @@ endif
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
 endef
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
