Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA89606A322
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RlNfbTKt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A3B8117E;
	Fri, 30 Oct 2026 14:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GRE5NZeN3ZZ; Fri, 30 Oct 2026 14:08:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EDCCF81140
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369316;
	b=HvaOKTjhXX8M1J2uol39p9XoovPnn7shtE+TN4RO+zYBpyNvin9tm/wSbO0QsSBEToph
	 NjARcy8yJzPoNrVnS2giXfwEU4M6n/uhqcdTOBL293FkARU96UZaAnhxjS7cd7NH1AlRb
	 iT3CFjwwqle06oBUrGLXWHH7tp5woa6TOQKzwwIBHdeaRMchJP2lwPR3sNChqbb3I90pN
	 lEY+gEqSYlWRYBEqiqIPWNdtYI76OHnMNckLUiPnESe3wgaNzclSALspoMzqTkjd/Ispx
	 c4/Bxb72QK2Hvc2VdjeVMJMKteU+dGcgm+OmkvOqqTqZX87T8tsVjuEbtYTAIeDJ5oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qmbLfMocy4WU4Kc73WGYAPNVHyvEEpgrWETmAaUMla4=;
	b=DU2VyOsaTkHLDzvt4yRr2ALWJc2Ut4bqQu+nV4ehGQjsyXgr6cFp6VRJ5nnHXm5907ZC
	 LruOvGbcZ4GesCqpFtoZGxlWqPX+NSv81UdjA6X9I6kQrFJIkqTfccCy9Y6ILEGjqRfH7
	 r3td2+/88iiMZYFNh2q9Th0zwcHvgJCOh+axM/tXGah5T/RnzwjKQJSUOpRHxzl+Sg3Vr
	 jJF7LD/4CblM08J+UAZoyZYfsguKlov9E5ECOmGP1WF8ZVNUStHh9tX5ejsiLKYWTM8CN
	 NO571oaz5NnQWGu1+AD1zBI3+4ZBrW68ToiflnW5IUJjyjNksKxgaRmcvislMCMV7Fw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369316;
	bh=qmbLfMocy4WU4Kc73WGYAPNVHyvEEpgrWETmAaUMla4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RlNfbTKt0Ky94jtftDxvqsdq0leUfLeBjs2hdBFiD0f9mlqi1vp2U3pyrX26dloLM
	 82yAOLG1Igeu9K3wIec4OMgu0gdFkMLorJCJ8F1tP9kUJ+32qkYxXyV9xS+WL932YV
	 o2H1b5MwsFxNnueE+JN7zco4XnurbDbVVmgqG6x4dEWx4EuNQOmJ/WOr4G4tevXWcm
	 mFqhEibOtQUvxATijdPO1qkIF+u+ibK0DHJltJqFQgJfkhIWWI9ZUmk+bxFn0m6Soq
	 NzLeh54tibhmNLRp+ve8slrGhVT0PcEzwbNeFpHC2a126DieIFAuUFkbx8anka8DsX
	 ElrD3nd38E3yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDCCF81140;
	Fri, 30 Oct 2026 14:08:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 896A5D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D19840B3B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1xiBdElEKoR for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A53A40B1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=thbpkfc91z1f4OFUujtXkIPcKyQCVWBZLZEHElDNJDDssWdLx1AuWoF3vpQFTkxks3/C
 AFdb84/VMLeQnTBLqfSpJDUiO08m1XJkFVdXw5sP9R77VvzVFz6Aoh9W/Iix2QMEfTznh
 v/EahNyrjX2AMprix1aMC5NRrjcodozONK49ibY1Ea7wyzc9t+qOzUYzNv02+Q8V6HVw3
 965cGhel5s0Z/nwcPv+23kmDTsNJ7QQnjQ/ZF8E7/jb9gbnGo2D0/IWIe+zi1Dqxc1i64
 BOW+eY0pHdwh/y2XScXayYRvQpLeJj0K8ly3gZVfbqVj3Xxez7uT91ZIkuhl+BGwoPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tX5LoDsgpHjMlad+/9gsoDd7266Y/ddS5DDdKoOuW58=;
 b=G8bQ14KDrLx+5u8ft1JJ+hpNR7saI4ceHVTxGeTtSDOzDA3fGVxcs2xshc/5Dverdt7X
 GiqZFpYft7bkiYHHzS6QtcsMDjZ7sNVU4PrUWE4YuaTlO23ynF3drYHgnHWRlx3SXHPXn
 HfJeavOaveDzPWVYUJ6Ys2revo8fJDuGHXQJyJYcb03cGqOwUTiPZjlHmvIMGDnxYympT
 Np/T3LPF+wlQHwmQGHqWXLmY2aQuQ6ngXCmEw4tZVpv/n/2JI68c0Lww0M6x9Kg93OBt3
 M5f7cL2MLQu8hMpqO5UtMYRn1IilimAKo4jYNBhhTW6vKA1pe5WJPQ59N21Ch+K6Qnw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A53A40B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A3849D388; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b7cae2efbb4e4785ace024767d2bea7f6e0fdf29
X-Git-Newrev: c26db32f9a30c897541608afbe3705c6252fd738
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.3A3849D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/avrdude: fix
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
Content-Type: multipart/mixed; boundary="===============8598855861922217575=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8598855861922217575==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c26db32f9a30c897541608afbe3705c6252fd738
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 54d83dec4b..32fc5f0f9a 100644
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

--===============8598855861922217575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8598855861922217575==--
