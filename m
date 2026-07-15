Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE211C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A79376072D;
	Wed, 15 Jul 2026 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zubJjCongCzQ; Wed, 15 Jul 2026 19:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 573F9605E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784144151;
	bh=NZw1h0cuBTR6Mh0Gkzf/0MFbL+YCK+EvPbULAnoXgMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4fCMOZxEdE3ua2sGQSA//ABmcC+hPcOfsx/zDip2GVv3rsl8PwjEkuAxBl9G88rO
	 +OIdNLjHOnafUWtVGq6F0KePVglMIzaqjN34My3m9sA4UvwakbhE36USJkWX6uDagv
	 oQ0FmsSb9TFHpt3eLLUuccaK4aj428bVFaFjZe+4OGjmHmdj1GnBnDgzzQpdo6XO18
	 duM+poGU3HtMlryygFHeH9bDFzls1lClSpN/U0X9XrUtHDGoijeu7XnpfScYANNlv9
	 aAC/xsKNmVEOdePGpwYiun7CtpFA4I/7Phbxkzqnhyw8GhUJu2bYfeWI1ekmI0J8df
	 fdeoVsm9Ih/VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 573F9605E6;
	Wed, 15 Jul 2026 19:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B3E49D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F3180D22
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku9fPEVX1cdT for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B4A80CFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B4A80CFA
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B39588998; Wed, 15 Jul 2026 19:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:33:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a944c0fa72b8b7f5d6a15ce5b71665984ee91e3
X-Git-Newrev: 03d7221d5f2d9d3ed2d78bdf23ff9c1a3178431b
X-Patchwork-Hint: ignore
Message-Id: <20260715193512.3B39588998@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2026.05.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03d7221d5f2d9d3ed2d78bdf23ff9c1a3178431b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit e70f8f2ae17edca118f04d2e16e56b41695a50d2)
---
 CHANGES | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/CHANGES b/CHANGES
index 838ccb6f4f..2e67f5db09 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,110 @@
+2026.05.1, released July 15, 2026
+
+	Important / security related fixes:
+
+	apache: CVE-2026-29167, CVE-2026-29170, CVE-2026-34355, CVE-2026-34356,
+	  CVE-2026-42535, CVE-2026-42536, CVE-2026-43951, CVE-2026-44119,
+	  CVE-2026-44185, CVE-2026-44186, CVE-2026-44631, CVE-2026-48913,
+	  CVE-2026-49975
+	asterisk: GHSA-3g56-cgrh-95p5, GHSA-3rhj-hhw7-m6fw,
+	  GHSA-4pgv-j3mr-3rcp, GHSA-589g-qgf8-m6mx, GHSA-746q-794h-cc7f,
+	  GHSA-8jhw-m2hg-vp3h, GHSA-8jw3-ccr9-xrmf, GHSA-g8q2-p36q-94f6,
+	  GHSA-h5hv-jmgj-92q2, GHSA-j2mm-57pq-jh94, GHSA-mxgm-8c6f-5p8f,
+	  GHSA-ph27-3m5q-mj5m, GHSA-q9fr-m7g8-6ph5, GHSA-qf8j-jp7h-c5hx,
+	  GHSA-r6c2-hwc2-j4mp, GHSA-vfhr-r9x9-c687, GHSA-vrfp-mg3q-3959,
+	  GHSA-wcvv-g26m-wx5c, GHSA-x348-j6c9-77f3, GHSA-xgj6-2gc5-5x9c
+	avahi: CVE-2026-34933
+	bind: (no CVE assigned), CVE-2026-3593
+	clamav: CVE-2026-20213, CVE-2026-20214, CVE-2026-20215, CVE-2026-20216,
+	  CVE-2026-20217, CVE-2026-20243, CVE-2026-20244, CVE-2026-41676
+	cpp-httplib: CVE-2026-45352, CVE-2026-45372, CVE-2026-46527
+	cups-filters: CVE-2025-64503
+	expat: CVE-2026-50219, CVE-2026-56131, CVE-2026-56132, CVE-2026-56403,
+	  CVE-2026-56404, CVE-2026-56405, CVE-2026-56406, CVE-2026-56407,
+	  CVE-2026-56408, CVE-2026-56409, CVE-2026-56410, CVE-2026-56411,
+	  CVE-2026-56412
+	fetchmail: (no CVE assigned)
+	ghostscript: (no CVE assigned)
+	gnupg2: CVE-2026-34182
+	imagemagick: CVE-2026-48724, CVE-2026-48733, CVE-2026-48734,
+	  CVE-2026-48994, CVE-2026-49218, CVE-2026-49219, CVE-2026-53460,
+	  CVE-2026-53461, CVE-2026-53462, CVE-2026-53463, CVE-2026-53464,
+	  CVE-2026-53465
+	jq: CVE-2026-32316, CVE-2026-33947, CVE-2026-33948, CVE-2026-39979,
+	  CVE-2026-40164, CVE-2026-40612, CVE-2026-41256, CVE-2026-41257,
+	  CVE-2026-43894, CVE-2026-43896, CVE-2026-44777, CVE-2026-49839,
+	  CVE-2026-54679, GHSA-gf4g-95wj-4q4r, GHSA-hj52-j2c9-r8r4
+	libarchive: (no CVE assigned)
+	libcurl: CVE-2026-10536, CVE-2026-11352, CVE-2026-11564,
+	  CVE-2026-11586, CVE-2026-11856, CVE-2026-12064, CVE-2026-8286,
+	  CVE-2026-8458, CVE-2026-8924, CVE-2026-8925, CVE-2026-8926,
+	  CVE-2026-8927, CVE-2026-8932, CVE-2026-9079, CVE-2026-9080,
+	  CVE-2026-9545, CVE-2026-9546, CVE-2026-9547
+	libevent: (no CVE assigned)
+	libgsasl: CVE-2026-48829
+	libopenssl: CVE-2026-34180, CVE-2026-34181, CVE-2026-34182,
+	  CVE-2026-34183, CVE-2026-42764, CVE-2026-42766, CVE-2026-42767,
+	  CVE-2026-42768, CVE-2026-42769, CVE-2026-42770, CVE-2026-45445,
+	  CVE-2026-45446, CVE-2026-45447, CVE-2026-7383, CVE-2026-9076
+	libssh2: CVE-2026-55199, CVE-2026-55200
+	mariadb: CVE-2026-48163, CVE-2026-48165, CVE-2026-49261
+	mongoose: (no CVE assigned yet)
+	nginx: CVE-2026-42055, CVE-2026-48142
+	openjpeg: CVE-2026-6192
+	openvpn: CVE-2026-11771, CVE-2026-12932, CVE-2026-12996,
+	  CVE-2026-13117, CVE-2026-13122, CVE-2026-13379, CVE-2026-13698
+	php: CVE-2026-14355
+	python-django: CVE-2026-35192, CVE-2026-35193, CVE-2026-48587,
+	  CVE-2026-5766, CVE-2026-6873, CVE-2026-6907, CVE-2026-7666,
+	  CVE-2026-8404
+	python3: CVE-2026-11940, CVE-2026-9669
+	redis: CVE-2026-23479, CVE-2026-23631, CVE-2026-25243
+	ruby: CVE-2026-46727
+	rust: CVE-2025-15661, CVE-2026-55199, CVE-2026-55200
+	squid: CVE-2026-47729, CVE-2026-50012
+	sudo: CVE-2026-35535
+	tiff: CVE-2026-36849
+	tmux: CVE-2026-11623
+	tor: TROVE-2026-025, TROVE-2026-026.
+	util-linux: CVE-2026-27456, CVE-2026-53612, CVE-2026-53613,
+	  CVE-2026-53614
+	webkitgtk: CVE-2026-28847, CVE-2026-28883, CVE-2026-28901,
+	  CVE-2026-28902, CVE-2026-28903, CVE-2026-28904, CVE-2026-28905,
+	  CVE-2026-28907, CVE-2026-28942, CVE-2026-28946, CVE-2026-28947,
+	  CVE-2026-28953, CVE-2026-28955, CVE-2026-28958, CVE-2026-43658,
+	  CVE-2026-43660
+	wolfssl: CVE-2026-10097, CVE-2026-10098, CVE-2026-10512,
+	  CVE-2026-10592, CVE-2026-11310, CVE-2026-11703, CVE-2026-11999,
+	  CVE-2026-12340, CVE-2026-55958, CVE-2026-55960, CVE-2026-55961,
+	  CVE-2026-55962, CVE-2026-55964, CVE-2026-55967, CVE-2026-6091,
+	  CVE-2026-6092, CVE-2026-6094, CVE-2026-6291, CVE-2026-6325,
+	  CVE-2026-6329, CVE-2026-6330, CVE-2026-6331, CVE-2026-6412,
+	  CVE-2026-6450, CVE-2026-6678, CVE-2026-6681, CVE-2026-6731,
+	  CVE-2026-7511, CVE-2026-7531, CVE-2026-7532, CVE-2026-8720
+
+	Toolchain:
+
+	- gcc: bump 15.x series to 15.3.0
+	- gcc:: bump 14.x series to 14.4.0
+
+	Infrastructure updates/fixes:
+
+	- support/testing: various internal refactorings
+	- support/testing Improve TestPythonPy3NetworkmanagerGoi
+	- support/testing: improve iptables package test
+	- generate-cyclonedx: fixup scp-style git sites
+	- support/testing: Fix test_gnupg2
+
+	Updated / fixed packages: apache, asterisk, avahi, bind, bind, clamav,
+	  cpp-httplib, cups-filters, expat, fetchmail, gcc, gcc:, ghostscript,
+	  gnupg2, hwdata, imagemagick, iptables, jq, jq, kodi-screensaver-rsxs,
+	  libarchive, libcurl, libepoxy, libevent, libglib2,
+	  libglib2-bootstrap, libgsasl, libopenssl, libssh2, libssh2, linux,
+	  mariadb, mdnsd, mongoose, mosquitto, mpd, nginx, ntp, openjpeg,
+	  openrc, openvpn, passt, php, python-django, python3, python3, redis,
+	  rsync, ruby, rust, shadow, shim, squid, strongswan, sudo, tiff, tmux,
+	  tor, util-linux, util-linux, util-linux, webkitgtk, wolfssl
+
 2026.05, released June 8th, 2026
 
 	Various fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
