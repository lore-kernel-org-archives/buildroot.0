Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474C606A323
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Yu5N+7in
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730438102F;
	Thu, 29 Oct 2026 20:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5WKe_cIX_yC; Thu, 29 Oct 2026 20:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 76BED81011
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305423;
	b=e2ofvVeh5sM/VOni8HpzuZ9KkCb0zbncvtibRGpWn4x9IISnPEIwlQPzTSnDES6VevVZ
	 mWZI2XLHFhk4rNW8zW5MfBKwHwSz4ewTNbth8v/wCqSipjUVkF4YzytONmk3iAG6ty1VO
	 ssEkUuCCqbHrQUsT1hjj4HzEBnVt/wEg8uhlJk9gfbaqY3sCeR8aNbf+WbLSVVROL2RWu
	 SUEsC6nafkCrI+BOg99r3TK0VDl2PYmqdj9yZvJJAN3oOyrQ622eFPIp0sFCF6Ruggf5f
	 wg2GPSSMHlLgEDthsgPdjVFUdul3LZh9ZKvkcxcPqq6SEW3ruNXRILbsoOmBurgsM8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aty8id+bhiR1CcUxtejlfu/LHL4jqhXpZhHtOxjqDIo=;
	b=fdi6V+HY+axa7tqUpGHz7r8y3jwJddC7xouD8a+/ZeRp85mCDI9rI7B092LdgslJrEkV
	 dRIqfRIzrW3eqfqnGKOAVIRkrH9Tq8918q/pyHzaTza9wnUMAZtURI9TrBNB8Nban3ICb
	 FAex6qJShQ4K3t+4s4DIaNGutEjNt/x56LGxbsjQIN5LRDn5hg9X4lyj5Zhl3vd2B5Sw2
	 yJhEz9OlNqysbXVBPXhkVjchMomZv+Ci8QPGSBqazBNE/h5lYpQ+n6eeFLySRsRAdlU06
	 U5y249ZvOHCfm5PhxvXwAbtVvv09/32JNtxjK6SkokVtIkkkD8HdXFCuXo5+Vt8JZRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305423;
	bh=aty8id+bhiR1CcUxtejlfu/LHL4jqhXpZhHtOxjqDIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yu5N+7indjJH8JR+xfWC2cW/spvG/iPvcV7/metziL0URzEafQVh18+t6GaNxdvwg
	 F7VTp0M6bO4RY4WWmqpmYgXAN/pWey0jDFKClR6OS8ryUNnmuHSfIxeq7cG1k/DLCu
	 DElXvCBPMz16mCwt3sxaS+wqejeuk3tr2BGAo3PaQTXCCG4ygBGjyGOonSgTK3RCJ/
	 fQabbezKwnvQl4Y9wGOx5TuueN4sMFJkOMiyPD0Q1tedW3Bcv2kdjjuKdQGnwH+waC
	 zZn0uDzP6MTzFwvPhd0WzKOIlKPcd5RXB55YQ5/7nF1tOXZmDRiJfHC970wxm3hfQI
	 mE0dhHC24lPDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76BED81011;
	Thu, 29 Oct 2026 20:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 054202E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB71560A72
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55TWkDjRAbZN for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9631C60A71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305402;
 b=UB+bVN2wKsTWzCW0FmuhJh3tV8tFBc3vETHub5vaYCuXZhpnP+txKl15hgUh2zMIKe4W
 wcEXPJtQkkudIujG/KRS/GwHVLIwnK/+Ve5Yko9OgiWaN5vMA4XG52hXIpIMO48i6TwM0
 zpIRUqj/V8b7c1ZA3IUdAR9RpyHtrXYvvy4AX0BnPSzcnXGimeTRVg+OTEFdE2s5A5R43
 xqjdgfrVAnNjLZ+9W1Wo84zodOfvfYpfhD1b1/pvdaYgsglQitHye9azZN35lYbODDg9s
 zoNvwTTTYGLxIuFyjlQ8kX+mhOsUBx2hLeDsQDq7xAFkxAoH5mznwCj32IQT7FDTcRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305402;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+1N4kp3FUbK8y+3Ykf6ifI2DOBVq+bE0Dxjt83U22og=;
 b=Q4OX2porXoSp/9zUfmXwRm80t5I324z0MmPAa3cs7FRwUOxFw9FLwPhPvPlpqOXddCn4
 QOSjkKhnCOMwuZ+8Pg/8w9Z1wGUUWl4RCDm2vhPzO8pcSHVkeqSLzs+mp6029m8uOiQ2U
 HyuPzgXi24bAWiDcRZkSBzMPd51OTl6gqLKVyfLUR+OiM3jZsstPcee63ey1jAHxN5rw1
 o750wO4XSkZ+yQ0ZO2e1TJEsjRPeDkH0bpLo0n2iymI2d2q+Ec+xn7rhvSWsiEjLJkTLG
 ++Al4hvMqKyzHAog4pLJaFr6+7leTSbhw2DChEOCmZAtp/K3bozVH6BVtYwWQ3HG4UA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9631C60A71
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18BF69D2E2; Thu, 29 Oct 2026 20:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1694e57fc9071ac614253ddd705179f26b5bfdd9
X-Git-Newrev: 4e55e4c748bab79e5ce042cad103f9d04f81e26f
X-Patchwork-Hint: ignore
Message-Id: <20261029202155.18BF69D2E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-zattoo: bump version to
 22.2.3-Piers
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e55e4c748bab79e5ce042cad103f9d04f81e26f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replaced dependency rapidjson with nlohmann-json:
https://github.com/rbuehlma/pvr.zattoo/commit/3a5b4bb46b7c89f1f6c5f5a6ebf30fc0728a5671

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-zattoo/Config.in            | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
index 9a6eb3fec5..7596e7e7f7 100644
--- a/package/kodi-pvr-zattoo/Config.in
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_ZATTOO
 	bool "kodi-pvr-zattoo"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR-Addon for Zattoo
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 8b5509d947..57e847e230 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
+sha256  0fb9f133124efa1e19b38fb7748e371295ed2d74c38b1b0ba907321a927a0a60  kodi-pvr-zattoo-22.2.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 12d2d5ff09..413b783d3a 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
+KODI_PVR_ZATTOO_VERSION = 22.2.3-Piers
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-KODI_PVR_ZATTOO_DEPENDENCIES = kodi rapidjson tinyxml2
+KODI_PVR_ZATTOO_DEPENDENCIES = json-for-modern-cpp kodi tinyxml2
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
