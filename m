Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED8606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IqiuRP9j
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1454062B;
	Wed, 28 Oct 2026 17:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzkmcDxcAfKa; Wed, 28 Oct 2026 17:20:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D67CD4063A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793208008;
	b=F9tPU/MUaewSiFelsj24m+EK+iD1eWGCV1yN5fwrTUQNeWIpG/z0ReCDChGxdfhexL2W
	 +OtTjgutrt2zeMvaL1feTwbj0TLM3sR1mzfEBQ0q7JjtA2bmZkgqNifNGbS/Ku94amNs5
	 Ez+x/2Gb6NMa8Ozt0P97+rBAhDk8erkAoXIhWjii5zN/M5O5Fpp/zN1N5goOLPGxlToBr
	 jR1AZv6RrIgCpNREGWC6AdaCzEC7h/Z74pekN/ZxpJXIJiKqLfAOwoz3R8gyZGIsn9EXS
	 oA1RyeqKBGPWLNIAavJ+AKM9wT4HfGEjITKFV3kzuOStQLgR12HagRZK6Gs0+Vh37gA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793208008;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=frGqgsdVLtfqAhZuQXyeXF03WQND+N8XUnRAX2hUP6E=;
	b=jP8WPqinkCCDulXVWgP385bdVKS7Ulx7A9Lbnj0aJ3pLqcsDw1QujFpp3XUS1Qvr3yz/
	 Qd6yO1wcMMYaxoyqn4rprfJKbpJtU7x6TcFQKSConTH6ZRRdo5fmSCu0KnUpAF7YGC68E
	 IZkhYa3H88IUhvNMSrtczuP+AeTGOTenEfWoL74ZtNvxuoOZgGGVJ9momx5Nl6ijsHCQZ
	 R+oZbXUKMXkPfpbYOXRubKqKiliM98UxYLhFsgel7HVkavIr04QR8XnfkGrLnwEk6fm11
	 8rfgwn7T1+nssbihCWheCq0XqtEetImott0SA8KJTkWpDOPc35TH5m2//t1jpyqYStw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793208007;
	bh=frGqgsdVLtfqAhZuQXyeXF03WQND+N8XUnRAX2hUP6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IqiuRP9j0hDJ1dd/HsFNWE4b3TjlA8BtX5y1Oc9aBjQC0ny3NM8xPOyL3vbodzcAM
	 sqD1TMxG9IoGpfeg9hbnGskqJPJWKDArY46Q5bwxz7ZLsPxmWp3/rMfS8ddGHNZTP5
	 wfkrNdhGOkOZtRIp3GWeTEOn44pDkm9tSsPOwJgiRNC6oMOXYAZanUW9lMWOmeVZ13
	 feCjq6OsZhW/himzULkivJqlR7/21+V1At4JPXOE6tz2W7pWv9VaWTLez5oKGOBky6
	 vNB7EMVLGWW0zYskdidkTDtOXm3x07CvziIv3DzdGbNmMIKdTwpzI2KbXAJaOkUX2U
	 mljSb6QKNZqAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67CD4063A;
	Wed, 28 Oct 2026 17:20:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B289F9F8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFEB160616
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AQPuLgC4giy for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0F6236060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793208005;
 b=tFaq/FwEx9wYOImV8CwbaNcIGNhBK6QyRFyNUige4bXx8Zdw52tadIChSch3hSkDqqGs
 PH4IKw2OU1UgVdJKrZfBff0ZH3Ha6OzZJN/JOhK7G0fI8NMoOYo9U864UHbYGRck4KQ9u
 MBEFk321S013K4VkhSYF5OfhH8v5UqF69ukU/qtS25xBD93EMLG57sUDxvVLOeTCaXKl4
 Pftu4kVXXzPJ9B9vR1rltUOj5RJOSQ0QGDEAgfPVuwQIciFh29UfX35xvx2Da4nKmoAcS
 Ul9JCTudQOaiTNLZyMUDdJobPkSMfDwYt8/TXszOxf4244dZrlT54DxdDFMfr4qNZBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793208005;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o7S90TlGzeaiFiRjoF/bFRYGVQtG5b8D95+hCfA9wcg=;
 b=VOitbUKnTv3sW4rtqw5jaWsygiPm4zO9OIj5GM+cy1PKsoeCaipOhDFEFfU1PcRL4T+i
 +nIXqFjTZJ0xywb3Y4563lgh/0XH3SU5BfFX4/rYZ/aJLwcY4f/H4UeKVATEVuZAMCEyf
 IwSA1m90CxbLy6aEX6uoMtAOpKz5sYO76sEpVpzBs+KpFkBebvlxETcJmeG5oPM5LpOUu
 TIBNIaTokv8CK2VTWOtpSSbDzbZlJTTTOUkrLRs0xmxa2FqE9iE5LaQdJCuLshtbTA6Wn
 XebOAT0/nqIODO/BfgiDTy7sA98sMV1SVcNOwCbmLH1UsfsN/zJi6fwAoUMH6o7FD7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F6236060A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 168479D110; Wed, 28 Oct 2026 17:18:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 18:19:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a2bb487b217f64a2d1c973b4922107ce3e5d6bc
X-Git-Newrev: 0d2b3e19bc26be5a60c9a05825e29e43602afa85
X-Patchwork-Hint: ignore
Message-Id: <20261028171838.168479D110@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add option to build host
 systemd-measure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d2b3e19bc26be5a60c9a05825e29e43602afa85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The host package already installs ukify, systemd-measure is required
if you want ukify to calculate, sign, or show expected PCR values. To
get systemd-measure, the "blkid", "openssl", and "tpm2" features must
be enabled [1].

[1] https://github.com/systemd/systemd/blob/v258.12/src/measure/meson.build

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in.host | 17 +++++++++++++++--
 package/systemd/systemd.mk     | 17 ++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index fdbebaee7a..87f409311a 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,4 +1,17 @@
-# Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
-	bool
+	bool "host systemd"
 	depends on BR2_HOST_GCC_AT_LEAST_8
+	help
+	  Select this if you need host systemd tools (e.g. systemctl)
+
+if BR2_PACKAGE_HOST_SYSTEMD
+
+config BR2_PACKAGE_HOST_SYSTEMD_MEASURE
+	bool "systemd-measure"
+	help
+	  Build host-systemd with the systemd-measure tool. The
+	  host-systemd package installs ukify, systemd-measure is
+	  required if you want ukify to calculate, sign, or show
+	  expected PCR values.
+
+endif # BR2_PACKAGE_HOST_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 346d034822..7a73a06bb4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -902,7 +902,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
-	-Dtpm2=disabled \
 	-Dldconfig=false \
 	-Dresolve=false \
 	-Dbootloader=disabled \
@@ -953,7 +952,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhtml=disabled \
 	-Dsmack=false \
 	-Dpolkit=disabled \
-	-Dblkid=disabled \
 	-Didn=false \
 	-Dadm-group=false \
 	-Dwheel-group=false \
@@ -1000,7 +998,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlibcurl=disabled \
 	-Dgcrypt=disabled \
 	-Dgnutls=disabled \
-	-Dopenssl=disabled \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled \
@@ -1018,6 +1015,20 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	host-python-pefile
 
+ifeq ($(BR2_PACKAGE_HOST_SYSTEMD_MEASURE),y)
+# host-util-linux (for blkid) is an unconditional dependency
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=enabled \
+	-Dblkid=enabled \
+	-Dopenssl=enabled
+HOST_SYSTEMD_DEPENDENCIES += host-openssl host-tpm2-tss
+else
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=disabled \
+	-Dblkid=disabled \
+	-Dopenssl=disabled
+endif
+
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
 # Fix RPATH After installation
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
