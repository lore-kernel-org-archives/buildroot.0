Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3E4F94CB1
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 21:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE99D84133;
	Tue, 21 Apr 2026 21:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bNPrsfGYnFK; Tue, 21 Apr 2026 21:08:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0664E8413B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776805707;
	bh=rhFemKrtufc+FkvBjmQ24inRPbCEnascHny7ff8hQ+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kqmPpxvCBrDPhjnpT2IyfxQuj3As1p13MAmIyur8NzTHpPLpYoHRVK/6R2icdSTOL
	 ctR6QHa5VgMfFKTOKJsZL3FB1wwhGCZnxorK9kfWfBHFFdP9c28aLtnPPicT72ZEKz
	 PJ4GQPE5KWq80EG2fXM945IrfQdWmsvJcB6xoLtd/feNPnTKyytd7rtqbecHnuYyes
	 VHxMUlaEsycAeF6eLf15ofoJGFsQBmc8/2RcoKXLwXbW4lnup1ycA6GmIMAKrxgnKq
	 3WlGQ1Ptv8dNDL2D07ATFcej+jNS2IrsPhcy6TeBF1yS+iQSzBB9cBw6dcbITNFrWH
	 IBhWY/mCHETrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0664E8413B;
	Tue, 21 Apr 2026 21:08:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1662C259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0890C40428
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvDq624opdzY for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 21:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C4440131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32C4440131
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC873821FD; Tue, 21 Apr 2026 21:08:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 23:03:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b1aeefe2c930c470b1ca22ccdc1bb95f76444cf
X-Git-Newrev: cab48e7f14062a093c7db6a3df0a17d2ebf6ac05
X-Patchwork-Hint: ignore
Message-Id: <20260421210822.CC873821FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2025.02.13
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cab48e7f14062a093c7db6a3df0a17d2ebf6ac05
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit 79aa477a56a46b080f797ddfc5bb56d1a184bc6f)
---
 CHANGES | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/CHANGES b/CHANGES
index 17ce1fdec4..df2bdbacbb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -989,6 +989,89 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.13, released April 21, 2026
+
+	Changes with potentially large impact:
+
+	- openssl was updated to 3.5.0 which has a few incompatible changes.
+	  See https://github.com/openssl/openssl/releases/tag/openssl-3.5.0
+
+	Important / security related fixes:
+
+	asterisk: CVE-2026-23739, CVE-2026-23741, CVE-2026-23738,
+	  CVE-2026-23740
+	bind: https://gitlab.isc.org/isc-projects/bind9/-/issues/5751,
+	  CVE-2026-1519, https://gitlab.isc.org/isc-
+	  projects/bind9/-/issues/5817, https://gitlab.isc.org/isc-
+	  projects/bind9/-/issues/5800, https://gitlab.isc.org/isc-
+	  projects/bind9/-/issues/5826
+	cpp-httplib: CVE-2026-33745, CVE-2026-34441, CVE-2026-21428,
+	  CVE-2026-22776, CVE-2026-28434, CVE-2026-28435, CVE-2026-29076,
+	  CVE-2026-31870, CVE-2026-32627
+	expat: CVE-2026-32776, CVE-2026-32777, CVE-2026-32778
+	gpsd: CVE-2025-67268, CVE-2025-67269
+	libarchive: [no CVE tracking]
+	libcurl: CVE-2026-3805, CVE-2026-3784, CVE-2026-3783, CVE-2026-1965
+	libde265: CVE-2026-33164, CVE-2026-33165
+	libheif: CVE-2025-68431
+	libmicrohttpd: CVE-2025-59777, CVE-2025-62689
+	libopenssl: CVE-2025-9230, CVE-2025-9231, CVE-2025-9232, CVE-2025-4575,
+	  CVE-2025-11187, CVE-2025-15467, CVE-2025-15468, CVE-2025-15469,
+	  CVE-2025-66199, CVE-2025-68160, CVE-2025-69418, CVE-2025-69419,
+	  CVE-2025-69420, CVE-2025-69421, CVE-2026-22795, CVE-2026-22796,
+	  CVE-2026-31790, CVE-2026-2673, CVE-2026-28387, CVE-2026-28388,
+	  CVE-2026-28389, CVE-2026-28390, CVE-2026-31789
+	libpng: CVE-2026-33416, CVE-2026-33636, CVE-2026-34757,
+	  GHSA-6fr7-g8h7-v645
+	libxml2: CVE-2026-1757, CVE-2026-0990, CVE-2026-0992, CVE-2025-10911,
+	  CVE-2026-0989
+	mongoose: CVE-2025-65502
+	musl: CVE-2025-26519
+	nfs-utils: CVE-2025-12801
+	nghttp2: CVE-2026-27135
+	perl: CVE-2026-4176
+	python-django: CVE-2026-25673, CVE-2026-25674
+	python-flask: CVE-2026-27205
+	python-pyasn1: CVE-2026-23490
+	python-pyjwt: CVE-2026-32597,  GHSA-752w-5fwx-jx9f
+	python-tornado: CVE-2025-67724, CVE-2025-67725, CVE-2025-67726
+	python-wheel: CVE-2026-24049
+	quickjs: CVE-2025-62490, CVE-2025-62491, CVE-2025-62492,
+	  CVE-2025-62493, CVE-2025-62494, CVE-2025-62495, CVE-2025-62496
+	rauc: CVE-2026-34155
+	redis: [No CVE tracking]
+	ruby: CVE-2025-27221, CVE-2025-58767, CVE-2025-61594, CVE-2026-27820
+	tor: TROVE-2026-003, TROVE-2026-004
+	wireshark: CVE-2025-11626
+
+	Toolchain:
+
+	- uclibc: bump to 1.0.57
+	- musl: bump to 1.2.6
+	- linux-headers: bump to 6.12.81, 6.6.134, 6.1.168, 5.15.202, 5.10.252
+
+	Infrastructure updates/fixes:
+
+	- Add SECURITY.md
+	- Automatically add 2025.02.x prefix for b4 users
+	- generate-cyclonedx: add source attribute with NVD reference for CVEs
+	- Fix cve-check's CVE URLs
+	- New runtime test for connman.
+	- Added support for "secondary" target that are less often tested in
+	  autobuilders
+	- New runtime test for memcached
+	- Fix error handling in br2-external
+
+	Updated defconfigs: aarch64_efi, nitrogen*
+
+	Updated / fixed packages: asterisk, bind, cpp-httplib, expat, faketime,
+	freeradius-server, giflib, gpsd, ibm-sw-tpm2, leafnode2, libarchive,
+	libcurl, libde265, libftdi1, libheif, libmicrohttpd, libopenssl, libpng,
+	libspdm, libxml2, linux, linux-headers, ltp-testsuite, luvi, mongoose,
+	mpd, musl, nfs-utils, nghttp2, perl, python-djange, python-flask,
+	python-pyasn1, python-pyjwt, python-tornado, quickjs, rauc, redis, ruby,
+	sway, tor, uboot, uclibc, wireshark, zfs
+
 2025.02.12, released March 17, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
