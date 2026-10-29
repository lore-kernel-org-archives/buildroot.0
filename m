Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB9606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FIvU2VVx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D9D81A34;
	Fri, 30 Oct 2026 14:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78NIr22mU-4o; Fri, 30 Oct 2026 14:20:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0B3E9817FF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370053;
	b=MPCYXkzPuQszWweqlNTbeIslIV3FzfH1b4j201E/3soApXn/aOsDYX1/4degIAhwHIyA
	 gKmR6LF8DrDgxcRjaythoo2BE2cwMM1pl+abSbrJEhQQOaQ70pkQ5Z88l09JAcjMZ8AMv
	 EbrB2neyXF4ze4Rkeg4Dmd95xaOn/Puov3XTqbfKMVSIoa1WwgirbnBLncDkh3BDnB1ll
	 LkdY6mUywmlDQ2j0USZhTtlzSNYYfDGz17HbCYtgPvltChHXIsk7Stneos84VuGEu8BjH
	 NgJEttLcvl3rSoAqQXIBdBHqWyxDrWcmrBeesPsj14jPpITSa1j8+8fAUvYl3A6i7GA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fPIjUl+rEGf23UQMugkAApYuQiDyS6+uZv2XW855Poc=;
	b=R5JvbJNogiINp0DzEc9Grm3taHqWfvpGnNSpIhg96ppNgccIxRab9NlLam3E7yHS4Sn9
	 A7qv4/MjBqEK5dstUnV1ECNFmnr4uH4fzVxwocSX6YI36QBfjtVXmOW0jZEMkPkaC++Es
	 2K6qYgFe5vfYuWZvx2FmawIB1MFWnhUdHqfmE4oMFhY2CPD4jyJQ+Hn5q4Mu3IvN9ZFaj
	 Rp+7IWpMCpq5R1ysiDi4DOWieQxEc5Oc/9NJs0Agg0oD4GcAegUJXITNhmk5Xw8EJeUeH
	 rhYJWF1eUsL+1EdKKVdAl7IskjDdTaMwO+shkd0t8KpCZ/s6MFSP6yQjCYSk0yn2Ypw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370053;
	bh=fPIjUl+rEGf23UQMugkAApYuQiDyS6+uZv2XW855Poc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FIvU2VVxwgvIGAhizTB7+OfD+fa6IsEdj3u6oyLVCclKrOVF1V740zUvMfpzzbNJY
	 Txvig/XHbO5k4FJvEWZg62vehDD3PIWfwPQt+AAXnoqqAj6XL5h7OiTCbjFeR84dAB
	 jWgDCjNSwKYXYMxXzXnb7aBtg1XNezN12+XGe/nt4SQbyjqlL7Bv/dhzhXbZlanc35
	 ocOBZz1oPZGSa3d2zJNWfKgADr1AmxGjGzNqeHtev1i4S0FiY/yXE79h2e53pmxeLr
	 1rAceM1pzbt+3gRsG3hbP3d9rlrHyjumaj6l+46mWukTLK8i//9+H2aUd2Lk6AVeYZ
	 5j5nuPCm1Q4Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B3E9817FF;
	Fri, 30 Oct 2026 14:20:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D742A712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCFB160AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F8X-Gmf4s7i for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0728F60B96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369897;
 b=axH/KimHhn3ZEKgY9S6oc0fI5a4HJfDs1hcEKIyMy+uAynfiEMRyTr8M3fD71RG4hyOJ
 D++tLvrWquweIz43PnTKCPEuPufY32p9h7I6bAkuGsYC4GF7PIUdf7sVBjMtASeIOuA43
 r32z122Gmgh3keZOsoyzuAhkaUPgwem4v0jHY2Syx0jCHfbMmFx63drz0fQnZMp+q9oG6
 RwR076FcB5n50IklfqZCSU6xm6u7nqpTQizam0+I0WNHSYduqWwgGPU3NEfuQOfGh7866
 3j7sjlcTAu+siCwOptk8M6UI8FWFKzLYxzd/nMKaFlPQpeaoQake9uT1AbrgA5viW4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369897;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wbYsxp0gfUbw9Ode4vesSytkxnGahD++y6ByK9IksI0=;
 b=S5Nd1kN5Rso0rd9/5qZvHfow3F/p7y8HX24GwTPh/SJeSHz5Jhdt+dDUB/750AYiwk12
 mTxtZBHuNLnb4DfDwo6Ocw9cYfkDBez/c2WkeZxeyPTqC7JjSBu/sSOydH4OTTWDwKs4o
 4x8SfHGFSWd6mfymSF8X1JZKBgZGl6PeZRJCkYnjbOQPl//CxP8vpUAagt0Yhu4EUPPoI
 qjR2yd5erDrTmiF31EDByYnPRx9W+0Jvzqw7p4G1pT8gPt4RbHlUpAT2gROx5kVEu9f2o
 uZS8Puw2Lb6hRWpg4J48JP64qKOg+tgaZLyyQ57EzBBisvvWr1XsdtLqxrzJRn3pzUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0728F60B96
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED6C99D389; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1df505db94eb6215fa99706a3658c382f1fd9afc
X-Git-Newrev: 0506298debac131229d13fb5175429c2de764dd6
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.ED6C99D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/avrdude: fix
 readline dependency
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
Content-Type: multipart/mixed; boundary="===============0315197584118133036=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0315197584118133036==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0506298debac131229d13fb5175429c2de764dd6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 3ab71cafc0e69f128fc3bee62fa995c5d65d1c50)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 8f451a7fdb..6d9ffe8625 100644
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

--===============0315197584118133036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0315197584118133036==--
