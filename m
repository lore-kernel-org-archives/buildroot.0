Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1FC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB1840C8D;
	Sun, 27 Sep 2026 10:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8rVLFfuRCi2; Sun, 27 Sep 2026 10:56:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 16E3540BEE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506580;
	b=R6I6KYxcvwk02H/wl9ri+9yOdeaK3skmkyJaz0/EijJxv64XKbggELcV+eY4SKUUosmR
	 C26OllaenaH/FSmEUcYentvGDvZeTOEC4q9T/ql7N64Qhd2uwTy09CNCA+aYTno6Inb/f
	 Po4ycFJfuaBelv95DCUmgkzlicsq2SVf09eH0aPLIOiKlY1R1qiC+jLyL+c6qOn6h6duN
	 ivTi9+/UIN9lt4w7oL1e70Y3viiFng+bJE3jhlLnvMGFZfAvltDkFYVy/GzKEl4LK1ZnG
	 DDeI0zi8lmEPSKNkz86Q2YeURZS6kK7/PL+XDbv4f2LqWvFUWw3Wk5ucFnaKG2jNYsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=CC6VA+VaCQT92+uj88CjCqZbKK6eJQ8IwBVLFEZ4fQjiPt618kwirNX7fxkbrKhQtFiY
	 SQQ4NsU1PSnbAvwZ+58uRRyOAXnOY+QzY105kIwuiM4NwaVLnrEAjWgGBdqkMdmoKIjrk
	 U0zMKyt97WfJDEwHk43WkzuEcfcL/x8Ubc7uv3HA5Wwb11+lSK2QnCSzgR1l6X3DM5LQn
	 I8lafrgqnLD9n32tVCaaIeI3lYY2ef4kcRZ4IxW4kJFgXS9rzzP3EwiHzcDHftPCZC8t4
	 gGtF/n/T8rAr037JzJYnm1gjTfWh8GyKzHlH6ifHtpQmupnwd6XQzm70IPyzAujlslA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506580;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TLaNmPpJbjOvy5ZHI3D86sHMEuQUIymAppNgbCN3NTCtHrucw9w+BegjC6Ymc00wq
	 itNxUem02f1zIGIk3LCYqe8hzsWdXxRy763vPMPqkAQ86/0Uqew3COYrhonfPXHR2h
	 0s0BVevp/hi2Y5XSvlV2WOu1Ppasmkm87HuBMufL0D9kYiti1gAQEfe1jqKrdOGVqm
	 PYnyxEqEpOPRlfJ1ivU+hmlNhHyEydGc9uTNOzlLL9rkUUpaGV4Dwf2zTEPwTx1XIy
	 OZowWHgWhKh3EhwG9wcwwSdmr6Ga1Abv7Wmr6JRJqT4eHNAu4KlvHeOj+OQABnYjZd
	 HhDyFMRKSHyAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E3540BEE;
	Sun, 27 Sep 2026 10:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F20D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B885810D0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDazD5Gzm5sf for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:56:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4B59D80E07
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506578;
 b=ZOngcUamy8Tw29eD2vD5enxFhz8U+BJgFcjQHbOR0ql+Pu/61l+AkdZttY6Dj7G94hbr
 3edFs0PS/md7B0jcey71h6ilViGo3BnBzU2VXhwKxgVr8NKf33iMn+TZJ16DDF6OyUgtn
 KYfTMjRNlBjBDfsn1gG1TEuanSrBAQ9L0cl7hTU2J9BlQYxVo77fW1s/i94xU8iw0aQz6
 zIFE7+K4qZzZXCtUXArwruIZyFjld3PDI1R89zYtd1mjLJtkaLjCUg628Nu0uCVIFu1pH
 k4CopHzT9nxAcMyZkVJDFCG3D9SaeELSUMGJAPZU3V50ea+nblV2I/iZKvwCZ+frrnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506578;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=cNHuZM9iabQ+TB4c7QCU7z4CXiQCAHV3Yg0FL+WrVQcMpg3UBMWO7XDeE3RzMWLPlM2v
 z9wehoIZZp/fWHzvz3KqT+RjppIxsYo24u+XgOgt2DE2B8aLIrEwLPJpX/B5lWIAGoqfl
 OqT/eewjr538BGyEik1yGtw2FrG/fJPwNi0t0emxcEtvnOme/2JJfCiX6nVX52oRtUtrR
 cEqXYuxQLmKS4ynDTMyE4Inv+j3qqu2QJFYnYP32Ke0b7IGTW6y6eOASdmy4nOB+14o2s
 Dow0Aq9nc4PePrqiRIyLGHlk4YFkQ1ys+miUgVaMUjP3ljhkRynlGkMfhnJzwaNgfPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Y8KLJA0a; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Y8KLJA0a
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B59D80E07
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505861;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Y8KLJA0a6LDnNUIfT2wEV8bfKC2WP7gN65qOHKNyzX0NgyWf6G45HRVlMA7HyQBBm
 UaCYOut2wriHkXrSd1EmvRdUytjeOa/9653StgYUETERvWPJsUAJhwgvATPOgyt1IW
 cGzptDm+2jnyObKQBpfnjekHMUYrHNCvVPpqFpWJ1FdsuxMKfuuxyjn5quJhfh3oHe
 4qw7dtO+LiptQD666NQ/iGQx+2HtoQjiMvvucunotnLlFdCRmwurYnDteHuaEunwEM
 D2X+A3GAOFXkMWakN90vDg9qqMPVW+7BmZHoBunKuOAeTb0fgv6/oA39e8MD3rGf36
 kRQ8mi7UU+4YA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 cV7mZO+MmX3pbNZcZixhyw4gt2AqkxBgQdSh+9+PpvD9TnLTLoHsk9S7jMLPssslAJ2KMTj09r5
 JkhM/wu/+MBtGG+kM94A4AJxXZkWT82F5+J69zU3+st0Smd1FOCiENhcbqGb3Q8a/OJ7/Bqy20W
 b1I2zJXuSeg+NUQFw0WAOG0nRk411jaW8WoQULnAajD08cN7/BcEVzQTSIMVbsYl+Xwlsi1h+FY
 ntYs61Qphdw6hfTgpHjA46PzSZWKkjCQgyaeoX3YBdBTDRwkqy584vwmjlBApRD6nYYVZDR0I3a
 aZn/qSyA/qHumWjvxrvufOrB0Uw34+jz4O2H73mcqs5qnVzQvCFnxxUxAC7Iko3INU5gSK6aKuW
 ooFesQyTQeynkissp0+YCbXzjahWo/Dts+/cprWD6hn7ciNC160+EPJNwSpYHiTWCp9EeXthh11
 LzLMOtg9I0nDQimWx7tdWe7kikyL/uicsMoUppk3p7GZk/X0V/9yjRyc2CyLNrUvATi272Ur4fm
 JF4ogE5BmngW1xdJNmehoAbwGycwdnhigcuzfOR5Wq+5Jb31b3QDmVF6J40S0Xf9ncla0gM6D/Y
 VaK+B3d39HJ+rEIyam9YRsc7bTpB6aPwO3ng34dgiRUMnqGiI6gTjvfKQJpta7XSgfUVP8V2ra/
 aD0fkjTJ30pimE7wJ9hPi/SCCkg457wc9bhNj0ndYFgrJJF/h6ughHn9I5Bnw1Bs=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC790A4C506E;
 Sun, 27 Sep 2026 12:44:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-22FL;
 Sun, 27 Sep 2026 10:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:15 +0200
Message-ID: <20260927104301.1801638-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 37/82] package/xtables-addons: bump version
 to 3.31
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://codeberg.org/jengelh/xtables-addons/src/tag/v3.31/doc/changelog.rst

Upstream switched tarball format to zst.

Enabled CONFIG_NETFILTER_XT_MATCH_STRING in kernel config to provide the
new upstream dependency CONFIG_TEXTSEARCH_BM:
https://codeberg.org/jengelh/xtables-addons/commit/6b7c62d83ea1b589c3115d959867e0fcbfcf74ea

Enabled CONFIG_XFRM_USER to fix build errors detected by the Gitlab
pipelines:

  ERROR: modpost: "crypto_alloc_shash" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_setkey" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_init" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_finup" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_destroy_tfm" [pknock/xt_pknock.ko] undefined!

Upstream uses these functions for > 10 years so recent changes in the
Linux kernel dependency handling are responsible for the build errors.

Enabled CONFIG_{INET, NET} to fix a build error detected by the Gitlab
pipelines for bootlin-powerpc-e500mc-uclibc:

In file included from pknock/xt_pknock.c:31:
./pknock/../compat_xtables.h:19:9: warning: #warning You need
 CONFIG_NF_CONNTRACK. [-Wcpp]
   19 | #       warning You need CONFIG_NF_CONNTRACK.

ACCOUNT/xt_ACCOUNT.c:1179:10: error: 'struct nf_sockopt_ops' has no
 member named 'set_optmin'
 1179 |         .set_optmin = IPT_SO_SET_ACCOUNT_HANDLE_FREE,

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 7bdbbb8578..a77ac1a230 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e823f71720519ced31c4c7d2bfaf7120d9c01c59a0843dfcbe93c95c64d81c1  xtables-addons-3.24.tar.xz
+sha256  e22efc25b7bbb3436d1b7cdc309b1857ea933f7e5c7d88fbe6951a1e3e582a80  xtables-addons-3.31.tar.zst
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index a3174725d0..9f70518fed 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.24
-XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
+XTABLES_ADDONS_VERSION = 3.31
+XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.zst
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPL-2.0+
@@ -33,10 +33,14 @@ endef
 XTABLES_ADDONS_POST_INSTALL_TARGET_HOOKS += XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
 
 define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_STRING)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
 endef
 
 $(eval $(kernel-module))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
