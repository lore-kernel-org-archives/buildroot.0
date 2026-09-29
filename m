Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F853CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5C280EF6;
	Tue, 29 Sep 2026 18:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ49ul0F2KlE; Tue, 29 Sep 2026 18:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 84B6080F00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790706974;
	b=pkvNhPiJK6ChEB6xl16vdromM+u/mpVxEesKaCWGFdneKMghO1ea0A3ns3XRLZLm91c2
	 AzUvtDStiyoIWwsyDU6g1K03z2JWRTR6IzRr5mXdaukYODoZJJYWAbAbeVqFQLjPXkOc7
	 z9Gp6xRnFu1Oipmpvh1i8meLDN/6oT+r4+0R405jrNRBiE/UfWeUmL4B1X9oqzu7Ew4F2
	 60AHbLzCDCQEMxJWQmdelWCUNC7NPfVeWlq5dX05UkcdqsMf3bvhXA9I+fg/CFzcrdiQn
	 3T3KCg2ID+31E8kx5VH7n6MENMUjmZWBIHtVE7RQBrfC46Drxw+MkEaOkvq79nlEmsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790706974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=po023APIYR+SQzTQzLKfC6go1D6iE+Bz47DcIvPgqRs=;
	b=dnHASpE09R1fqHhm88EQuZhqK6e013VfqWGzBlL1OR9POye6VmCB9G/i5iZ7XRGHyflr
	 KHBSV5bYuWfssfBDWrkBlfhWTdSoLodz9mSJ4GEHxnQSnjReDOjhhj0coRCPj0M/WuYpq
	 umCdaBmiwzlQn1ADi3UBhbXe7pd0RmbgDgBfOB9kCfL0Digjt/CSKfwF8E2CVKXJOWH24
	 bPkZj2J/waF1wSvMfa7Vqug4BAZCtRoLiH1r1ZL5YVAKm6lvqTC6Wy33IBTSgSKMiH9Tl
	 9G6nfR1RA+Z43FFridvk3ExLuWiC4DUTNpXlZfo7+SxsbbpBGVD8z7+eaFspCECMxrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790706974;
	bh=po023APIYR+SQzTQzLKfC6go1D6iE+Bz47DcIvPgqRs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fp0stYQLr8udKvTwd6FoY1RK6prtVuKZGUF2ihMAYtQkd5ljmrEmRZRA901iBuzMU
	 lMq5zAnVawR1nAuB09BHVKfGq/JCOuvwaVz3+Q/3mRQRIm5u2oMhZG94Gb1RyOBrfp
	 Jr7PlErmK+u5o8v9Sza3U+Xg6OjYjjO4QEFyhIDpBxso8AgDjgPoMQSX2KqxzSmkjw
	 P46B1kL+Au4u+TcpecmZOeBS6Y6IQ3UHvuw/sdAVbIatsk47F1Gq4JnZlCRJgLPc7z
	 JyWC5bDhyy5K/ijozpft1bAhjP5mzklZQgDGwXWXaxnCrXKHped1IH/csuHQsm5j8S
	 tKr2//0cI7klg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B6080F00;
	Tue, 29 Sep 2026 18:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D95FA3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C97F04065B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dER_0SyL30Ze for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:36:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BC716405C9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790706971;
 b=OZmFTyYKOydpqz5sHrKgspb82q9aXlWQUTcym0ftrOtDix85x2Q2bCvOgf9knJ3+rbjH
 wdT47J4xgS3P/hLRdNu7z4OMNC4o6g/ij4nuJUSkjySjEPXpPKztj95CI6Iv83H9CIlLU
 uebAuMyNvS5Qwgk8/NuFVJz7KOavpc+cNj99f3pbwqr0A7JSW6Y4I3h3YJjOqSTxJRLj+
 x8cShU9gP1Xst4lF1v87PK+Pi88ReoGBl7gLtaxu6ZOZfRvxcLQ/IMYJngmYZHANCtdSc
 Ju+wC2+MUYb5SGgMLZWND7wXBkDHnhF0orRvlolOKKUludR8b90/CoCE5z+PTIROgqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790706971;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bhQjXOb59l8jfz6gn05cq7lKA91u6MOpIHq/dqBsU3k=;
 b=OUfm+g91xTw0PYPV84ch4lSPR7lPes2I5fnjafjAl0aaSrenlfxuUWq0hxMTD7eWBI5r
 hqB4W7yWu+yS+Iv+yTKW7qCm74ElXa7TQVA+4jczm87Kc21LDsxROMdau9SCJFVfmFVMk
 LimrTNlFnUQAiJSAoGGxdSeO2WiZpO3/NDp1BK8Uz2YHf22T93WpnRcGaxf/aal5ih28h
 pqcM6/g5segS0DDaO+jqKOEoZcj0coBnsWPYEo+cC865LuGA0ZDkN3Jiv5uS+FRVFO+UL
 3001Ma/lzkR3f0I0pzQsDAZ/MniNe4K5qllal3QD0TpQ+8m6iGEJuJqJjnVZqxYPQDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Tqf7Lvsk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Tqf7Lvsk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC716405C9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706967;
 bh=bhQjXOb59l8jfz6gn05cq7lKA91u6MOpIHq/dqBsU3k=;
 h=From:To:Subject:Date:From;
 b=Tqf7Lvsk4cE4e/BFqjIbYMdlbgqTfH9Dr7zacPSn+wnV4E9sULgBIljhd1YF3Ar7V
 tXQV2ioO+dLMdLdz1HGjzCXhZXY47NqNv/L+EMZT5TB3PhljNIknw5tJGwNGaWH01e
 YnjQ3ppf5sjKMJYIh2CNLcTyfC3jucn3ffYwt3G5+a0QskmiL/jNJ2So0HI3+Q7sZN
 yMWSbp5p7YgZz6yEKfly8h2Muq3PzY/OVsK65iCaVLSx1KTjiT3I0TWnWo9X0hmfTG
 kXGuVl/LEu03rsBs+oeB/30V5g6XfTgHWTn6592SCnyQrVyRVoybYEDc8AfFeaEEoO
 +yk4LUmr+4+vw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 Vm0fBbZH73RmywuefIOsncBLuKPn+KleUOfKq9Mz2moviiHlZepQcRbVhXuX8udzbYaKSRknyzm
 wni8wsR+3EYz9EzzQvXvHMXbE4zMkW2ub5Cs9ioBxOMM9kgzpv5u8Cy+i5241rvaxpy+xUhi7vV
 xeI7V783X5iEh4pMr/Ek7Hlx4ZHnmpql1uYtPeTOhQV/cC4n63nz5btweJZwHkTJf6SYQnsvVf9
 P6LjMCNI+7+jKh+GplJvOvbU8L1fDxMoUweGoDsBSwjFACgXY3XMLSAj6xooGrb8VAiU8JgIuGz
 Qa9dJKoOuyaCwcWpj+m6Umzp9Svn5e5mDAG97g5boYNdstM6Wj0y3X0MabFuQZz0UQUsQNprAzG
 iOYH8f3cOwBWgGkO2h5GQU9IiZapZJ3aOvIeCLJUPCxASPQu60D3dKFM5gBOG9Lt8vwXvL+M2G8
 wrxS7i1HqkWpvY1LVr332Y2g1Fn5ejpn/NMLDRIueye9iLapr948ZPkyaskXgcRMut5Ajv9EyPD
 0h2c6ZMSAIpcOwTgovV4FPjVczb1YRJ+VaJQIk0YOWsvrL0Mvc=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB604A4C47D6
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:36:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgQ-000000006Jn-3TdB
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:34:59 +0200
Message-ID: <20260929183607.1849293-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v7 00/66] package/libopenssl: bump version to
 4.0.3
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

Hi,

this series bumps libopenssl to version 4.0.3.

It consists of the following parts:

0001-0003: package removals
0004-0026: version bumps that provide compatibility with OpenSSL 4.x
           0004-0021 belong to the boost patch series
0027-0065: upstream fixes for packages without a released version that
           provides compatibility with OpenSSL 4.x
           The luvi package needs to be bumped first so the upstream fix
           for OpenSSL 4.x can be applied
0066:      bump libopenssl to 4.0.3

None of the patches 0001-0081 depend on the libopenssl bump, they all
build fine with libopenssl 3.6.x.

Regards, Bernd

v7:
- rebased
- added output of 'utils/get-developers --cc' to individual patches to
  avoid sending the whole series to all devs (Thomas)
- bumped libopenssl to 4.0.3
- removed qt6/qt6opcua as well (to-do from v3)
- please note that this series depends on the security bump of
  libopenssl to 3.6.5:
  https://patchwork.buildroot.org/project/buildroot/patch/20260929175300.1838821-1-bernd@kuhls.net/

v6:
- rebased
- created PR for package/squid/0001*.patch
- added OpenSSL fix for mender-artifact
- added Michael's boost series:
  https://lists.buildroot.org/pipermail/buildroot/2026-September/810503.html

v5:
- rebased
- fixed mender build by using an Ubuntu patch

v4, only minor changes, not sent CC to all maintainers:
- renumbered patches in cover letter
- added Upstream: tag to patch package/resiprocate/0001
- mentioned resiprocate changes in v3

v3:
- rebased
  the current tree, also containing unrelated build fixes, can be found
  here:
  https://gitlab.com/bkuhls/buildroot/-/commits/c60dc5542041aef205b874e875a3da582ebb6811
- added systemd fix
- removed resiprocate removal, bumped to 1.14.0 and added OpenSSL fixes
- removed mender removal for the time being from the series
  the tree mentioned above still contains the removal, then the revert
  of the removal and Adam's bump to 5.1.0 which is broken with the bump
  to OpenSSL 4.0.2:
  https://lists.buildroot.org/pipermail/buildroot/2026-September/810147.html

v2:
- squashed BR2_TOOLCHAIN_HAS_GCC_BUG_101916 removal into
  heirloom-mailx removal patch
- added qt6 bump which also fixes build with OpenSSL 4.0


Bernd Kuhls (51):
  package/qt5/qt5knx: remove package
  package/qt5/qt5opcua: remove package
  package/qt6/qt6opcua: remove package
  package/domoticz: bump version to 2026.3
  package/libtorrent-rasterbar: bump version to 2.1.1
  package/boost: bump version to 1.92.0
  package/dovecot{-pigeonhole}: security bump version to 2.4.5
  package/nmap: bump version to 7.991
  package/openvmtools: bump version to 13.1.0
  package/poco: bump version to 1.15.3
  package/resiprocate: security bump version to 1.14.0
  package/resiprocate: Fix build with OpenSSL 4.0.0
  package/snort3: fix build error with numa support
  package/snort3: Fix build with OpenSSL 4.0.0
  package/xtables-addons: use kernel-module infra
  package/xtables-addons: bump version to 3.31
  package/apache: Add support for OpenSSL 4.0.0
  package/boinc: Fix build with OpenSSL 4.0.0
  package/ca-certificates: Replace c_rehash with openssl rehash
  package/clamav: Fix build with OpenSSL 4.0.0
  package/freeradius-server: Add support for OpenSSL 4.0.0
  package/freeswitch: Add support for OpenSSL 4.0.0
  package/ibm-sw-tpm2: Fix build with OpenSSL 4.{0, 1}
  package/ibrdtnd: Fix build with OpenSSL 4.0.0
  package/lftp: Add support for OpenSSL 4.0.0
  package/libesmtp: Fix build with OpenSSL 4.0.0
  package/libkrb5: Add support for OpenSSL 4.0.0
  package/luvi: fix build without c++
  package/luvi: bump version to 102-g9fa6c141a
  package/luvi: Fix build with OpenSSL 4.0.0
  package/mender-artifact: Fix build with OpenSSL 4.0.0
  package/perl-net-ssleay: Add support for OpenSSL 4.0.0
  package/python3: Add support for OpenSSL 4.0.0
  package/qpid-proton: Fix build with OpenSSL 4.0.0
  package/qt5/qt5base: Add support for OpenSSL 4.0.0
  package/rauc: Fix build with OpenSSL 4.0.0
  package/redis: Fix build with OpenSSL 4.0.0
  package/socat: Add support for OpenSSL 4.0.0
  package/sofia-sip: Fix build with OpenSSL 4.0.0
  package/softhsm2: Fix build with OpenSSL 4.0.0
  package/squid: Fix build with OpenSSL 4.0.0
  package/sudo: Add support for OpenSSL 4.0.0
  package/systemd: Fix build with OpenSSL 4.0.0
  package/thrift: Fix build with LibreSSL and OpenSSL 4.x
  package/thrift: Fix build with OpenSSL 4.0.0
  package/tpm2-openssl: Fix build with OpenSSL 4.0.0
  package/trousers: Fix build with OpenSSL 4.0.0
  package/uboot-tools: Fix build with OpenSSL 4.0.0
  package/xmrig: Add support for OpenSSL 4.0.0
  package/znc: Fix build with OpenSSL 4.0.0
  package/libopenssl: bump version to 4.0.3

Michael Nosthoff (15):
  package/boost: add new charconv and cobalt library
  package/boost: add switch for boost-process
  package/boost: program_options needs container
  package/boost: thread needs more dependencies
  package/boost: contract needs thread
  package/boost: fix coroutine dependencies
  package/boost: fiber needs exception
  package/boost: update graph dependencies
  package/boost: math needs container
  package/boost: log needs serialization
  package/boost: test needs exception
  package/boost: wave needs thread
  package/boost: update locale dependencies
  package/boost: update C++ version dependencies
  package/boost: system: update description

 .checkpackageignore                           |   10 +-
 Config.in.legacy                              |   57 +
 DEVELOPERS                                    |    3 -
 docs/manual/migrating.adoc                    |    6 +
 .../0004-modules-md-Merge-from-icing-md.patch |   57 +
 package/apr-util/Config.in                    |    1 -
 ...fix-a-build-failure-with-openssl-4.0.patch |   26 +
 ...xit_code-guard-static_asserts-on-MIP.patch |   59 +
 .../0001-unordered-fix-copy-assign.patch      |   22 -
 ...-for-duplicate-definition-of-SIGLOST.patch |   30 +
 package/boost/0003-Fix-build.patch            |   39 +
 package/boost/0004-Fix-build.patch            |   40 +
 package/boost/0005-Fix-build.patch            |   64 +
 package/boost/Config.in                       |  190 +-
 package/boost/boost.hash                      |    4 +-
 package/boost/boost.mk                        |   10 +-
 package/ca-certificates/ca-certificates.mk    |    4 +-
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch |  136 +
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
 package/fluent-bit/Config.in                  |    1 -
 ...ING-functions-for-OpenSSL-4.0-compat.patch |   80 +
 package/freeswitch/freeswitch.mk              |    5 +
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      |   28 +
 ...ateManager.cpp-fix-build-with-OpenSS.patch |   41 +
 .../0002-allow-build-with-OpenSSL-4.x.patch   |   56 +
 package/libcoap/Config.in                     |    1 -
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch |   36 +
 ...eck_host-to-verify-KKDCP-server-cert.patch |  252 +
 ...Improve-future-OpenSSL-compatibility.patch |  327 +
 package/libks/Config.in                       |    1 -
 package/libldns/libldns.mk                    |    8 +-
 package/libopenssl/Config.in                  |   34 -
 package/libopenssl/libopenssl.hash            |    4 +-
 package/libopenssl/libopenssl.mk              |   18 +-
 package/libp11/Config.in                      |    1 -
 package/libp11/libp11.mk                      |    3 +-
 package/librelp/Config.in                     |    1 -
 package/libssh/Config.in                      |    1 -
 .../0001-fix-more-c-17-that-made-it-in.patch  |   53 +
 package/libtorrent-rasterbar/Config.in        |    8 +-
 .../libtorrent-rasterbar.hash                 |    5 +-
 .../libtorrent-rasterbar.mk                   |   22 +-
 package/log4cxx/Config.in                     |    5 +
 ...eLists.txt-only-require-a-C-compiler.patch |   48 +
 ...ly-disable-GCC-diagnostics-in-ocsp.c.patch |   80 -
 ...isable-Wincompatible-pointer-types-f.patch |   54 -
 .../luvi/0002-feat-support-openssl-4.0.patch  |  403 +
 package/luvi/Config.in                        |    1 -
 package/luvi/luvi.hash                        |    2 +-
 package/luvi/luvi.mk                          |    2 +-
 .../0001-openssl-v4-update.patch              |  180 +
 package/mender/Config.in                      |    1 -
 package/mtd/Config.in                         |    1 -
 ...if-compiling-without-Lua-support.-Cl.patch |   29 +
 package/nmap/nmap.hash                        |    6 +-
 package/nmap/nmap.mk                          |    2 +-
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
 package/poco/poco.hash                        |    2 +-
 package/poco/poco.mk                          |    2 +-
 package/python-libconfig/Config.in            |    5 +-
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
 package/qt6/Config.in                         |    1 -
 package/qt6/qt6opcua/Config.in                |   14 -
 package/qt6/qt6opcua/qt6opcua.hash            |   10 -
 package/qt6/qt6opcua/qt6opcua.mk              |   40 -
 ...N1_STRING_get0_data-and-ASN1_STRING_.patch |   48 +
 package/rauc/Config.in                        |    2 -
 package/rauc/rauc.mk                          |    3 +-
 ...emove-Werror-deprecated-declarations.patch |   28 +
 ...precated-OpenSSL-calls-fix-upcoming-.patch |  597 +
 ...aining-build-errors-with-OpenSSL-4.x.patch |   47 +
 package/resiprocate/Config.in                 |    4 +
 package/resiprocate/resiprocate.hash          |    2 +-
 package/resiprocate/resiprocate.mk            |    2 +-
 .../0001-Rename-numa.h-to-numa_snort.h.patch  |   79 +
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch |   63 +
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |   35 +
 ...001-Fix-build-error-with-OpenSSL-4.0.patch |   42 +
 ...mory-leak-in-OSSL-byteString2oid-863.patch |   49 +
 ...in-EdDSA-PrintableString-handling-85.patch |   98 +
 package/softhsm2/Config.in                    |    1 -
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  |  368 +
 ...-for-getting-an-ASN1_STRING-s-length.patch |   46 +
 ...compilation-with-openssl-4.0.0-beta1.patch |   86 +
 ...sport-Make-it-compatible-with-OpenSS.patch |  193 +
 ...recated-OpenSSL-API-ASN1_STRING_data.patch |   35 +
 ...TRING-and-X509_NAME-access-for-OpenS.patch |   87 +
 package/trousers/0004-openssl4.patch          |   26 +
 ...Add-support-for-OpenSSL-Provider-API.patch |  304 +
 package/unbound/Config.in                     |    1 -
 package/unbound/unbound.mk                    |    1 +
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   |   40 +
 package/xtables-addons/Config.in              |    2 +-
 package/xtables-addons/xtables-addons.hash    |    2 +-
 package/xtables-addons/xtables-addons.mk      |    9 +-
 package/zmqpp/Config.in                       |    5 +-
 ...-Fix-build-error-with-OpenSSL-4-2024.patch |   57 +
 145 files changed, 16163 insertions(+), 2113 deletions(-)
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
 create mode 100644 package/boost/0001-fix-process-v2-exit_code-guard-static_asserts-on-MIP.patch
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/0002-Add-check-for-duplicate-definition-of-SIGLOST.patch
 create mode 100644 package/boost/0003-Fix-build.patch
 create mode 100644 package/boost/0004-Fix-build.patch
 create mode 100644 package/boost/0005-Fix-build.patch
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
 create mode 100644 package/dovecot/0001-Revert-lib-var-expand-crypt-Link-test-binary-statica.patch
 delete mode 100644 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
 delete mode 100644 package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
 create mode 100644 package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
 create mode 100644 package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
 create mode 100644 package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch
 create mode 100644 package/libtorrent-rasterbar/0001-fix-more-c-17-that-made-it-in.patch
 create mode 100644 package/luvi/0001-CMakeLists.txt-only-require-a-C-compiler.patch
 delete mode 100644 package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
 delete mode 100644 package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
 create mode 100644 package/luvi/0002-feat-support-openssl-4.0.patch
 create mode 100644 package/mender-artifact/0001-openssl-v4-update.patch
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
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
 delete mode 100644 package/qt6/qt6opcua/Config.in
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.hash
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.mk
 create mode 100644 package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch
 create mode 100644 package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch
 create mode 100644 package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch
 create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
 create mode 100644 package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
 create mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
 create mode 100644 package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
 create mode 100644 package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
 create mode 100644 package/trousers/0004-openssl4.patch
 create mode 100644 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
