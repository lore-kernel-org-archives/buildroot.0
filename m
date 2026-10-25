Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C86606A320
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LK3wo4kR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD0E605F9;
	Sun, 25 Oct 2026 20:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYzMmIQf0Pim; Sun, 25 Oct 2026 20:54:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 687C060612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961660;
	b=H5BCcW9RVO3dOQvcdJLTKdcvPlqt+DoOR6bMM1r70IJKHgUznclqMVyzTqJPDd+5bYqe
	 7snIQteJGMd6AGgRLor1kaM7v9DtlIFYJDrc8RXqeg6N3dC40z2aIDi1E0DjR+pwJsgz8
	 ycbzqnAk4RemphAeJGb1zpT4ikbVal5sfuElF0mfkZjnPDiq5KHpZeM4ezX0yHGoZ1LEg
	 uM9C/UepZThuMlbpu6B1vrLrfAmMSzgxuuQsUFn2HDU4Rcix0KKLh5QLtcuA2qsT3ceRU
	 C1X00TBYyLoQh065hEj676Nsn8cObB+sm/5mW0dET5RCgNtJAeU+EzWRWeNBkQxi9Og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/zmxsbv5KUfi6MnKLZ2zVWwRBFNt32c3Wvi3Ut73W90=;
	b=LKDlQLAk7vXauVp8CNXVm+4rw4Ex+aLdHVHLW0x4gSy/uio7ulkx/x7o5czuyLGkDW1g
	 Zct+TqTRBHELs0bsxQXdNpmzJdsO0gPxHmQ9g0S4pVtFU6oTWCVUXLmcok3Hm4WdRVkVj
	 IabRGjnV6aaQqMhne+lEhHXgBwPBpHT2DpkRSamQrLwEd/rlX9XDunDiaIqgEtDdvGMyg
	 nRc52PN6jbsgKoMQfkyMfyWBKGTgmWaimg1sD3dOb+gNUk0lMk2DFLBQK5xGln2nt+/SD
	 4CFXejwkGKwh58xhiDSQ2FWygxbvPaqfFThnQ1rT+LKTAFiQD2B2PB94N02wKO77Ykw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961660;
	bh=/zmxsbv5KUfi6MnKLZ2zVWwRBFNt32c3Wvi3Ut73W90=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LK3wo4kRbPXlAfUagfRuHUtHoWDbXeW33zaQD3EZ50JFn9lIimvTfo7pJum/BVcOk
	 VFMvOiHTzV/E7LFHJX7uMbLCUPNo85NxvkjYBTqHsIYl6gfAMkr7PaXlpeLbCLKG7q
	 fkg6MrSfHlpsj0yx40QRQXReSbubx1CFI0xWqMqZaLwIBBsZWoHbEaIIyXOQ12hrpE
	 ZmzMN47e7c1KluiZ8/QCbP45Mz00vLbAQeKZYwxKnOqLFdfP08LH61fuiEtH00+1ZB
	 TayOAgs+FkEHdr5q8iOCtJQRLTvEKj+K0WfqXLSgJefz4WEnC4y9fWItKwgg89cely
	 bi7nefp9o2csw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 687C060612;
	Sun, 25 Oct 2026 20:54:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 593F2380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56529405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUgsWTfDlUav for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:54:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ADFE8403C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961658;
 b=szk+fbPhT8dNeVTG6+H0jMEJOSvOYx8J8wsfkUnOX6G2T6JpjIJx3adbwGY1LMRX/1tG
 qKpqvE+nnAdEkYNfFwmIJ6DLB3DgPUxmWlZsxEcFIBDGDunZSzXwwUPg57KSZpkEFj0DR
 tyKDqCs11SOq9PHy5Z9jm8TvJ/j4/vHUl5UFJeRntO4jxMkOi0eTubaxrn3Gq6GtuluRq
 /Ireo1xwyduy0j8WemGTghV79648xCmMfshcikSfAxd14kAFUi4vYePGgtVCUEQS/nNjg
 yvKspq3UJfE68LlQjykcR79vw7AGt6yehXjoIV6NO3ml6XeChbi5KxymLcrwquKipBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961658;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TPfWKjlgF4ld5pIhqg48+SgHQpsXK/KjeBimbQlyX7A=;
 b=EpnGPrTo+BlQiJY9QuEI7bV2HXz7KwTsh2X8EDih3dSkGBooZlLtcVCCYXjB/pXhF7uM
 YhQUN6RZDFBDeE9r0z9cavaHG3nkIxqUzm3swkC4uT7Fc1OcFpss0cJhkEpBxDM0isMU2
 x3y1AbdVtXPg4bdNw88B63QjMfU8j2vzzZh+w3KkrF7s9Z2hu8Hn47JR7xY2hAC4PM8PK
 1Jh2iRpz5/1T4CVy1Vwo3icuzf/28iy8siMMIBurbL9iW/ndD3kotNc/qtCskgV8lnHzn
 GxaqeUnJEqUARYygKz+XUWkho5jbdma5n+R2ho9LgrD2yVH/Ee1e+TW8j5VFZr6gXeQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADFE8403C5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15CFB9CEB8; Sun, 25 Oct 2026 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:54:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1c8d3132e42a7156b27c77f39f11502975caf02
X-Git-Newrev: 3ab71cafc0e69f128fc3bee62fa995c5d65d1c50
X-Patchwork-Hint: ignore
Message-Id: <20261025205253.15CFB9CEB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: fix readline dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ab71cafc0e69f128fc3bee62fa995c5d65d1c50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

avrdude automatically detects and links against readline when it finds
libreadline in the sysroot (find_library(HAVE_LIBREADLINE ...) in
CMakeLists.txt; AC_CHECK_LIB([readline], [readline]) with the former
autotools build system), and there is no option to disable it.

Buildroot never declared this dependency, so the result depended on
whether readline happened to be built before avrdude. Even worse, some
external toolchains (e.g. the Bootlin ones) ship libreadline in their
sysroot. In that case avrdude ends up linked against it without
BR2_PACKAGE_READLINE being enabled:

  $ readelf -d target/usr/bin/avrdude | grep readline
   0x0000000000000001 (NEEDED)    Shared library: [libreadline.so.8]

but libreadline is not installed to the target, so avrdude fails to
run.

Add readline to the dependencies when it is enabled, and otherwise
pass -DHAVE_LIBREADLINE=OFF, so that find_library() skips the search
and readline support is disabled.

This issue has been present since commit dc776f0d0546 ("avrdude: new
package"), as avrdude has always detected readline automatically. It
therefore affects 2014.02 and later, including all maintained
branches.

Fixes: dc776f0d0546900b22d1552f3e522be2080016c6 ("avrdude: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 5708fe2017..476f031c99 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -29,4 +29,10 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+AVRDUDE_DEPENDENCIES += readline
+else
+AVRDUDE_CONF_OPTS += -DHAVE_LIBREADLINE=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
