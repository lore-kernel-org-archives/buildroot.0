Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974BD606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WX5Pcdh1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75AE460A5C;
	Fri,  6 Nov 2026 16:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Hy_dwde_AwT; Fri,  6 Nov 2026 16:09:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8CD1C60A50
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981363;
	b=RwysjCrdjN6u8Po+asEj9y2aFRqgRhP1l6oyTyvDwcqWIQJxEmHcdUbEjigHBTXKc5y/
	 NKfKAxsGha5flGsCZgxuDvFPthwq1jKmshMWlnfLvZigI7RYXzpvN8spRZvhSLTHmrpti
	 PLgeutldzHmN6jTL5420KG20ji2+2p5/dlaPXgXUniASk7tY6R6jwwXRultA2D7y1fPgl
	 NlaTGgHbYqnQmaIYqcAPeI2BKsTKadA7OLkauILIP2PL0YGZa6YSjQarJnLDhovmfX3K3
	 s9OPZH1DSBu9x53mGHipINzhyHJ1zlQlWCzBpi759iAd7TuOuTIQytNZmayaxg+tPmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SHb+9cfzCfzbnlcMDlQ29KHmA4Kj5+nwVE71DZxwMyo=;
	b=Sb9/8/RmOPtyinQDMc12QRBp+C0z3TJTyiZZpNiK7YYc2wMQWJrd4jmMAMXwX+DhyOTZ
	 vrnDuIHWx/46vL1NHZb174LpFDq/Y/GqV9RJMmb7rXZ+xzwcdx2EMi0dlt/RPsEHlwkJU
	 R9HGYAbZESK5DRxiTkY9oe2eEhysxw0kZPUYOBqFNzh3Jo0w6FsmdCJ8w1lNGMOJ+W4ew
	 mrPKeNEo0w+CYCLqZc9q9nVyfHIAgFSh6xyvpeGx2fUrRWcPj2GFhJR10eubVRBIo1qUJ
	 GOeINLEm8fthfmbWyd1vksuuad0HeGuiJmadRJSMIUOXrN0Cv0T2Bqkh/CWcqaW/Xvw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981363;
	bh=SHb+9cfzCfzbnlcMDlQ29KHmA4Kj5+nwVE71DZxwMyo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WX5Pcdh1VHW3tYoemmIfpantgTeunu3QO4reAHh1iFXUQq4rrarmeiSp8hDe8kEyt
	 r6fblZx9Cp66E4au2i70jHHU1V5baEtbyhURwqdzpCSjnLmJvEeVdDQjOXHxeDigCO
	 gtps/W/lvXV8cBQ8HUvb69pifLnZeBFFcpoc1ReShxJvzQmvlYkJGxpYWOQAcHkSf0
	 TNZIPVy9uTEJfKTZNvfXFUUTdzdCCqQEBYjHCEaXA57OVeIJgkvlOCjGPeH0bp8WdE
	 ddKrnSgzNt3D9PM0sfEfqyf286IOBnPXTGjrulKMhCWy+ukyuYw3eEaDkmyjU3rOqh
	 k/00eGMk4JUEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD1C60A50;
	Fri,  6 Nov 2026 16:09:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 543162E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51F3440917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcyXZQVjPFfL for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 93B974090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93B974090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE2DE9E09B; Fri,  6 Nov 2026 16:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c5d4f01f6361bd2fd8f88b4d1347254e6c66a2ec
X-Git-Newrev: d8f295b7972bd077857f21565d305cb8bb554fba
X-Patchwork-Hint: ignore
Message-Id: <20261106160711.BE2DE9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/18xx-ti-utils:
 fetch from the BeagleBoard GitHub mirror
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6929753268663001021=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6929753268663001021==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8f295b7972bd077857f21565d305cb8bb554fba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

git.ti.com no longer serves git clones through its cgit web path, so
the download fails:

  fatal: unable to access 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/': The requested URL returned error: 403

The https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git URL accepts
requests, but fetching all references, as the Buildroot git download
helper does, fails for this repository with its ~1000 refs:

  error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
  fatal: error reading section header 'shallow-info'

The cgit snapshot tarballs, used before switching to git, now return
HTTP 400.

Fetch the sources from the BeagleBoard.org GitHub mirror instead. Its
R8.8 tag is identical to the one on git.ti.com (tag object
6e8dcab3a39a, commit b23772347318), and the generated tarball matches
the existing hash.

This issue has been present since commit d8b15b078aeb
("package/18xx-ti-utils: switch to git repo"), which introduced the
cgit URL; it worked at the time, until git.ti.com stopped serving git
over it. It therefore affects 2025.11 and later, and 2025.02.x since
2025.02.9.

Fixes:
https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f

Fixes: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09 ("package/18xx-ti-utils: switch to git repo")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a34e1e89f6b9d23270276fe73b9253981247cd8a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 3e6f715730..6c04b60723 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 18XX_TI_UTILS_VERSION = R8.8
-18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_SITE = https://github.com/beagleboard/18xx-ti-utils.git
 18XX_TI_UTILS_SITE_METHOD = git
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause

--===============6929753268663001021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6929753268663001021==--
