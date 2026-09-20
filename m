Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39562C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1ACA40E54;
	Sun, 20 Sep 2026 17:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRfWjs813aQl; Sun, 20 Sep 2026 17:13:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D5C4A40EB4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924381;
	b=WOL2XwH6Z9jJ/QXMREnyvg1uTWsfK7LzKhWQEqmYUF4zmpVIvNA6dEa3BQYUOrn6Dfwx
	 BjvpC6gXh98sGSBcPA8OOtHF2QFRjqi7P07hJWP+Am9aufySHsok3kw6DmH0que5zrUnO
	 TBk4beym47Ku5QkDIwvfgeZ60GS5zcYi5JCYyFI7HpJfjaGyYHtXOBdoiv8Xo+lTMX2Rw
	 d1PnHaTmHjAl5AN5ILnEja64QeuSPa4OsAMXwadGaxvvX2E+97a09l4K7O/8OSO8JsdRX
	 dZ9CAYH5IV8erh+jX26BNq3FpQhhJ4+XnDcEWN+o5HAE2v47Qktln/oMtKlr6YtRd4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BLkd7h0KCJJKqQGL4ld/wGoAUVRGg08472w1Sqr73dY=;
	b=T8+N3exSwiwafivbM6HviV6YEovotBtuW7ktQNiJwQpv1EqPH/3v9BP/CM8gEKjyBzgb
	 YpvIqdNjTuUaXMo5eMs4rhN8N1KaowH5LFwdNYxCoadkjVAt+xbkuEMW5ksJ77FU9Ijpm
	 5Hrx1yMNuFVf/gdaMv+UBuQGRcQ8/GQOM5s7UTzmpzDx5laRkldRbgx6lKKDoplhExq0/
	 K830AS3fiCoMff+yLhO38MT+lNHxWavGeAI7DShAvqF1HKYQcg3N/uA1pRabiUcUEOUKo
	 cc5THxugkeug3nSW2ziOjOcYcqNFmTeFUyjU21boUR23BO4UU2ywqGNBZ6fMljZaSKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924380;
	bh=BLkd7h0KCJJKqQGL4ld/wGoAUVRGg08472w1Sqr73dY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dXOTxv6q1a1LopAd5BXglabYK52eH93KKS81wcAeYPmE7Wfv86ULssPkRWfHSWGP9
	 IE93F8+G73L6WHH+N5XH3CKdoDoWyGf81fxjx38PLz0TIJfVwLbTPQa47FFVz43l8k
	 69KKeBnho9ra+Cd2UqJltzt4PwmPWEyVA+6jp8uSS4Movxz0U675Ft+khhc1+0+2eH
	 ZrZP7i3wV700nFq60MS3+9FNxhI0Vx7b5gb4opcH4AmAbv+Wb/nFjEv5vTEJs2gMXH
	 XlpkQpjk8mYjcTYsu94hWE+Zd2s+aqgXTVSqGYbpcSRFxbpx8H/taFq1S2PXkM/HVM
	 GWPb9E3w29EGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C4A40EB4;
	Sun, 20 Sep 2026 17:13:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA4137A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54BAE80D29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LV3PXS-cciaV for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5031680BE5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924377;
 b=GRxbse4Oj1FhFni4pGG9Z8+n/ROqqDSVlSAibaXsquSyfWj/7Lsqaw769lTil2OX5Wd8
 u0ZXoouSV2fSHg3sejJ9U+J3Eh7kv/L3baqxUhDCBPAEFS4jqTGuZIE3BtYhYMlQsNnrL
 cR3d4nAAz7XaHVOPvCoBMl7/KZhKFnnmKC7vOuokpL9MaG0PHvrfzVMvmv09fi9vF5Gu5
 iiP0yzE2k0Xkr8bl43DcNBSo3mUO61C3On8PxsSuGuGJ/bxR9lGB7+PlJdI6hIWJnlBQe
 oTXftdkpwdegTfWRbvjE9BpLuZdBa8yyspkpsJsuPWkVmG7fL/WokyZTPmDPJzTDITA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924377;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0a2MH0yKNwJDtmW17vkn6pNL3LhpYgddnVo5kpUcGgo=;
 b=HPDbYjiHkK8b+W4PUS7GaZQYH/xcm03Py4hcO9AyhQ7NNLvvmuUnt5+5HCFqq9Pip13U
 tsRLOhFHH6eXkMZQP3eib+HYevIE/QuDfW2LlsTPhN6gJR68gWZZBCUxcxii+DX09eQKM
 LD75ttbWDm7/GeKolCIkaxToVRo7HrUowcefD/tilD53koI+bJhtP9tJgOUk18MmNsK7M
 WtnpkXtKegHM91czQwE/yk5xzCtCxe2v0OWR8omWdwDb3j21G+woldBkf/yn4Gk0L9olS
 O330GtL6ODlnqs8zh0xvFaSA2wbNBAyMnvDeivLDHcSe+qxr0hh+wa8hCLcFEreaXLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IoTyVfun; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IoTyVfun
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5031680BE5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924147;
 bh=0a2MH0yKNwJDtmW17vkn6pNL3LhpYgddnVo5kpUcGgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IoTyVfunfdJ8tKuscHDbe/93vvNayuBkTAPEIcqImpFQWQhNltGeihMOuEk/LLS16
 EHN0T0UuvHt1YGPhDnFbCPGJ8pDQN1PPtU5r/kHAq1O8vWDbykDFh/BWnmgNO5ondw
 TNi1ZK7NjOG8dKSJqX4LVLn6nv1l5+SNmDUfkgUtG/pllVpj5sj65KhHTHSbDmnWRc
 XSCUH/1A+4pz3xv679h2lgvwyRFuEuNltBABbPI2DaLgi3fEYfsUO2GptSf2IdWmyX
 snh3xOUcqhsc7Zu1tsNiyNDMTZw+g5prPXzHJh/apKatDX0/7fM9cfNxs5Q7P1E7DZ
 mrvr4rvho9l3g==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:uWsNdLatQnyQRdVzpM/PnSfv9jq2Uhhy1NtgKN2d8SLI/cjFUMdOOAozSr0kEVuJNw6xwinO9sr7MFURdzy4EFKzcfLR5yGZwo/KSRUdbVZC/Gu4xEnpTGw7GOTLcj5p48KJvPN9GlWz/6cg0fPiz0kGFATQaBObon91kpi5P/PfbJqY+3VMiHFz9oi5C67uyD9Y/wg8nIMbblyjpA2h8WLgozp4nzxgNrtEGYBkSSRbSTlgsBid2TunUBSUEI+H34quH5Pq74zeS9I8i1hTWq/4t4XnKVP2+hgYm88w1rbb81MLZT0eXFvzEoNUWYumFN/A0Bf1O0srIwzKJg217KpeiDnDYH6JB4lPpK3wQroLEB6GWXnNDqjAqEV1Py4OW9EMFEn64jEy9sDTsQPAY/FrfozfvFhZXo5YwsMMPOezq8pX2K8a8atBe2cLVKPJC97oTqCchkj3OOEIWsSOX2OS7wcVY94M+J/IJOT3L+dkJCFOPC+YYb0bNpA4vs+V+V3AZLQmurNwkaJ5geGnBMLtLZ0iIXDybVjhJC/PcoFN3Pkc0lSUd4t8uQr34nFWuAUiPPjyvO4JKJpkjD2joAw7Ii6nR42FFU1Iu5o2PSactm
 AJQf74+JMgb+CoW5fsoQfqghBdbaQvNibhmqXHCXONmqwlebTXIsqc5eBAUAijFrvwDhcVU8OHfUcgh5knnszfLXB4jj0tizWMZdpBjEG6D1C7uDFdQg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDF4AA4C4879;
 Sun, 20 Sep 2026 19:09:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1W-000000000o7-26CD;
 Sun, 20 Sep 2026 17:08:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:16 +0200
Message-ID: <20260920170815.240247-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 09/67] package/dovecot{-pigeonhole}: security
 bump version to 2.4.5
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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

2.4.0:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/UYNR6GBP25XEGFCS633SWPR4HXV3NSS3/
"Pigeonhole versioning has been changed to match Dovecot versioning."

"New 2.4 packages are not compatible with old 2.3 configuration, please
 carefully review https://doc.dovecot.org/2.4.0/installation/upgrade/2.3-to-2.4.html
 before installing the new packages."

2.4.1:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/XPT6TA7Y4B4QZZQ2XUE46Z35BDR2X2AA/

2.4.2:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/XTMMPVQ3QKQMYDZ3CZZCXPNHN7OXKS3L/
Fixes CVE-2025-30189:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/G3K5HMBKW6XOYNBXYV5GUM2GR6WPUD4M/

2.4.3:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/IKIHZX77IPTGSP5WBIPJUOFBUQFKVPE7/

Fixes various CVEs:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/I4KFFV4IKP6M5MS67SWYHKDSDMSNILQG/

* CVE-2025-59028: Invalid base64 authentication can cause DoS for other
  logins.
* CVE-2025-59031: decode2text.sh OOXML extraction may follow symlinks
  and read unintended files during indexing. Fixed by dropping the script.
* CVE-2026-24031: SQL injection possible if auth_username_chars is
  configured empty. Fixed escaping to always happen. v2.4 regression.
* CVE-2026-27859: Excessive RFC 2231 MIME parameters in email would cause
  excessive CPU usage. Fixed by limiting number of parameters to process.
* CVE-2026-27860: LDAP query injection possible if auth_username_chars
  is configured empty. Fixed escaping to always happen. v2.4 regression.
* CVE-2026-27857: Sending excessive parenthesis causes imap-login to use
  excessive memory.
* CVE-2026-27856: Doveadm credentials were not checked using timing-safe
  checking function.
* CVE-2026-27855: OTP driver vulnerable to replay attack.
* CVE-2026-27858: managesieve-login can allocate large amount of memory
  during authentication.
* CVE-2025-59032: ManageSieve panic occurs with sieve-connect as a client.

2.4.4:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/YW7GVOH3VVLNAYW2C4TEBTGJW52J7F6H/

Fixes various CVEs:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/YQYBB3NJPNFFJ4SHDU7PLXLRRGHBJKSK/

* CVE-2026-27851: lib-var-expand: Safe filter marks all following pipelines safe.
* CVE-2026-33603: auth: CRAM-SHA-*-PLUS channel binding could be faked.
  MITM attacker with a certificate trusted by the client could have
  bypassed the requirement for channel binding.
* CVE-2026-40020: IMAP folders can be shared-spammed to everyone.
* CVE-2026-42006: An attacker can cause uncontrolled memory usage with
  excessive bracing over IMAP. The fix in CVE-2026-27857 was incomplete.
* CVE-2026-40016: sieve :contains and :matches operators could have been
  using excessive amount of CPU. Limit the CPU to sieve_max_cpu_time.

2.4.5:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/D7FJQODYCY23BG3FWUZXCJRCLCPT7RZT/

Fixes various CVEs:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/WT4USR35HN43TGQGVDXPDAMCUTGLVMET/

* CVE-2026-27852: Messages with a huge number of From/To/Cc/etc email addresses
  could result in excessive memory usage.
* CVE-2026-33263: Submission: Login service crashes with panic once
  mail_max_userip_connections limit is reached.
* CVE-2026-33604: The SMTP outbound dot-stuffing mechanism does not properly
  escape dots following a bare \r in message bodies, potentially allowing
  spoofed emails via malicious end-of-DATA injection.
* CVE-2026-33606: Mail content stored by a user can be crafted so that it is
  interpreted as dsync protocol commands when an administrator later runs dsync
  with the stream protocol, for example during a migration.
* CVE-2026-33607: IMAP LIST command could be used to cause excessive CPU usage.
* CVE-2026-40014: IMAP THREAD command could have used excessive amount of CPU
  processing a single email with a massive number of Message-IDs in References
  header.
* CVE-2026-40015: Invalid IMAP command sent to imap-hibernate process might
  crash it.
* CVE-2026-40017: IMAP THREAD command could have used excessive amount of CPU
  processing emails with a large number of specially crafted Message-IDs in
  References header. The fix requires a new dovecot.index.thread file format,
  which is enabled only after setting dovecot_storage_version or newer. This
  rebuilds the index, so it will cause some extra CPU usage and extra
  metacache disk IO usage. It shouldn't cause (much) extra object storage IO,
  because all the fields should be coming from dovecot.index.cache.
* CVE-2026-40203: When IMAP COMPRESS=DEFLATE was enabled, an attacker
  could send mails into a victim's mailbox and observe network traffic to
  determine whether a secret message matched a known string by comparing
  compressed response sizes (a CRIME-style attack). The fix resets the
  compression dictionary after each IMAP command, preventing information from
  leaking between commands.
* CVE-2026-40205: If multiple OAUTH scopes were required, then
  this could have been only partially enforced with certain
  configurations.
* CVE-2026-4200: XCLIENT FORWARD allows to forward key only passdb
  fields without the "forward_" prefix which allows connections from
  trusted networks to set nopasswd field which allows to skip the
  authentication.
* CVE-2026-42391: Pre-login IMAP ID command could have used excessive
  amount of memory, causing the process to become killed and disconnecting
  all the other IMAP connections being proxied by the process. Or
  alternatively it could have caused excessive CPU usage, slowing down
  all the other IMAP connections being proxied by the process.
* CVE-2026-42392: If URLAUTH is enabled, sending an invalid IMAP URLFETCH
  can result in an untagged NO response containing uninitialized memory,
  potentially leaking sensitive data.
* CVE-2026-42393: Doveadm password length or API key length could still
  be determined via timing based attacks.
* CVE-2026-42395: XCLIENT FORWARD command from login_trusted_networks
  could have been used to cause login processes to crash.
* CVE-2026-52681: Sieve resource usage (sieve_max_cpu_time) was tracked
  in the active Sieve binary. Switching to a different active binary
  could have been used to reset (bypass) the resource usage.
* CVE-2026-52687: Using IMAP COMPRESS ZSTD command can cause excessive
  memory usage in imap-login process, possibly making it reach vsz_limit
  and kill all the connections being served by the process. Fixed by
  disabling COMPRESS command with all other compression algorithms than
  the standard DEFLATE.
* CVE-2026-73208: In oauth2, scope/aud checking was done with JWT tokens.
  Now it requires all scopes.
* CVE-2026-73209: Sending IMAP COMPRESS package containing zero-length
  frames crashes imap or imap-login process.
* CVE-2026-33605: managesieve-login: Pre-auth crash. An unauthenticated attacker
  can crash the ManageSieve login process by sending a small malformed command
  before authenticating.
* CVE-2026-40019: v2.4.3 regression: managesieve-login pre-auth infinite loop.
  An unauthenticated attacker can send a truncated quoted argument to the
  ManageSieve login process, which makes it spin in an infinite loop consuming CPU.
* CVE-2026-42007: sieve-editheader: An attacker that has valid credentials can
  use a Sieve script with the editheader extension to trigger a use-after-free
  in the mail editing code, and to write memory contents beyond the intended
  buffer in the delivered mail.

Removed patches which are included in this release.

Added patch 0001 to revert upstream commit which breaks the build:

  CCLD     test-var-expand-crypt
output/per-package/dovecot/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 attempted static link of dynamic object `./.libs/var_expand_crypt.so'

Select libiconv when needed, upstream removed the optional support in
verion 2.4.2:
https://github.com/dovecot/core/commit/8dd2ec82f63ba1bf9ddf1b74243e00185ebba9b1

Added optional dependency to pcre2 available since version 2.4.2:
https://github.com/dovecot/core/commit/38fc1545fe8cf8b97ff3b23f4a4279a0eb344881
which needs BR2_PACKAGE_PCRE2_32:
https://github.com/dovecot/core/blob/2.4.5/m4/want_pcre.m4#L9

Ported path fixup for Makefile from dovecot to dovecot-pigeonhole to fix
build error:

make[6]: *** No rule to make target
 '/usr/libexec/dovecot/settings-history.py', needed by
 'settings-history-pigeonhole.h'.  Stop.

Updated license hashes due to upstream commits:
https://github.com/dovecot/core/commit/8de4423b61320d93acce56a31844219c3317d43e
https://github.com/dovecot/core/commit/2a5809c115ed270c26fdca5c9b0c29a369706210
https://github.com/dovecot/pigeonhole/commit/8020ac138000e7e45f85f352eb15b66fa246f7a2

Added optional support for libkrb5, openldap, postgresql and zstd.

Removed optional support for xz due to its upstream removal:
https://github.com/dovecot/core/commit/3e44364d4a030159e21d3758bab04ebdb09ef27b

Removed configure option --with-ssl (openssl is already a dependency):
https://github.com/dovecot/core/commit/6b0b7141a8a50ffc99ad51b4f27c75f876e58616

Removed configure options for zlib (zlib is already a dependency):
https://github.com/dovecot/core/commit/d666521754b024ce4f1cfee322fcc492673c00a5

Renamed RPCGEN value in _CONF_ENV to silence configure warning:
./configure: line 34595: __disable_RPCGEN_rquota: command not found

Removed various _CONF_ENV variables due to their upstream removal:

i_cv_inotify_works:
https://github.com/dovecot/core/pull/107#issuecomment-560056967

i_cv_signed_size_t:
https://github.com/dovecot/core/commit/52d322449d236d9ac885130abdc024c5549e109c

i_cv_signed_time_t:
https://github.com/dovecot/core/commit/7cedd93c4ed18344940cb327fce12bd90d83d83b

i_cv_c99_vsnprintf:
https://github.com/dovecot/core/commit/5dc503907d7ef65293e441603ad80060c34ad502

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   1 -
 docs/manual/migrating.adoc                    |   6 +
 .../dovecot-pigeonhole.hash                   |   4 +-
 .../dovecot-pigeonhole/dovecot-pigeonhole.mk  |  12 +-
 ...xpand-crypt-Link-test-binary-statica.patch |  32 ++++
 ...g-passdbs-with-identical-driver-args.patch | 137 ------------------
 ...onfigure-Explicitly-check-for-icu-uc.patch |  28 ----
 package/dovecot/Config.in                     |  20 +++
 package/dovecot/dovecot.hash                  |   4 +-
 package/dovecot/dovecot.mk                    |  68 +++++----
 10 files changed, 113 insertions(+), 199 deletions(-)
 create mode 100644 package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
 delete mode 100644 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
 delete mode 100644 package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 47e8dedb72..a94f3a71b3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -281,7 +281,6 @@ package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
-package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
 package/dracut/merged-usr-module-setup.sh Shellcheck
 package/dropbear/S50dropbear Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/dt/0001-adjust-os-symlink.patch lib_patch.Upstream
diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 68f09e1bae..86b040a19c 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -264,3 +264,9 @@ added to .cargo-checksum.json to clarify that this file is not a
 security mechanism. Tarballs generated by Cargo-fetched packages have
 changed, therefore the suffix of such tarballs has been changed from
 +-cargo5+ to +-cargo6+.
+
+[[migrating-to-2026-11]]
+=== Migration to 2026.11
+
+Due to the update of Dovecot to version 2.4.x the runtime configuration
+files need to be updated.
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 247f74fdba..96bf279e24 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  0377db284b620723de060431115fb2e7791e1df4321411af718201d6925c4692  dovecot-2.3-pigeonhole-0.5.21.1.tar.gz
-sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
+sha256  ad7c478cb3aaa76c5f81f86727a3e6843645b0a1253f5684fb8a0beec0d22925  dovecot-pigeonhole-2.4.5.tar.gz
+sha256  1fc821d394719d8b5337223c1f4bd898a231f2fb559f2cf3ebeda97be8362d6d  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 4d21ebd395..17ffc1d7cf 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.21.1
-DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
-DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
+DOVECOT_PIGEONHOLE_VERSION_MAJOR = 2.4
+DOVECOT_PIGEONHOLE_VERSION = $(DOVECOT_PIGEONHOLE_VERSION_MAJOR).5
+DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/$(DOVECOT_PIGEONHOLE_VERSION_MAJOR)
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
 DOVECOT_PIGEONHOLE_CPE_ID_VENDOR = dovecot
@@ -15,4 +15,10 @@ DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
 
 DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
 
+# fix path to avoid using /usr/lib/dovecot
+define DOVECOT_PIGEONHOLE_POST_CONFIGURE
+	$(SED) 's%^dovecot_pkglibexecdir =.*%dovecot_pkglibexecdir = $(STAGING_DIR)/usr/libexec%' $(@D)/src/plugins/settings/Makefile
+endef
+DOVECOT_PIGEONHOLE_POST_CONFIGURE_HOOKS += DOVECOT_PIGEONHOLE_POST_CONFIGURE
+
 $(eval $(autotools-package))
diff --git a/package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch b/package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
new file mode 100644
index 0000000000..83ba1168ce
--- /dev/null
+++ b/package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
@@ -0,0 +1,32 @@
+From 08a6ca5cfb9d4148d5dedabd0660e06fd3081606 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 25 Aug 2026 21:17:48 +0200
+Subject: [PATCH] Revert "lib-var-expand-crypt: Link test binary statically"
+
+This reverts commit 1c6b67195d279836d94e141215c626c20af93af6.
+
+Upstream: n/a (buildroot specific)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib-var-expand-crypt/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/lib-var-expand-crypt/Makefile.am b/src/lib-var-expand-crypt/Makefile.am
+index aa6a3b9b81..12d424a845 100644
+--- a/src/lib-var-expand-crypt/Makefile.am
++++ b/src/lib-var-expand-crypt/Makefile.am
+@@ -35,9 +35,8 @@ test_libs = \
+ test_var_expand_crypt_SOURCES = test-var-expand-crypt.c
+ test_var_expand_crypt_LDADD = $(test_libs) $(SSL_LIBS) $(LIBDOVECOT_TEST_LIBS)
+ test_var_expand_crypt_DEPENDENCIES = $(module_LTLIBRARIES)
+-test_var_expand_crypt_LDFLAGS = -static
+ if HAVE_WHOLE_ARCHIVE
+-test_var_expand_crypt_LDFLAGS += -export-dynamic -Wl,$(LD_WHOLE_ARCHIVE),../lib/.libs/liblib.a,../lib-json/.libs/libjson.a,../lib-ssl-iostream/.libs/libssl_iostream.a,$(LD_NO_WHOLE_ARCHIVE)
++test_var_expand_crypt_LDFLAGS = -export-dynamic -Wl,$(LD_WHOLE_ARCHIVE),../lib/.libs/liblib.a,../lib-json/.libs/libjson.a,../lib-ssl-iostream/.libs/libssl_iostream.a,$(LD_NO_WHOLE_ARCHIVE)
+ endif
+ 
+ test_var_expand_crypt_CFLAGS = $(AM_CFLAGS) \
+-- 
+2.47.3
+
diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
deleted file mode 100644
index 99a2b83563..0000000000
--- a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 7bad6a24160e34bce8f10e73dbbf9e5fbbcd1904 Mon Sep 17 00:00:00 2001
-From: Timo Sirainen <timo.sirainen@open-xchange.com>
-Date: Mon, 9 May 2022 15:23:33 +0300
-Subject: [PATCH] auth: Fix handling passdbs with identical driver/args but
- different mechanisms/username_filter
-
-The passdb was wrongly deduplicated in this situation, causing wrong
-mechanisms or username_filter setting to be used. This would be a rather
-unlikely configuration though.
-
-Fixed by moving mechanisms and username_filter from struct passdb_module
-to struct auth_passdb, which is where they should have been in the first
-place.
-
-CVE: CVE-2022-30550
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/auth/auth-request.c |  6 +++---
- src/auth/auth.c         | 18 ++++++++++++++++++
- src/auth/auth.h         |  5 +++++
- src/auth/passdb.c       | 15 ++-------------
- src/auth/passdb.h       |  4 ----
- 5 files changed, 28 insertions(+), 20 deletions(-)
-
-diff --git a/src/auth/auth-request.c b/src/auth/auth-request.c
-index cd08b1fa02..0ca29f3674 100644
---- a/src/auth/auth-request.c
-+++ b/src/auth/auth-request.c
-@@ -534,8 +534,8 @@ auth_request_want_skip_passdb(struct auth_request *request,
- 			      struct auth_passdb *passdb)
- {
- 	/* if mechanism is not supported, skip */
--	const char *const *mechs = passdb->passdb->mechanisms;
--	const char *const *username_filter = passdb->passdb->username_filter;
-+	const char *const *mechs = passdb->mechanisms;
-+	const char *const *username_filter = passdb->username_filter;
- 	const char *username;
- 
- 	username = request->fields.user;
-@@ -548,7 +548,7 @@ auth_request_want_skip_passdb(struct auth_request *request,
- 		return TRUE;
- 	}
- 
--	if (passdb->passdb->username_filter != NULL &&
-+	if (passdb->username_filter != NULL &&
- 	    !auth_request_username_accepted(username_filter, username)) {
- 		auth_request_log_debug(request,
- 				       request->mech != NULL ? AUTH_SUBSYS_MECH
-diff --git a/src/auth/auth.c b/src/auth/auth.c
-index f2f3fda20c..9f6c4ba60c 100644
---- a/src/auth/auth.c
-+++ b/src/auth/auth.c
-@@ -99,6 +99,24 @@ auth_passdb_preinit(struct auth *auth, const struct auth_passdb_settings *set,
- 	auth_passdb->override_fields_tmpl =
- 		passdb_template_build(auth->pool, set->override_fields);
- 
-+	if (*set->mechanisms == '\0') {
-+		auth_passdb->mechanisms = NULL;
-+	} else if (strcasecmp(set->mechanisms, "none") == 0) {
-+		auth_passdb->mechanisms = (const char *const[]){ NULL };
-+	} else {
-+		auth_passdb->mechanisms =
-+			(const char *const *)p_strsplit_spaces(auth->pool,
-+				set->mechanisms, " ,");
-+	}
-+
-+	if (*set->username_filter == '\0') {
-+		auth_passdb->username_filter = NULL;
-+	} else {
-+		auth_passdb->username_filter =
-+			(const char *const *)p_strsplit_spaces(auth->pool,
-+				set->username_filter, " ,");
-+	}
-+
- 	/* for backwards compatibility: */
- 	if (set->pass)
- 		auth_passdb->result_success = AUTH_DB_RULE_CONTINUE;
-diff --git a/src/auth/auth.h b/src/auth/auth.h
-index f700e29d5c..460a179765 100644
---- a/src/auth/auth.h
-+++ b/src/auth/auth.h
-@@ -41,6 +41,11 @@ struct auth_passdb {
- 	struct passdb_template *default_fields_tmpl;
- 	struct passdb_template *override_fields_tmpl;
- 
-+	/* Supported authentication mechanisms, NULL is all, {NULL} is none */
-+	const char *const *mechanisms;
-+	/* Username filter, NULL is no filter */
-+	const char *const *username_filter;
-+
- 	enum auth_passdb_skip skip;
- 	enum auth_db_rule result_success;
- 	enum auth_db_rule result_failure;
-diff --git a/src/auth/passdb.c b/src/auth/passdb.c
-index eb4ac8ae82..f5eed1af4f 100644
---- a/src/auth/passdb.c
-+++ b/src/auth/passdb.c
-@@ -224,19 +224,8 @@ passdb_preinit(pool_t pool, const struct auth_passdb_settings *set)
- 	passdb->id = ++auth_passdb_id;
- 	passdb->iface = *iface;
- 	passdb->args = p_strdup(pool, set->args);
--	if (*set->mechanisms == '\0') {
--		passdb->mechanisms = NULL;
--	} else if (strcasecmp(set->mechanisms, "none") == 0) {
--		passdb->mechanisms = (const char *const[]){NULL};
--	} else {
--		passdb->mechanisms = (const char* const*)p_strsplit_spaces(pool, set->mechanisms, " ,");
--	}
--
--	if (*set->username_filter == '\0') {
--		passdb->username_filter = NULL;
--	} else {
--		passdb->username_filter = (const char* const*)p_strsplit_spaces(pool, set->username_filter, " ,");
--	}
-+	/* NOTE: if anything else than driver & args are added here,
-+	   passdb_find() also needs to be updated. */
- 	array_push_back(&passdb_modules, &passdb);
- 	return passdb;
- }
-diff --git a/src/auth/passdb.h b/src/auth/passdb.h
-index 2e95328e5c..e466a9fdb6 100644
---- a/src/auth/passdb.h
-+++ b/src/auth/passdb.h
-@@ -63,10 +63,6 @@ struct passdb_module {
- 	/* Default password scheme for this module.
- 	   If default_cache_key is set, must not be NULL. */
- 	const char *default_pass_scheme;
--	/* Supported authentication mechanisms, NULL is all, [NULL] is none*/
--	const char *const *mechanisms;
--	/* Username filter, NULL is no filter */
--	const char *const *username_filter;
- 
- 	/* If blocking is set to TRUE, use child processes to access
- 	   this passdb. */
--- 
-2.30.2
-
diff --git a/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch b/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
deleted file mode 100644
index ea9aecebde..0000000000
--- a/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830 Mon Sep 17 00:00:00 2001
-From: fundawang <fundawang@yeah.net>
-Date: Sun, 27 Oct 2024 22:11:21 +0800
-Subject: [PATCH] configure: Explicitly check for icu-uc
-
-Ensure we link against libicu-uc when it's split in v76.
-
-Upstream: https://github.com/dovecot/core/commit/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: backported to version 2.3.21.1]
----
- m4/want_icu.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/want_icu.m4 b/m4/want_icu.m4
-index b656ef9f479..405a73b361f 100644
---- a/m4/want_icu.m4
-+++ b/m4/want_icu.m4
-@@ -1,7 +1,7 @@
- AC_DEFUN([DOVECOT_WANT_ICU], [
-   if test "$want_icu" != "no"; then
-     if test "$PKG_CONFIG" != "" && $PKG_CONFIG --exists icu-i18n 2>/dev/null; then
--      PKG_CHECK_MODULES(LIBICU, icu-i18n)
-+      PKG_CHECK_MODULES(LIBICU, icu-i18n icu-uc)
-       have_icu=yes
-       AC_DEFINE(HAVE_LIBICU,, [Define if you want ICU normalization support for FTS])
-     elif test "$want_icu" = "yes"; then
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index e109ce6be8..6753160c27 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_PCRE2_32 if BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -32,6 +34,24 @@ comment "mysql support needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
 
+config BR2_PACKAGE_DOVECOT_POSTGRESQL
+	bool "postgresql support"
+	depends on !BR2_sparc # postgresql
+	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Enable PostgreSQL support.
+
+comment "postgresql needs a toolchain w/ wchar, NPTL, locale"
+	depends on !BR2_sparc
+	depends on !BR2_USE_WCHAR
+	depends on !BR2_ENABLE_LOCALE
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_DOVECOT_SQLITE
 	bool "sqlite support"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index fde96f32a5..f29eccb319 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e  dovecot-2.3.21.1.tar.gz
-sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
+sha256  868c2686a61b5f8e00a3e4721789b1ab46e6528fd773a5fbed07a6ecba7731e6  dovecot-2.4.5.tar.gz
+sha256  4825bf42bebc624c4ce283bd6147daa1aa2c874a12af6f7fb7b07a2c793cc131  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a4c799221c..74cacc3200 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21.1
+DOVECOT_VERSION_MAJOR = 2.4
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_CPE_ID_VENDOR = dovecot
 DOVECOT_SELINUX_MODULES = dovecot
+
+# 0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
 DOVECOT_AUTORECONF = YES
 
 # add host-gettext for AM_ICONV macro needed for autoreconf
@@ -19,30 +21,22 @@ DOVECOT_DEPENDENCIES = \
 	host-gettext \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	openssl
-
-# 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
-# Note: this ignore CVE entry is reported as stale by pkg-stats, but
-# the NVD database is incorrect:
-# https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
-DOVECOT_IGNORE_CVES += CVE-2022-30550
+	openssl \
+	zlib
 
 DOVECOT_CONF_ENV = \
-	RPCGEN=__disable_RPCGEN_rquota \
+	RPCGEN=false \
 	i_cv_epoll_works=yes \
-	i_cv_inotify_works=yes \
+	i_cv_gssapi_spnego=yes \
 	i_cv_posix_fallocate_works=no \
-	i_cv_signed_size_t=no \
 	i_cv_gmtime_max_time_t=32 \
-	i_cv_signed_time_t=yes \
 	i_cv_mmap_plays_with_write=yes \
 	i_cv_fd_passing=yes \
-	i_cv_c99_vsnprintf=yes \
 	lib_cv_va_copy=yes \
 	lib_cv___va_copy=yes \
 	lib_cv_va_val_copy=yes
 
-DOVECOT_CONF_OPTS = --without-docs --with-ssl=openssl
+DOVECOT_CONF_OPTS = --without-docs
 
 ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL)$(BR2_PACKAGE_DOVECOT_SQLITE),)
 DOVECOT_CONF_OPTS += --without-sql
@@ -69,6 +63,14 @@ else
 DOVECOT_CONF_OPTS += --without-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+DOVECOT_CONF_ENV += KRB5CONFIG="$(STAGING_DIR)/usr/bin/krb5-config"
+DOVECOT_CONF_OPTS += --with-gssapi=yes
+DOVECOT_DEPENDENCIES += libkrb5
+else
+DOVECOT_CONF_OPTS += --without-gssapi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 DOVECOT_CONF_OPTS += --with-sodium
 DOVECOT_DEPENDENCIES += libsodium
@@ -87,6 +89,20 @@ else
 DOVECOT_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+DOVECOT_CONF_OPTS += --with-ldap=yes
+DOVECOT_DEPENDENCIES += openldap
+else
+DOVECOT_CONF_OPTS += --without-ldap
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+DOVECOT_CONF_OPTS += --with-pcre2
+DOVECOT_DEPENDENCIES += pcre2
+else
+DOVECOT_CONF_OPTS += --without-pcre2
+endif
+
 ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL),y)
 DOVECOT_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 DOVECOT_CONF_OPTS += --with-mysql
@@ -95,6 +111,13 @@ else
 DOVECOT_CONF_OPTS += --without-mysql
 endif
 
+ifeq ($(BR2_PACKAGE_DOVECOT_POSTGRESQL),y)
+DOVECOT_CONF_OPTS += --with-pgsql
+DOVECOT_DEPENDENCIES += postgresql
+else
+DOVECOT_CONF_OPTS += --without-pgsql
+endif
+
 ifeq ($(BR2_PACKAGE_DOVECOT_SQLITE),y)
 DOVECOT_CONF_OPTS += --with-sqlite
 DOVECOT_DEPENDENCIES += sqlite
@@ -109,18 +132,11 @@ else
 DOVECOT_CONF_OPTS += --without-lz4
 endif
 
-ifeq ($(BR2_PACKAGE_XZ),y)
-DOVECOT_CONF_OPTS += --with-lzma
-DOVECOT_DEPENDENCIES += xz
-else
-DOVECOT_CONF_OPTS += --without-lzma
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-DOVECOT_CONF_OPTS += --with-zlib
-DOVECOT_DEPENDENCIES += zlib
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+DOVECOT_CONF_OPTS += --with-zstd
+DOVECOT_DEPENDENCIES += zstd
 else
-DOVECOT_CONF_OPTS += --without-zlib
+DOVECOT_CONF_OPTS += --without-zstd
 endif
 
 # fix paths to avoid using /usr/lib/dovecot
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
