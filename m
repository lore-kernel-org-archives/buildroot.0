Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9504AC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CF040C91;
	Fri, 18 Sep 2026 18:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojrhKQd9QWCs; Fri, 18 Sep 2026 18:41:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B99F740B94
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789756909;
	b=aTASA+/jGqbwEFG+Ydd1EQnxhAbolIRu7/K61S+rbHqBmkH80bnu8NBAZPyk3J3XmQs2
	 svI1C2ZRT/oV0QEjmmLWXNz2ZByqki299WtohcFjIZEp9Zv7Fbuyrmh+IieWvJ5RFY81f
	 31RPQ2qVGkLX1ZYMT2Pkj0A0WF0247RZFzJyWCY5b1YOMYYDLzApoTIAfgXI7uRXFrQMa
	 PtmFO60hLMJ8U8INlQPuLUgsccl8mNu09gBBluhvu+6jz2s7LFuQ3lrHyeHRPKhLpxavj
	 LtC5lebnEhdi1Tztx0DEvQMYq6uttHEtzjkwYJbgeCztlPIb4VMXrG8rbRuGpMAq8pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789756909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BxynwAi6aSk51uPAl5dHwrTmGRjCOuN5qyIY7bISP2k=;
	b=k2wZn0Vk08USqaqIDfymRfx2BYvP/rCZgfA0nicIkVEIzrBZNdjxOFKF7u1X5aKVhHG9
	 PEt41n8OcmuEWIzW0vB5kYIQ2Upuu8Ox8ClbQy//9tsz3omgZ+TQRdLYxT+yePqWfyouz
	 3VSMdeLWfOuSAu/RqacvnE1fOGodmktDZWfSjnSzXD6MnY4MRhqh4hs5HkXKo6xAdy0ws
	 5RC5UKgNQpn3nJKzERgZ62XQcoHRfFJT5f1vP4Wb7v+nAsYmZckYAL3oHtV5O7tqQmPwl
	 3RLyNeafUE+5cXKuE9fc1X39H1+mN43Whky32xeX22U1bKc+ab/aI/oRd7TuTfQeMFA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789756909;
	bh=BxynwAi6aSk51uPAl5dHwrTmGRjCOuN5qyIY7bISP2k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RZgLLX0/qHPEuXEQr+0gaKqrcKXyeHTnlQSRoPvQ7MzI6jtIiGCI4QHWyh5SyPszU
	 ixKTOpBEvIygSx4ZXc11X2ksQ4rLm1075wevkudsuvMEp2XwF45f1VL5jAiVasQAQL
	 Toe3oEbHc/vPb9VGoJOB8uVHNDVuaxSl55WMVx/JOPX2vpxYzPJVu8tDacpoED528v
	 2M1u4V+xi5Lcj5XZ6pj+nrTQWUzEe2Rz0HYhBTECdu3KYFpQiYMoXCXP1tJyA0/0m9
	 lqx88UlDiBkIDnlD6u/c4mKavJcjG3GTHNiOV8/a37mSBeO/4Ksw0ZKfuu5luXq1Ir
	 ZJfQPs7L3MMbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99F740B94;
	Fri, 18 Sep 2026 18:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A5E0237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C394006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBz4q9kVCerZ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 24B08400AB
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789756906;
 b=D8okwlsMPq99XxgDRElrVF5gYda9JI+foQS8uBMhig12w5awrdrTfd3+T2+YMtBX+GJr
 bJDeHJN+3cjOaHcJTcc+gBQ6TR4/P4M0VFohr1L15tNf1eqs8yaEN6i97ak7uA+Ay8QLC
 oSKj2PNKcoUzjKIVSnfIJD0i/0bkfKULjSNuajveov1L1NrAG6gxnDZGUwmuCFzDsuC+x
 Jcr/hqDO7jVY2JIJj49mAbqV0NLSo07AJe0mYwB0wD4UXknRmUAUQD/j5rPIIX6dkayZ0
 d5QbU9gRNgWA9nNNdqf5ijmVkQRZKIhQmH+nqnCcvKr2rnzwfy9BTQJWvBQm8NzFIOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789756906;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wkJ4pDM5jjVQX8Zq5sQ105YC6gKqO9MJj2jkx8P0pEE=;
 b=FOAqDh0b+NIhz8aSJnGMAWLeo4NMVDaBU8+3BBtyd88KN/XjE7fKuWmlepuPtcxaV4i8
 TXe3RK+M4/SuCW70RsqgHFrkzJmqaaQWBPw5g5VeQ5KF5eyaEWzcbxEhtojK40HnFHqXc
 Gwd9FGXkpNGr6LNPLCXMTHGMPF/cajIi9NKgxwznVlq+hnXyit7S1pA99XBxc3lNiRQgq
 OOxogztrJl1AxEQaRAhMf2K/2Oc5SSg/aZNj2uA/TC3eJBDjSqLntRCHG6HB1UXKWsSRJ
 Nxc8/137wgh9390/Tj2IUmXqNUjthX/x9s5HPgWQmLBz81KSpy6kp2+a8Ev4zNwbOYA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=if0L26Ci; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=if0L26Ci
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24B08400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756901;
 bh=wkJ4pDM5jjVQX8Zq5sQ105YC6gKqO9MJj2jkx8P0pEE=;
 h=From:To:Cc:Subject:Date:From;
 b=if0L26CiHRZ4u42VdCvqc3guJ9iza5r2PW7Me+OtEcSl/weBrXCKA4zrsU6hiF9Bj
 DKICgTlLSx53zGmjI8LiAGWOWUent/KOTdWmfqHVIQrUa86Nisf1u1cZSBLgluozj6
 3Vv0RU//01NLzQqCg/ksqnAKuEnCAwLGdRw2+LWzdpi3h7pvEoHHsEVxJyRP4j6ohH
 yAOrmKHtkI/lXXMKpCGCRyMRSxjb3MLYniubS75eUW1XEKz3U8xn9hDjuGzSNdVyHX
 0PZWmqzQFwsoEHI9pdacTy0vuekh9x2//sFozFfayOBBgdzFM+97pn/O864e5stZKH
 81dl2HpkH8oVg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:ke/3FOiB0FIha9uSADMEJFAKEXiFX80X5LbWXbJAkY8xmYAY5ww+A9kSebM/BamwCGMh3jtnn1vDOPtBKmNqH3cAMMo7pjzCeJ/QfEw352E8uLW59zEOrAqv+2Tr/+Y2OeLD7VZ6TNCsx8LXYDQ9Ym6mb7ZEUMFVFOHFrLkT9Hzk1tAec9GU5tyXFPgP5dBHvlFFk237rht3bTJIwd2Rn/3VQgmZbicIMSQQ6qBHLzLPIhXlhdCTW0nGx2SkIeTNGfRAWvIok3rUwswqCWZJzRgau3j3XCWcPrtcfDqydz86dvs9Vd9yTfigdV4sMXUMxJFtEEEEoCySE6no0Yz/zH0QNP+Ve2gpVgu9LuQIFJW4gllTsdnqKfytFlfae9seEYpCEYV6tYXSCLyLIAEB9ie/garuMB/PySHFGN4tmGjSLNxwRiBd61eRM8ja9exV5TgYGgUe5rcY9c8IOoXQsCKC9iyktnx1216Hzsm3wN9qQNQn8UUCgrU38wxuEUYy07sxkFFk+VBEHbO7btr+0cv9cE6RPOZ+h42Icpaqo4I8hVUCEsMep+t7j6OXd0k3Wmn0JyLsYNqp9y56UYE38qSp4RZn33KYRUFaFq+F7ok8Ff
 TH+OAQHylqY+aNXvtwiCVZHD7dSv60mg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90D63A4C42BA;
 Fri, 18 Sep 2026 20:41:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWm-000000007cB-2WzI;
 Fri, 18 Sep 2026 18:41:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:22 +0200
Message-ID: <20260918184140.3631274-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
Subject: [Buildroot] [PATCH 00/77] package/libopenssl: bump version to 4.0.2
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this series bumps libopenssl to version 4.0.2.

It consists of the following parts:

0001-0007: package removals
0008-0031: version bumps that provide compatibility with OpenSSL 4.x
           0007-0013 belong to the boost patch series
0032-0076: upstream fixes for packages without a released version that
           provides compatibility with OpenSSL 4.x
           The luvi package needed to be bumped first so the upstream
           fix for OpenSSL 4.x could be applied
           The poco package needed the CMake patch from Yegor
0077:      bump libopenssl to 4.0.2

None of the patches 0001-0076 depend on the libopenssl bump, they all
build fine with libopenssl 3.6.2.

Regards, Bernd


Bernd Kuhls (75):
  Remove mender packages
  package/heirloom-mailx: remove package
  toolchain/Config.in: drop BR2_TOOLCHAIN_HAS_GCC_BUG_101916
  package/qt5/qt5opcua: remove package
  package/qt5/qt5knx: remove package
  package/resiprocate: remove package
  package/libcpprestsdk: remove package
  package/cc-tool: Fix build with Boost >= 1.89
  package/jwt-cpp: new package
  package/domoticz: bump version to 2026.3
  package/libtorrent-rasterbar: bump version to 2.1.1
  package/boost: bump version to 1.92.0
  package/ibrcommon: update patches
  package/ibrcommon: Fix build with OpenSSL 4.0.0
  package/libpjsip: Add support for OpenSSL 4.0.0
  package/asterisk: bump bundled pjsip to 2.17
  package/asterisk: bump version to 22.11.0
  package/asterisk: Fix build with OpenSSL 4.0.0
  package/daq3: bump version to 3.0.27
  package/snort3: fix build error with numa support
  package/snort3: bump version to 3.12.2.0
  package/snort3: Fix build with OpenSSL 4.0.0
  package/poco: bump version to 1.15.3
  package/xtables-addons: use kernel-module infra
  package/xtables-addons: bump version to 3.31
  package/dovecot{-pigeonhole}: security bump version to 2.4.5
  package/nmap: bump version to 7.991
  package/openvmtools: bump version to 13.1.0
  package/libp11: bump version to 0.4.20
  package/apache: Add support for OpenSSL 4.0.0
  package/boinc: Fix build with OpenSSL 4.0.0
  package/ca-certificates: Replace c_rehash with openssl rehash
  package/clamav: Fix build with OpenSSL 4.0.0
  package/capnproto: Fix build with OpenSSL 4.0.0
  package/ecryptfs-utils: remove OpenSSL support
  package/freeradius-server: Add support for OpenSSL 4.0.0
  package/freeswitch: Add support for OpenSSL 4.0.0
  package/gloox: Fix build with OpenSSL 4.0.0
  package/grpc: Fix build with OpenSSL 4.0.0
  package/ibm-sw-tpm2: Fix build with OpenSSL 4.{0, 1}
  package/ibrdtnd: Fix build with OpenSSL 4.0.0
  package/lftp: Add support for OpenSSL 4.0.0
  package/libesmtp: Fix build with OpenSSL 4.0.0
  package/libest: Fix build with OpenSSL 4.0.0
  package/libkrb5: Add support for OpenSSL 4.0.0
  package/luvi: fix build without c++
  package/luvi: bump version to 102-g9fa6c141a
  package/luvi: Fix build with OpenSSL 4.0.0
  package/mtd: Fix build with OpenSSL 4.0.0
  package/netsnmp: Fix build with OpenSSL 4.0.0
  package/ntp: Add support for OpenSSL 4.0.0
  package/omniorb: Fix build with OpenSSL 4.0.0
  package/opensc: Add support for OpenSSL 4.0.0
  package/perl-net-ssleay: Add support for OpenSSL 4.0.0
  package/pkcs11-helper: Add support for OpenSSL 4.0.0
  package/python3: Add support for OpenSSL 4.0.0
  package/qpid-proton: Fix build with OpenSSL 4.0.0
  package/qt5/qt5base: Add support for OpenSSL 4.0.0
  package/rauc: Fix build with OpenSSL 4.0.0
  package/redis: Fix build with OpenSSL 4.0.0
  package/socat: Add support for OpenSSL 4.0.0
  package/sofia-sip: Fix build with OpenSSL 4.0.0
  package/softhsm2: Fix build with OpenSSL 4.0.0
  package/squid: Fix build with OpenSSL 4.0.0
  package/sscep: Fix build with OpenSSL 4.0.0
  package/sudo: Add support for OpenSSL 4.0.0
  package/thrift: Fix build with LibreSSL and OpenSSL 4.x
  package/thrift: Fix build with OpenSSL 4.0.0
  package/tpm2-openssl: Fix build with OpenSSL 4.0.0
  package/trousers: Fix build with OpenSSL 4.0.0
  package/turbolua: Fix build with OpenSSL 4.0.0
  package/uboot-tools: Fix build with OpenSSL 4.0.0
  package/xmrig: Add support for OpenSSL 4.0.0
  package/znc: Fix build with OpenSSL 4.0.0
  package/libopenssl: bump version to 4.0.2

Michael Nosthoff (1):
  package/boost: remove dependencies on Boost.DateTime

Yegor Yefremov (1):
  package/poco: convert to CMake package

 .checkpackageignore                           |   15 +-
 Config.in.legacy                              |  105 +
 DEVELOPERS                                    |    7 +-
 board/mender/x86_64/genimage-efi.cfg          |   43 -
 board/mender/x86_64/linux.config              |   64 -
 board/mender/x86_64/mender_grubenv_defines    |   25 -
 board/mender/x86_64/overlay/etc/fstab         |    7 -
 .../x86_64/overlay/etc/mender/mender.conf     |   11 -
 board/mender/x86_64/post-build.sh             |   48 -
 board/mender/x86_64/post-image-efi.sh         |   92 -
 board/mender/x86_64/readme.txt                |   69 -
 configs/mender_x86_64_efi_defconfig           |   54 -
 docs/manual/migrating.adoc                    |    6 +
 package/Config.in                             |    8 +-
 package/Config.in.host                        |    1 -
 .../0004-modules-md-Merge-from-icing-md.patch |   57 +
 package/apr-util/Config.in                    |    1 -
 ...of-bundled-libpjsip-with-OpenSSL-4.x.patch |   63 +
 package/asterisk/asterisk.hash                |    6 +-
 package/asterisk/asterisk.mk                  |    8 +-
 ...fix-a-build-failure-with-openssl-4.0.patch |   26 +
 ...xit_code-guard-static_asserts-on-MIP.patch |   59 +
 .../0001-unordered-fix-copy-assign.patch      |   22 -
 ...-for-duplicate-definition-of-SIGLOST.patch |   30 +
 package/boost/0003-Fix-build.patch            |   39 +
 ...-types-between-declaration-and-defin.patch |   53 +
 package/boost/Config.in                       |   17 +-
 package/boost/boost.hash                      |    4 +-
 package/boost/boost.mk                        |    2 +-
 package/ca-certificates/ca-certificates.mk    |    4 +-
 ...-errors-when-building-against-OpenSS.patch |   38 +
 ...tibility-with-older-OpenSSL-versions.patch |   29 +
 .../0001-Fix-build-with-Boost-1.89-32.patch   | 1029 ++
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch |  136 +
 package/daq3/daq3.hash                        |    2 +-
 package/daq3/daq3.mk                          |    2 +-
 package/domoticz/Config.in                    |    7 +-
 package/domoticz/domoticz.hash                |    3 +-
 package/domoticz/domoticz.mk                  |   27 +-
 .../dovecot-pigeonhole.hash                   |    4 +-
 .../dovecot-pigeonhole/dovecot-pigeonhole.mk  |   12 +-
 ...xpand-crypt-Link-test-binary-statica.patch |   32 +
 ...g-passdbs-with-identical-driver-args.patch |  137 -
 ...onfigure-Explicitly-check-for-icu-uc.patch |   28 -
 package/dovecot/Config.in                     |   21 +-
 package/dovecot/dovecot.hash                  |    4 +-
 package/dovecot/dovecot.mk                    |   68 +-
 package/ecryptfs-utils/ecryptfs-utils.mk      |    2 +-
 package/fluent-bit/Config.in                  |    1 -
 ...ING-functions-for-OpenSSL-4.0-compat.patch |   80 +
 package/freeswitch/freeswitch.mk              |    5 +
 .../0001-Fix-build-with-OpenSSL-4.x.patch     |   43 +
 .../grpc/0003-Add-support-for-OpenSSL-4.patch |  327 +
 ...k-symbol-optopt-to-fix-FTBFS-on-mips.patch |   57 -
 ...-support-since-it-is-no-longer-suppo.patch |   39 -
 ...-warning-warning-macro-N-not-defined.patch |   23 -
 ...0011-outof-Introduce-expandaddr-flag.patch |   69 -
 ...ption-processing-for-email-addresses.patch |   77 -
 ...onditionally-require-wordexp-support.patch |  111 -
 ...bname-Invoke-wordexp-with-WRDE_NOCMD.patch |   29 -
 .../0015-usr-sbin-sendmail.patch              |   36 -
 .../0101-fix-libressl-support.patch           |   55 -
 package/heirloom-mailx/Config.in              |   22 -
 package/heirloom-mailx/heirloom-mailx.hash    |    5 -
 package/heirloom-mailx/heirloom-mailx.mk      |   51 -
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      |   28 +
 ...mplyfied-POSIX-method-to-get-the-bas.patch |   46 +
 ...File.cpp-support-POSIX-basename-call.patch |   55 -
 ...-added-openssl-1.1-compatibility-264.patch |    3 +-
 ...sl-gcm-fix-static-build-with-openssl.patch |    3 +-
 ...ion-without-deprecated-OpenSSL-1.1-A.patch |   42 +
 ...ateManager.cpp-fix-build-with-OpenSS.patch |   41 +
 package/jwt-cpp/Config.in                     |   12 +
 package/jwt-cpp/jwt-cpp.hash                  |    4 +
 package/jwt-cpp/jwt-cpp.mk                    |   18 +
 .../0002-allow-build-with-OpenSSL-4.x.patch   |   56 +
 package/libcoap/Config.in                     |    1 -
 package/libcpprestsdk/Config.in               |   34 -
 package/libcpprestsdk/libcpprestsdk.hash      |    3 -
 package/libcpprestsdk/libcpprestsdk.mk        |   55 -
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch |   36 +
 ...r-opaque-ASN1_STRING-OpenSSL-4-compa.patch |   60 +
 ...stead-of-the-ENGINE-API-on-OpenSSL-4.patch |   64 +
 ...-Port-ossl_srv.c-copies-to-OpenSSL-4.patch |  358 +
 package/libest/Config.in                      |    1 -
 ...eck_host-to-verify-KKDCP-server-cert.patch |  252 +
 ...Improve-future-OpenSSL-compatibility.patch |  327 +
 package/libks/Config.in                       |    1 -
 package/libldns/libldns.mk                    |    8 +-
 package/libopenssl/Config.in                  |   34 -
 package/libopenssl/libopenssl.hash            |    4 +-
 package/libopenssl/libopenssl.mk              |   18 +-
 package/libp11/Config.in                      |    1 -
 package/libp11/libp11.hash                    |    4 +-
 package/libp11/libp11.mk                      |    5 +-
 ...l-fix-OpenSSL-4.0-compatibility-5036.patch |   44 +
 package/librelp/Config.in                     |    1 -
 package/libssh/Config.in                      |    1 -
 .../0001-fix-more-c-17-that-made-it-in.patch  |   53 +
 package/libtorrent-rasterbar/Config.in        |    8 +-
 .../libtorrent-rasterbar.hash                 |    5 +-
 .../libtorrent-rasterbar.mk                   |   22 +-
 ...eLists.txt-only-require-a-C-compiler.patch |   48 +
 ...ly-disable-GCC-diagnostics-in-ocsp.c.patch |   80 -
 ...isable-Wincompatible-pointer-types-f.patch |   54 -
 .../luvi/0002-feat-support-openssl-4.0.patch  |  403 +
 package/luvi/Config.in                        |    1 -
 package/luvi/luvi.hash                        |    2 +-
 package/luvi/luvi.mk                          |    2 +-
 package/mender-artifact/Config.in.host        |   19 -
 package/mender-artifact/mender-artifact.hash  |  106 -
 package/mender-artifact/mender-artifact.mk    |  118 -
 package/mender-connect/Config.in              |   34 -
 package/mender-connect/S43mender-connect      |   53 -
 package/mender-connect/mender-connect.hash    |   35 -
 package/mender-connect/mender-connect.mk      |   60 -
 package/mender-grubenv/Config.in              |   43 -
 package/mender-grubenv/mender-grubenv.hash    |    3 -
 package/mender-grubenv/mender-grubenv.mk      |   90 -
 package/mender-update-modules/Config.in       |  250 -
 .../mender-update-modules.hash                |    3 -
 .../mender-update-modules.mk                  |   77 -
 package/mender/Config.in                      |   45 -
 package/mender/S42mender                      |   44 -
 package/mender/device_type                    |    1 -
 package/mender/mender-client.service          |   13 -
 package/mender/mender.conf                    |   11 -
 package/mender/mender.hash                    |   47 -
 package/mender/mender.mk                      |  110 -
 package/mender/readme.txt                     |  132 -
 package/mender/server.crt                     |   22 -
 ...t-compile-engine-support-if-not-avai.patch |   62 +
 package/mtd/Config.in                         |    1 -
 .../0002-libsnmp-Fix-OpenSSL-4-build.patch    |   99 +
 ...if-compiling-without-Lua-support.-Cl.patch |   29 +
 package/nmap/nmap.hash                        |    6 +-
 package/nmap/nmap.mk                          |    2 +-
 package/ntp/0008-openssl4.patch               |  100 +
 package/omniorb/0001-openssl4.patch           |   63 +
 .../0001-Changes-for-OpenSSL-4.0.0.patch      |  333 +
 package/openssh/openssh.mk                    |    8 +-
 .../0001-configure.ac-disable-Werror.patch    |   32 +
 .../openvmtools/0001-no_cflags_werror.patch   |   18 -
 .../0002-dont-force-cppflags.patch            |   21 -
 ...-not-force-I-usr-include-in-CPPFLAGS.patch |   36 +
 ..._poll-h-to-fix-build-failure-on-musl.patch |  813 --
 ...to-vm_poll.h-to-fix-build-failure-on.patch |  133 +
 ...ns-about-glibc-being-only-libc-imple.patch |   27 +-
 ...e-configure-test-for-struct-timespec.patch |   31 +-
 ...finition-of-ALLPERMS-and-ACCESSPERMS.patch |   35 +-
 ...-test-for-feature-instead-of-platfor.patch |   74 +-
 ...onfigure-test-for-sys-stat.h-include.patch |   21 +-
 ...gfs-fuse-fsutils.h-fix-build-on-mus.patch} |    8 +-
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch |   51 +
 ...on-discards-const-qualifier-from-poi.patch |  148 +
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch |   80 -
 ...GLib-g_free-macro-redefinition-erro.patch} |   11 +-
 ...uthorization-on-incoming-guestOps-re.patch |   41 -
 ...-2025-22247-1100-1225-VGAuth-updates.patch |  383 -
 package/openvmtools/openvmtools.hash          |    3 +-
 package/openvmtools/openvmtools.mk            |   22 +-
 .../0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch     |   39 +
 ...emove-support-for-some-TLS-functions.patch |  197 +
 ...SSLeay-to-support-opaque-ASN1_STRING.patch |  179 +
 ...-removal-of-SSLv2-Client-Hello-suppo.patch |   66 +
 ...Net-SSLeay-OPENSSL_info-return-value.patch |   45 +
 ...r-OPenSSL-4-support-and-update-tests.patch |   94 +
 ...but-if-with-else-to-avoid-duplicate-.patch |   83 +
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch |   48 +
 package/poco/Config.in                        |    1 +
 package/poco/poco.hash                        |    2 +-
 package/poco/poco.mk                          |  100 +-
 package/python3/0011-openssl4-support.patch   | 9807 +++++++++++++++++
 ...1-PROTON-2937-Add-OpenSSL-4.x-compat.patch |   80 +
 package/qt5/Config.in                         |    2 -
 package/qt5/qt5base/0009-openssl4.patch       |   52 +
 package/qt5/qt5base/0010-openssl4.patch       |  139 +
 package/qt5/qt5base/0011-openssl4.patch       |   89 +
 package/qt5/qt5knx/Config.in                  |   12 -
 package/qt5/qt5knx/qt5knx.hash                |    6 -
 package/qt5/qt5knx/qt5knx.mk                  |   15 -
 package/qt5/qt5opcua/Config.in                |    9 -
 package/qt5/qt5opcua/qt5opcua.hash            |   10 -
 package/qt5/qt5opcua/qt5opcua.mk              |   19 -
 ...N1_STRING_get0_data-and-ASN1_STRING_.patch |   48 +
 package/rauc/Config.in                        |    2 -
 package/rauc/rauc.mk                          |    3 +-
 ...emove-Werror-deprecated-declarations.patch |   28 +
 package/resiprocate/Config.in                 |   43 -
 package/resiprocate/resiprocate.hash          |    3 -
 package/resiprocate/resiprocate.mk            |   60 -
 .../0001-Rename-numa.h-to-numa_snort.h.patch  |   79 +
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch |   63 +
 package/snort3/snort3.hash                    |    2 +-
 package/snort3/snort3.mk                      |    2 +-
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |   35 +
 ...001-Fix-build-error-with-OpenSSL-4.0.patch |   42 +
 ...mory-leak-in-OSSL-byteString2oid-863.patch |   49 +
 ...in-EdDSA-PrintableString-handling-85.patch |   98 +
 package/softhsm2/Config.in                    |    1 -
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  |  368 +
 .../0003-Fix-build-with-OpenSSL-4.x.patch     |   33 +
 ...-for-getting-an-ASN1_STRING-s-length.patch |   46 +
 ...sport-Make-it-compatible-with-OpenSS.patch |  193 +
 ...recated-OpenSSL-API-ASN1_STRING_data.patch |   35 +
 ...TRING-and-X509_NAME-access-for-OpenS.patch |   87 +
 package/trousers/0004-openssl4.patch          |   26 +
 ...-Replace-deprecated-OpenSSL-API-ASN1.patch |   49 +
 ...Add-support-for-OpenSSL-Provider-API.patch |  304 +
 package/unbound/Config.in                     |    1 -
 package/unbound/unbound.mk                    |    1 +
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   |   40 +
 package/xtables-addons/Config.in              |    2 +-
 package/xtables-addons/xtables-addons.hash    |    2 +-
 package/xtables-addons/xtables-addons.mk      |    9 +-
 ...-Fix-build-error-with-OpenSSL-4-2024.patch |   57 +
 support/testing/tests/package/test_mender.py  |   72 -
 .../tests/package/test_mender/post-build.sh   |   25 -
 .../rootfs-overlay/etc/mender/artifact_info   |    1 -
 .../rootfs-overlay/usr/bin/fw_printenv        |    6 -
 toolchain/Config.in                           |    7 -
 221 files changed, 18087 insertions(+), 4791 deletions(-)
 delete mode 100644 board/mender/x86_64/genimage-efi.cfg
 delete mode 100644 board/mender/x86_64/linux.config
 delete mode 100644 board/mender/x86_64/mender_grubenv_defines
 delete mode 100644 board/mender/x86_64/overlay/etc/fstab
 delete mode 100644 board/mender/x86_64/overlay/etc/mender/mender.conf
 delete mode 100755 board/mender/x86_64/post-build.sh
 delete mode 100755 board/mender/x86_64/post-image-efi.sh
 delete mode 100644 board/mender/x86_64/readme.txt
 delete mode 100644 configs/mender_x86_64_efi_defconfig
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch
 create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
 create mode 100644 package/boost/0001-fix-process-v2-exit_code-guard-static_asserts-on-MIP.patch
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/0002-Add-check-for-duplicate-definition-of-SIGLOST.patch
 create mode 100644 package/boost/0003-Fix-build.patch
 create mode 100644 package/boost/0004-fix-inconsistent-types-between-declaration-and-defin.patch
 create mode 100644 package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch
 create mode 100644 package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch
 create mode 100644 package/cc-tool/0001-Fix-build-with-Boost-1.89-32.patch
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
 create mode 100644 package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
 delete mode 100644 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
 delete mode 100644 package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
 create mode 100644 package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
 create mode 100644 package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
 create mode 100644 package/grpc/0003-Add-support-for-OpenSSL-4.patch
 delete mode 100644 package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
 delete mode 100644 package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
 delete mode 100644 package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
 delete mode 100644 package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch
 delete mode 100644 package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch
 delete mode 100644 package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch
 delete mode 100644 package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
 delete mode 100644 package/heirloom-mailx/0015-usr-sbin-sendmail.patch
 delete mode 100644 package/heirloom-mailx/0101-fix-libressl-support.patch
 delete mode 100644 package/heirloom-mailx/Config.in
 delete mode 100644 package/heirloom-mailx/heirloom-mailx.hash
 delete mode 100644 package/heirloom-mailx/heirloom-mailx.mk
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
 create mode 100644 package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
 delete mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
 create mode 100644 package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
 create mode 100644 package/jwt-cpp/Config.in
 create mode 100644 package/jwt-cpp/jwt-cpp.hash
 create mode 100644 package/jwt-cpp/jwt-cpp.mk
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
 delete mode 100644 package/libcpprestsdk/Config.in
 delete mode 100644 package/libcpprestsdk/libcpprestsdk.hash
 delete mode 100644 package/libcpprestsdk/libcpprestsdk.mk
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
 create mode 100644 package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
 create mode 100644 package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
 create mode 100644 package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
 create mode 100644 package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
 create mode 100644 package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch
 create mode 100644 package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
 create mode 100644 package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch
 create mode 100644 package/luvi/0001-CMakeLists.txt-only-require-a-C-compiler.patch
 delete mode 100644 package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
 delete mode 100644 package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
 create mode 100644 package/luvi/0002-feat-support-openssl-4.0.patch
 delete mode 100644 package/mender-artifact/Config.in.host
 delete mode 100644 package/mender-artifact/mender-artifact.hash
 delete mode 100644 package/mender-artifact/mender-artifact.mk
 delete mode 100644 package/mender-connect/Config.in
 delete mode 100644 package/mender-connect/S43mender-connect
 delete mode 100644 package/mender-connect/mender-connect.hash
 delete mode 100644 package/mender-connect/mender-connect.mk
 delete mode 100644 package/mender-grubenv/Config.in
 delete mode 100644 package/mender-grubenv/mender-grubenv.hash
 delete mode 100644 package/mender-grubenv/mender-grubenv.mk
 delete mode 100644 package/mender-update-modules/Config.in
 delete mode 100644 package/mender-update-modules/mender-update-modules.hash
 delete mode 100644 package/mender-update-modules/mender-update-modules.mk
 delete mode 100644 package/mender/Config.in
 delete mode 100644 package/mender/S42mender
 delete mode 100644 package/mender/device_type
 delete mode 100644 package/mender/mender-client.service
 delete mode 100644 package/mender/mender.conf
 delete mode 100644 package/mender/mender.hash
 delete mode 100644 package/mender/mender.mk
 delete mode 100644 package/mender/readme.txt
 delete mode 100644 package/mender/server.crt
 create mode 100644 package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
 create mode 100644 package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
 create mode 100644 package/ntp/0008-openssl4.patch
 create mode 100644 package/omniorb/0001-openssl4.patch
 create mode 100644 package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
 create mode 100644 package/openvmtools/0001-configure.ac-disable-Werror.patch
 delete mode 100644 package/openvmtools/0001-no_cflags_werror.patch
 delete mode 100644 package/openvmtools/0002-dont-force-cppflags.patch
 create mode 100644 package/openvmtools/0002-m4-do-not-force-I-usr-include-in-CPPFLAGS.patch
 delete mode 100644 package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
 create mode 100644 package/openvmtools/0003-Rename-poll.h-into-vm_poll.h-to-fix-build-failure-on.patch
 rename package/openvmtools/{0011-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch => 0009-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch} (86%)
 create mode 100644 package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 create mode 100644 package/openvmtools/0011-fix-initialization-discards-const-qualifier-from-poi.patch
 delete mode 100644 package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
 rename package/openvmtools/{0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch => 0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch} (84%)
 delete mode 100644 package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
 delete mode 100644 package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
 create mode 100644 package/perl-net-ssleay/0002-Fix-SSLv3-in-OpenSSL-4.0.0.patch
 create mode 100644 package/perl-net-ssleay/0003-OpenSSL-4.0.0-remove-support-for-some-TLS-functions.patch
 create mode 100644 package/perl-net-ssleay/0004-Fix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch
 create mode 100644 package/perl-net-ssleay/0005-Update-tests-for-removal-of-SSLv2-Client-Hello-suppo.patch
 create mode 100644 package/perl-net-ssleay/0006-Add-default-for-Net-SSLeay-OPENSSL_info-return-value.patch
 create mode 100644 package/perl-net-ssleay/0007-Add-Changes-for-OPenSSL-4-support-and-update-tests.patch
 create mode 100644 package/perl-net-ssleay/0008-Do-not-use-elif-but-if-with-else-to-avoid-duplicate-.patch
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
 create mode 100644 package/python3/0011-openssl4-support.patch
 create mode 100644 package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
 create mode 100644 package/qt5/qt5base/0009-openssl4.patch
 create mode 100644 package/qt5/qt5base/0010-openssl4.patch
 create mode 100644 package/qt5/qt5base/0011-openssl4.patch
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk
 create mode 100644 package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch
 delete mode 100644 package/resiprocate/Config.in
 delete mode 100644 package/resiprocate/resiprocate.hash
 delete mode 100644 package/resiprocate/resiprocate.mk
 create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
 create mode 100644 package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
 create mode 100644 package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
 create mode 100644 package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
 create mode 100644 package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
 create mode 100644 package/trousers/0004-openssl4.patch
 create mode 100644 package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
 create mode 100644 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
 delete mode 100644 support/testing/tests/package/test_mender.py
 delete mode 100755 support/testing/tests/package/test_mender/post-build.sh
 delete mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
 delete mode 100755 support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
