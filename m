Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6C2C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 318A66060A;
	Sun, 23 Aug 2026 20:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhJ4henp_sO8; Sun, 23 Aug 2026 20:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787515676;
	bh=Z3wazJ5TojAksEEjUOVZMGznJYMUkJc1d14eHOqP1Zs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k1TELs7VfDJEDgNMrptoyPc1730Q4LEy/YNnSTg2aJiL2jPdzIdvcKbAYoWNTDKTO
	 fSDPll3x+FVggR/E5iz411CYrS/I4RfyiIQF0ljc4wcp+b+0Xltt5b+GEBxxHSljLy
	 8Qv0Gqf2vkETB9YWzAsLGnLQyfWMZKvHVvyiD4aQO/rZ2wB7pd7sKXPqCYWC5Bpy5v
	 9lRSMD6j3oIJRFuKgdMe7Y2CJAPEMD9iAg5gJglbKMKsOSHjvVxyCKf6rq3mNdXfbf
	 pol2BALuqlUlTsIpZW4HD1cTfy4lOU8FDK4F3wxyq/T01AnwrKknYetbRpAze4mID0
	 uusa0qn1DC/uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5569860615;
	Sun, 23 Aug 2026 20:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BDF0279
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9639A405C9
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fb4y69dIuphh for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC1EF405C3
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F86F8ED96; Sun, 23 Aug 2026 20:06:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 21:56:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e0d162011e4fc31da30a7e899acd22d59a89ab4
X-Git-Newrev: c4f41f4f3f6273a37e2c4c96c230c6c99f5826b6
X-Patchwork-Hint: ignore
Message-Id: <20260823200659.3F86F8ED96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: requires DES in openssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4f41f4f3f6273a37e2c4c96c230c6c99f5826b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 8b1d8dd25d39df120700666942278b1a99fef416 bumped the
package from 1.4.3 to 1.5.1 which includes upstream commit
https://github.com/Cisco-Talos/clamav/commit/8d485b9bfd26a91301592b99590a7eb2069dd905
that adds the usage of the OpenSSL crate from rust.

This crate depends on DES and causes build errors when missing:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cfb8'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cbc'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cfb64'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_ecb'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ecb'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_ofb'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_cbc'

Fixes:
https://autobuild.buildroot.net/results/b93/b9359c5c177f3e4bcef991cde3c2dcf412dee5de/
https://autobuild.buildroot.net/results/300/300721a882f3410528878db730aaff1aa6822986/
https://autobuild.buildroot.net/results/a16/a163a9229c04f638a46e6250dc135c475e5d1576/
https://autobuild.buildroot.net/results/7e8/7e88cba9974f6f5acd125b69b95b7269d8128886/

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index ae5cad036a..839518ebd6 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
