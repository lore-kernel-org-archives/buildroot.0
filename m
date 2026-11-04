Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DED606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lfhyOAAZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 746E5811F4;
	Wed,  4 Nov 2026 18:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV0ykDLNuW9R; Wed,  4 Nov 2026 18:03:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6DE2880CBF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815405;
	b=M+UCCuQ+tNa9fYGocakHYLVTjGrUNOXXdaKFYSoE5aq5ypszE2k31bDRFXuTUa6sRFeJ
	 fSCY67dXNcnWW4TCNJekaCNgrz2E5y/bEHFb106kQPIBKJaZ0cS0Ub9EFFxY90FpN7B6+
	 +IAeH3Px5wS6bAxnPQDzhrErgZuudsepeZ3ZJWoSIt5ycx5igFNeIysN7+eIqrDwpmaQd
	 NrE6HhAcgq9wB7YHrNsrNdZ55mzlBpI4MvuPgHKmPBt4PZJif9IROg4RZvX0EAI4PKLfF
	 GsOP/pekHrb8l16JSodjaMGIPtXrVojJeCdikyJSqrEG4vJ3087wOZB7ZlpGfTXZvJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4GnaRGaXpsMpQurTvOdiBWag1xQypTOXyDSuhGCNubU=;
	b=Iml8dDlEAmr/wIICHF8IQIcTrGXh6KJrnIqQcBgVtJcEKmrpczlylD7iSY9NPAH0cxSm
	 ZvUB0MmNtVW+XB0rFA0dS0jxpZJ/rIf6fHfYWnPm7TK3eQz2NfQxwdXUEHEHRUgtz5gLf
	 nuZvWeOErLpXq28oRVoO6BcffvPtUIfWwhoqASmH7ZMMjmdzCZqd6e9PQRhJHA4yB/i7Y
	 lP8hPZ/wqht8tFWn7sH2FBJ0hJxXgu7siZSyoYYK0wFm+Ugy5AEWLTP1KDLs2OGiUtJdf
	 gzEtMZ59oYslgodFOp1yTe5w5cN/+IuXOaXN/9mBMrGZOMGJHFUp5q4K/VzhlCe1+7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815405;
	bh=4GnaRGaXpsMpQurTvOdiBWag1xQypTOXyDSuhGCNubU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lfhyOAAZGJ1x1F2ARyEvgaJA6N6otZJIcSUUt4vVGIeJaCWpThXV3YltbLeNgxbit
	 8ybQ7tBxgwW8Eo3zMX1K6Fi1ARjNvJHpMSiNEj21ZGklnybZgkPAU1WEQaLXaaPtPj
	 DQC0HjBrrHdoflk8xgWfDfyBWy9Cja1WK2Uyh8J5OLjjT3JJ9t6osm96wa/6cq6hs0
	 1D0RwKQvK/OZhAwhfAydYbFOcz+I/7R6MENYn/GnhYeOBAADOT1p8uuiiCVZoX3qHL
	 u/0nsp2zUf+G5jeJ/DQ71vccC8b/oxghsYiHn4D/PO4mwmR3EEdWScoAGgv0xbSZ2N
	 w2kJcK9xgP5EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE2880CBF;
	Wed,  4 Nov 2026 18:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8189B177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD5F40A49
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mhTZKJQj230 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:03:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C557340D0A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C557340D0A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF1369DBF7; Wed,  4 Nov 2026 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 19:01:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24cff684345ac6fceee1bfbdc8ef21e981887fae
X-Git-Newrev: 913e48076e9e6ee9fa106bfe812ceb8e54a70339
X-Patchwork-Hint: ignore
Message-Id: <20261104180139.EF1369DBF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump version to 262.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/913e48076e9e6ee9fa106bfe812ceb8e54a70339
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes relevant for packaging:
* Systemd now requires binutils >= 2.35 to build. All versions
  packaged in Buildroot meet this requirement, but external toolchains
  with very old binutils might not work any more.
* Meson options for static/multicall builds have changed. Buildroot
  does not support static builds of systemd, so the options are
  disabled.
* systemd-tmpfiles now rejects lines with non-empty arguments if the
  type does not use any
  argument. package/skeleton-init-systemd/legacy.conf follows the
  requirement.

New/changed options:
* "build-static" is disabled, see above
* "dlopen-tests" is disabled
* "fallback-default-target" set to default
* "hostname-wordlist" set to false to disable installing word lists
  for autogenerated hostnames
* "standalone-binaries" changed from boolean to string (list of
  binaries), set to empty
* "systemd-multicall-binary" is disabled, see above
* "var-log-mode" (permissions for /var/log) set to default

Please see the upstream NEWS file for other changes [1].

Hash of LICENSES/README.md changed due to addition of the word lists
mentioned above [2].

[1] https://github.com/systemd/systemd/blob/v262.1/NEWS
[2] https://github.com/systemd/systemd/commit/3b4c759a07a7646fbed50ff9ac8cce35c3b79843

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 16dab511d2..047cfac3c4 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  systemd-261.4.tar.gz
+sha256  100fc873b848b9b0297d8a705e8e2ed326256c8483d9960ee1ffe264c8a5c3e3  systemd-262.1.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  a3be270384280249880bd69cab48de68f3e9906b975fb172bc2b83657c43d9a0  LICENSES/README.md
+sha256  a817486a61df66ef79f96032763c861abd0edf4199cf39a7b1515a7e29f6e6d0  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e9e3abf26b..05aefb40cc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -21,7 +21,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 261.4
+SYSTEMD_VERSION = 262.1
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -68,6 +68,7 @@ SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
 	-Dcompat-sysv-interfaces=false \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
@@ -75,8 +76,11 @@ SYSTEMD_CONF_OPTS = \
 	-Ddefault-compression='auto' \
 	-Ddefault-locale='C.UTF-8' \
 	-Ddefault-user-shell=/bin/sh \
+	-Ddlopen-tests=false \
+	-Dfallback-default-target=graphical.target \
 	-Dfirst-boot-full-preset=false \
 	-Dfuzz-tests=false \
+	-Dhostname-wordlist=false \
 	-Didn=true \
 	-Dima=false \
 	-Dimds=disabled \
@@ -103,17 +107,20 @@ SYSTEMD_CONF_OPTS = \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dswapoff-path=/usr/sbin/swapoff \
 	-Dswapon-path=/usr/sbin/swapon \
 	-Dsysinstall=false \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsystemd-multicall-binary=false \
 	-Dsysupdated=disabled \
 	-Dtests=false \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
 	-Dumount-path=/usr/bin/umount \
+	-Dvar-log-mode=0755 \
 	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
 	-Dxenctrl=disabled
@@ -906,6 +913,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbinfmt=false \
 	-Dbootloader=disabled \
 	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
 	-Dbzip2=disabled \
 	-Dcompat-sysv-interfaces=false \
 	-Dcoredump=false \
@@ -913,9 +921,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
 	-Ddbus=disabled \
+	-Ddlopen-tests=false \
 	-Defi=false \
 	-Delfutils=disabled \
 	-Denvironment-d=false \
+	-Dfallback-default-target=graphical.target \
 	-Dfdisk=disabled \
 	-Dfirstboot=false \
 	-Dfuzz-tests=false \
@@ -925,6 +935,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dgshadow=false \
 	-Dhibernate=false \
 	-Dhomed=disabled \
+	-Dhostname-wordlist=false \
 	-Dhostnamed=false \
 	-Dhtml=disabled \
 	-Dhwdb=true \
@@ -982,9 +993,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dselinux=disabled \
 	-Dsmack=false \
 	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
 	-Dstoragetm=false \
 	-Dsysext=false \
 	-Dsysinstall=false \
+	-Dsystemd-multicall-binary=false \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
@@ -996,6 +1009,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dukify=enabled \
 	-Duserdb=false \
 	-Dutmp=false \
+	-Dvar-log-mode=0755 \
 	-Dvconsole=false \
 	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
