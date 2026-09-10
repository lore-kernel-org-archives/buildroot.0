Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1008C79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B20940382;
	Thu, 10 Sep 2026 19:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oGJJwV3rTf6; Thu, 10 Sep 2026 19:19:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2F00740316
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789067975;
	b=rU79ejvgw50jn+AXW7qG4SwRfdhdqEIdIbeCDKZQ+d6RjPJwh2J27DNXQV8ZNJTrPt3B
	 Fxq3YXaO0JmLq2V2S3Jr4Qaket6oh092GI/7Ut6N/8woO/fwaY97WMOeUS3dofgLviXiI
	 9MBktq3J8sVP6kHn/DsJxQcvYDIgePELU8m1i1M8wDKkD1FvodPazQVS5uLeJcJiZ/94S
	 9+ErRd3z1VHwwr8YoD7e4/OuGr2mrsoHFY9Xq620bLtwsE7JQxAkm7ICsn9xCt7/1pHj4
	 b3YreGRPBA+nJJgHQrWjAWC9H4/HxVc5YUDfgXNhEqmuUpYpBJrTnnTV6adBb9eJq7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789067975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Errors-To:Sender;
	bh=Aqab5ys4HGerjyicYuNYmaGmqX2IdUYCEBYytaTbP8I=;
	b=UF1UmaU9LGmYYsL+oaRm3as/EvMxskbvO8IxValSE0FjkJ0pyny0KzJebSyZMMQVIt8A
	 pKxelqnbUGPE6cnhr4o8bEnRFzZzmcgqB9to31co+csGWnzWafYXZcEfq+nN3OZ2hzADh
	 wMbBadJ36f1YgpilsJkFvCwI0f2WWRV5vjU7fUCW0WTA2Z0xC0nmjr6eu6qQaoOHSxSii
	 EYswdqHE68MrBVBT3MtNWMHD8O6iANpkeUDpweEeBlO4pj54u95khtopFF7M3o9HkATMi
	 0hWNFitv9ygiWLebLV0mI6Bl0x/vC1vi8qrcSX+yrRsxGKSjmL5QCl+SwBH9X6BQaXQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789067975;
	bh=Aqab5ys4HGerjyicYuNYmaGmqX2IdUYCEBYytaTbP8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rzLQ56bXmU4U7O3uVgO2ZfC72H0/FHxGFX0Uv3RSINxzwKCBSlgIMBFPriv39y7mT
	 T7fwzZufQwMw56xeCjTMALciglrxemJfCA4jq8Nqgt59caCEtDr8dMB1SdyPhScix/
	 G0YzsowEHJbEuKtXpB2925aZBFqXdxsnO3KOMlTuTyScMrWXhUD1cIQ5TSyPWPbP1W
	 4+6IQDicQ45MYjavRrHda56SQLpbcWTgowb/D+sCtY4Qj2lIGLOFXXf5pSGLboQ5h3
	 I7GMZcfQXAtlz8YNSdfmV/GcEzR9BAa00AQvJtPb86/ht97Qfz5FnNok/p0INM4BCl
	 bWBiKlEU+yjlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F00740316;
	Thu, 10 Sep 2026 19:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CDF343F;
 Thu, 10 Sep 2026 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A2F360645;
 Thu, 10 Sep 2026 19:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ip0DwT2vljgo; Thu, 10 Sep 2026 19:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DC7D9605CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789067972;
 b=nmhhTtQ+bYNitB3BDGG5/HNp4flwiGTiJJp1yYKp3/OKz1S1aNyz2WFeGkATU65sUPUr
 TXu2xFxUm4/5n4siF9J203unXVKPs8fwgqgpoTt82pcYeeMM4SSRdeUdmbXWoMAWZfBT3
 FKMenc+1wPPsniLlWQw3KR3JtqXbFZ1EdLvoywMVknTPkcTz72pVVVIVP8ZhE+O7gbZGS
 JBvgnhg5Cn4UZmWcuCPMsm33sQUrPhk76F/7LGUg32OSTefbfdRi8khNveYFEBhoPNjXv
 G1iuu8oKZmNuHoDe8Fqmq3DvwrWphquZnLvcCe7CpOy/C97CNg6Sv1FBjvyU8evDr1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789067972;
 h=Received-SPF:Received:DKIM-Signature:From:To:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=P/irr6E9FokCm9MRwzgis78U6ccSLC16jjBjSO0yB8I=;
 b=WHV5wohSLaDNTWA8kAyv0+cqOdqOfxEBPQP66YcbwQug1x4lq2sRDdbMfvlkQVluH3Jo
 9patbOnOy7JDnxs2DygIpPmjmXIvLw9redo16aoBy2aIWZId4QtCw0jzN690HPo/YAnUL
 4+DCPxRSu/AgPqhmNSqS/dlQ/B3uMcXyagH9XKdWvms6Xzck7nxKCdQs4bNVEqpltHp1l
 NRas+0cbzw6UhVT0ldqCE/pJK9k98XvOGr7TcThTcyAR8DniLL7at+684TjFFMRNXajfH
 ZBEAWaOJRCidvDE0PqSOg2EkgrVT8NJkLUiRu0lIO0pGFuaGiIE23F11yxeLnz/cpEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=rnout.be; 
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="TxKyKw2/"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC7D9605CB;
 Thu, 10 Sep 2026 19:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2326B978A0A; Thu, 10 Sep 2026 21:19:28 +0200 (CEST)
To: buildroot@buildroot.org, buildroot-lts-sponsors@buildroot.org,
 buildroot-users@buildroot.org
Date: Thu, 10 Sep 2026 21:19:27 +0200
Message-ID: <buildroot-2025.02.18-announce-1789067743@buildroot.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] Buildroot 2025.02.18 released
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: multipart/mixed; boundary="===============7317960130118397248=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7317960130118397248==
Content-Transfer-Encoding: 8bit

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(https://buildroot.org).

Buildroot 2025.02.18 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2025.02.18.tar.gz

or

https://buildroot.org/downloads/buildroot-2025.02.18.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2025.02.18 tag)

Buildroot 2025.02.18 is a bugfix release, fixing a number of important /
security related issues discovered since the 2025.02.17 release.

Important / security related fixes:

avro-c: (no CVE assigned)
clamav: CVE-2026-20031, CVE-2026-20213, CVE-2026-20214, CVE-2026-20215,
  CVE-2026-20216, CVE-2026-20217, CVE-2026-20243, CVE-2026-20244,
  CVE-2026-20339, CVE-2026-20345, CVE-2026-20346, CVE-2026-20347,
  CVE-2026-20348
dnsmasq: CVE-2026-12725, CVE-2026-12969
erlang: CVE-2026-21620, CVE-2026-23941, CVE-2026-23942, CVE-2026-23943,
  CVE-2026-28810, CVE-2026-32147, CVE-2026-42789, CVE-2026-42790
exiv2: CVE-2026-49275, CVE-2026-68546, CVE-2026-68547,
  GHSA-3695-mjv8-3r52, GHSA-9v3x-mhg4-wwv2, GHSA-fgw8-p7pr-37cp,
  GHSA-hxph-pv7w-8649, GHSA-jcgh-p9v3-pw6j, GHSA-vg6c-9f6h-4x5q
expat: CVE-2026-66046, CVE-2026-76641, CVE-2026-76956, CVE-2026-76957
glibc: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435, CVE-2026-6238,
  CVE-2026-6368, CVE-2026-6791, CVE-2026-77117, CVE-2026-80489
go: CVE-2026-33818, CVE-2026-39821, CVE-2026-46600, CVE-2026-56853,
  CVE-2026-56858, CVE-2026-56859, CVE-2026-56860, CVE-2026-56862,
  CVE-2026-56864, CVE-2026-56865
haproxy: (no CVE assigned)
hostapd: CVE-2026-58374
libcurl: CVE-2026-13608, CVE-2026-18924, CVE-2026-19931,
  CVE-2026-80229, CVE-2026-80230, CVE-2026-80231, CVE-2026-80255,
  CVE-2026-82208, CVE-2026-82209
libde265: GHSA-mm7m-v26f-wf8x, GHSA-xp3h-6f5r-8cxp
libgit2: CVE-2026-5917
libheif: CVE-2026-84450, CVE-2026-84451, GHSA-24wx-9w62-c96w,
  GHSA-2jg2-4ch7-h545, GHSA-4h82-g446-83fm, GHSA-4jqm-2x34-6f6r,
  GHSA-73p7-m7gg-w2jv, GHSA-8857-r8x5-7499, GHSA-8fmq-r4pf-7m57,
  GHSA-9rj8-5mp5-26c9, GHSA-g89c-p67h-r497, GHSA-gh5q-69gg-c964,
  GHSA-hh47-fhqr-cj2r, GHSA-j264-xvrp-5v7q, GHSA-jc8f-p23p-5hjg,
  GHSA-mw6f-29j3-76f4, GHSA-p58j-h3vm-3fp5, GHSA-w7mc-p8jc-p853,
  GHSA-x8r2-mggj-j6wr, GHSA-x8xm-cm2c-cfc8, GHSA-xw34-mjcp-jqh8
libldns: CVE-2026-10846
libopenssl: CVE-2026-14456, CVE-2026-14457, CVE-2026-18798,
  CVE-2026-54874, CVE-2026-63072, CVE-2026-63073, CVE-2026-63074,
  CVE-2026-63075, CVE-2026-63076, CVE-2026-75803
libssh2: CVE-2025-15661, CVE-2026-66032, CVE-2026-66033,
  CVE-2026-66034, CVE-2026-66035
libxml2: CVE-2026-11979
localedef: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435,
  CVE-2026-6238, CVE-2026-6368, CVE-2026-6791, CVE-2026-77117,
  CVE-2026-80489
mongoose: CVE-2026-63626, CVE-2026-73251, CVE-2026-73252,
  CVE-2026-73260, CVE-2026-73261
nodejs: CVE-2026-56846, CVE-2026-56847, CVE-2026-56848, CVE-2026-56850,
  CVE-2026-58039, CVE-2026-58040, CVE-2026-58042, CVE-2026-58043,
  CVE-2026-58044, CVE-2026-58045
openvpn: CVE-2026-84732
proftpd: CVE-2026-44331
python-avro: (no CVE assigned)
redis: (no CVE assigned)
rsyslog: CVE-2026-19654
udisks: CVE-2026-7867
unbound: CVE-2026-14586, CVE-2026-32665, CVE-2026-40622,
  CVE-2026-40691, CVE-2026-41637, CVE-2026-42955, CVE-2026-44621,
  CVE-2026-44687, CVE-2026-44690, CVE-2026-46582, CVE-2026-50045,
  CVE-2026-50046, CVE-2026-50243, CVE-2026-50248, CVE-2026-50251,
  CVE-2026-50252, CVE-2026-52863, CVE-2026-54478, CVE-2026-55708,
  CVE-2026-55717, CVE-2026-55973, CVE-2026-55990, CVE-2026-55991,
  CVE-2026-56416, CVE-2026-56444
wget: CVE-2026-58469, CVE-2026-58470, CVE-2026-58471

Toolchain:

- linux-headers: bump to 5.10.269, 5.15.220, 6.1.187, 6.6.156, 6.12.109
- powerpc: correctly track libquadmath

Infrastructure updates/fixes:

- Various fixes to the runtime tests
- manual: document move of patchwork to patchwork.buildroot.org
- manual: document the LTS release cadence correctly
- Fix setting of stack size for FLAT binaries

Updated defconfigs: qemu_xtensa_lx60*

Updated / fixed packages: avro-c, bind, clamav, collectd, dejavu,
  dnsmasq, dpdk, dracut, erlang, exiv2, expat, gcc-bare-metal, gdb,
  glibc, go, haproxy, hostapd, libcurl, libde265, libgit2, libheif,
  libldns, libopenssl, libssh2, libxkbcommon, libxml-parser-perl,
  libxml2, linux, linux-headers, linux-tools, localedef, mongoose,
  mosquitto, newt, nodejs, opencv4, openssh, openvpn, perl, powerpc,
  proftpd, python-avro, python-charset-normalizer, qt5knx,
  qt6declarative, redis, rsyslog, taglib, uclibc, udisks, unbound, vim,
  webkitgtk, wget, wine, wireless-regdb

For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.18/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2025.02.17..

    28	Titouan Christophe
    13	Thomas Petazzoni
    12	Bernd Kuhls
     9	Stefan Müller
     7	Thomas Perale
     5	Julien Olivain
     4	Peter Korsgaard
     4	Waldemar Brodkorb
     3	Robert P. J. Day
     3	Romain Naour
     3	Thomas Devoogdt
     2	Alsey Coleman Miller
     2	Arnout Vandecappelle
     2	Raphaël Mélotte
     1	Adam Ford
     1	Alessandro Rubini
     1	Alexis Lothoré
     1	Benjamin DeCamp
     1	Fengwei Tan
     1	Fiona Klute (othermo GmbH)
     1	Franciszek Stachura
     1	Fred Lefranc
     1	Giulio Benetti
     1	Jimmy Durand Wesolowski
     1	Luca Ceresoli
     1	Marcus Hoffmann
     1	Martin Bachmann
     1	Nicolas Cavallari
     1	Sébastien Szymanski
     1	Yann E. MORIN

Regards,
Arnout

--===============7317960130118397248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7317960130118397248==--
