Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211B8C27C7B
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 13:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC798281A;
	Wed, 12 Jun 2024 13:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPcqo2OB00ca; Wed, 12 Jun 2024 13:57:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3857082AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3857082AB9;
	Wed, 12 Jun 2024 13:57:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A49B1BF371
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B58481153
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLeG0qoQ7xrP for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 13:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD542811A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD542811A1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD542811A1
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 13:57:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.77]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hzj-1sRTFn3CJr-012w6m; Wed, 12
 Jun 2024 15:57:28 +0200
To: buildroot@busybox.net
Date: Wed, 12 Jun 2024 15:57:26 +0200
Message-ID: <20240612135727.11811-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612135727.11811-1-ps.report@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SMED9Js6PoopDwVn/bQCW5r6NMgOqLNaVE9bPf+5YZHG427weUP
 9IkE0wQ1GUrOWap6UZPAEOFleOdpMrhvNGcmVcZRgPBX+jQtUZ774OrnynfFvzHnI7VrPLV
 M4PO7QpiPio7vvoHpfDWZ/o/xFDmydUu69HDghzXFLY061gToAv+bHQnQfkwQvaD9KscupH
 q3zfmwrzsb+NDPrwabCUQ==
UI-OutboundReport: notjunk:1;M01:P0:Y1AgpVYOn5I=;6MYsIV88VjblGjdE1GVaBQEsLHs
 ZNzNnYm+vIorczqh8OuH65O3EU/jNvPlH067lXy/Pk6n35IyiszKbDUOeJYfXSVAznF9RMuDG
 iIqn4X/SuEl6cJnb7EojPOk3p6pPVufnAHUczoOMxc7o7AAGWg+ORJkQnd7GeF8UvxxUILeh5
 vLTIGzFlE1BaMFQeCFiMzkq7xILLjVZV1chzVwluX1gU8vQ0mBV9l63bgXIsS++yoUm2jgNxf
 uxkgRYDu8J60Y3Zp4GLRURMM8XrMlfl+Hi1k/JYBbaSQ1GfaZBRY8KDEBOSTSgiZZ06Cf9J+G
 JFk4n0+dIDZI+I+wnzIpalD77+xIM2JjZl1x2jwQ0NIZ4gagdkzJRbHcJuSQYHm7ZAHhRYVSP
 swFGJTohPLhkHlvcsvV+aFSvB7v05gjKLTSafviCVp299zjbuzna8lqAgNtyb16DRqw5bhb07
 d2AqpUtCwAOJUpYajSUc3B7EQ/hWTKaEI5roO4WwcLY4Z96fqieh0LEMnSedNgdc93sFChxcs
 fVYybhfhYBdyoIyepRvy7QQmb8quMq9crJgEfG9pf1h8fsOiTXRzuODuXLiiaIAMPA3E97ts5
 tgtLzJiyscCALUOqUM7kQ9wHHDoELcwj3JrTMEyFSyFMNHS4jvrO9Nf85Dqe1EfAH8cbFPw4n
 zyn24wOLIA91j5JcM1S/a+m02CILQWRUFYA+fWnvX+RnBZHBfc/K0Lx9PleBxeU/d2CNZOaBu
 zAxckgwW0wXrCFVhl1T5SIACWTYGIveLw/7lWvmwRau0DnVd/b9N5oGRfP1s8mRWeVxGHLaNQ
 g+BK0F8Xznr9KCHlBoHB5wEkCE28qaY4VI1gfYU/1xRaE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1718200648; x=1718805448; i=ps.report@gmx.net;
 bh=FekpCjmJgUxqLh0pDtM8jl6w3BBJBF+R0865dktZgAY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=I+IPENaT7DR0rHmNzqWxmTq5Q7D9ig1NJXqk0GWvX/AKiGcFmPiNAR2C188JI81D
 Aoj7wAif9laZygVAIh5LMMmyvUArz5Q/gdrII5CByNjTO9HecOv1RIPELHJfibgZ4
 Bi2DWCWkuzesOoRp0jGv8XQkyQxfGO61zBl8Xe3qx+LQ0QV4Yjs5W5ktvq0ruOklN
 un5n3DBwFGTo58ue9hZP6m4UgWtSZAJ6wGC66tErXWy8Tu8XXdTsC5De/6MOXKVtQ
 SPkOsFMk/4HM9NUS+paOeGqNMZuL/eXzEt1McySKdz3fl0bkQjtiPS450/Ps1OCZJ
 S42OGreeLnb8dmdYyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=I+IPENaT
Subject: [Buildroot] [PATCH v2 4/5] package/xz: enable year2038 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

- From autoconf-2.72 release notes ([1]):
  *** Support for ensuring time_t is Y2038-safe
  configure can now ensure that time_t can represent moments in time
  after 18 January 2038, i.e. 2**31 - 1 seconds after the Unix epoch.
  On most 64-bit systems this is true by default; the new feature
  is detection of systems where time_t is a 32-bit signed integer by
  default, *and* there is an alternative mode in which it is larger,
  in which case that mode will be enabled.

  In this release, all configure scripts that use AC_SYS_LARGEFILE
  gain a new command line option --enable-year2038.  When this option
  is used, the configure script will check for and enable support for
  a large time_t.

  This release also adds two new macros, AC_SYS_YEAR2038 and
  AC_SYS_YEAR2038_RECOMMENDED.  Both have all the effects of
  AC_SYS_LARGEFILE.  (This is because it is not possible to enlarge
  time_t without also enlarging off_t, on any system we are aware of.)

  AC_SYS_YEAR2038 additionally flips the default for --enable-year2038;
  a configure script that uses this macro will check for and enable
  support for a large time_t by default, but this can be turned off by
  using --disable-year2038.  AC_SYS_YEAR2038_RECOMMENDED goes even
  further, and makes the configure script fail on systems that do not
  seem to support timestamps after 18 January 2038 at all.  This
  failure can be suppressed by using --disable-year2038.

  Changing the size of time_t can change a library`s ABI.  Therefore,
  application and library builders should take care that all packages
  are configured with consistent use of --enable-year2038 or
  --disable-year2038, to ensure binary compatibility.  This is similar
  to longstanding consistency requirements with --enable-largefile and
  --disable-largefile.

  In this release, these macros only know how to enlarge time_t on two
  classes of systems: 32-bit MinGW, and any system where time_t can be
  enlarged by defining the preprocessor macro _TIME_BITS with the
  value 64.  At the time this NEWS entry was written, only GNU libc
  (version 2.34 and later) supported the latter macro.  Authors of
  other C libraries with a 32-bit time_t are encouraged to adopt
  _TIME_BITS, rather than inventing a different way to enlarge time_t.

- In buildroot there is already the BR2_TIME_BITS_64 config option
  ('Build Y2038-ready code'), which enables a system wide
  '-D_TIME_BITS=64' compile flag (and maybe should additional set
  '--enable-year2039' configure option for the autotools-packages?).
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e051ad0047..d81d0cf4ce 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -39,7 +39,7 @@ XZ_CONF_OPTS = \
 	--enable-unaligned-access=auto \
 	--disable-unsafe-type-punning \
 	--disable-werror \
-	--disable-year2038
+	--enable-year2038
 
 HOST_XZ_CONF_OPTS = \
 	$(XZ_CONF_OPTS) \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
