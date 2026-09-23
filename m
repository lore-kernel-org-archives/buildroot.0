Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42742C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5CFC40F0F;
	Thu, 24 Sep 2026 18:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmHyNdcupEYV; Thu, 24 Sep 2026 18:58:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EA6FF40F0D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276290;
	b=FlPcfruK6J+yt8Sby8iZcX5JL6QU9phvRTaY2tVQdhqdYWnbHbN7aDv6AiE9wh4WIQfr
	 gyzvCe57/Bg8zEf8cLbLiaekFSlWHt6iNc0wHKZ6nyx2X8vjcQ7mX6IiduQtCxzgQiqgL
	 nrBLX3kFfoKTHwV2bfYlNDWRA16pLpMYocqga9eV85H8WeUDiyMfXlhOxaRLZn7+MQXMP
	 8rehcSbvFhtL2usmNspj70WJeHp4HEE8xQc+8Ebw2NOYaqEJPuP23/rfX9FsUnMyLrP+M
	 wOUaDQdkG86lXwBFQoQ0OPCVAyKJueUEVpC4TDDh079KwclZSZlsG/mdTWKFlPzEYFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UFBJks2txFv85L5CDfa8AhappkXp7lMFr+/7Pr9wWJE=;
	b=VntKkN/nDegegbU6I9OLa9tdNvcIvlRn/IM8cMFWL9JCkzWHwE022J3076Zh9ucrqBtE
	 hEOiPtLUt3GUPpInMDbw4ImgCPgfjjZvzzkFYZFlH83tl+oV+jglf6rOCOq0XlNuLUAzz
	 bq7kyZVS/d1HZhJDLHVGkCDlUAMMcJd4duV0qmgFGdubXBAFEWhlAcg3pPRNqjUlUem97
	 nhM4R9q/Xx616Fza+XsZqrImPt0C5kSkcZXG82O0muvwqcQGrJimXZxGdSsqcvpmtI0Kk
	 bRy+Pj+cRz28fmxowQAq/mj9LalV0/lcN9RBGfG9TxmX3KL060u3S0bfGF1dZwfeA+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276290;
	bh=UFBJks2txFv85L5CDfa8AhappkXp7lMFr+/7Pr9wWJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VL6O7LcPUChgfD/tdBsUG1XhkM7rn6Q+fyC8u0/3JgBpJRwt5wlmxpR2EhIGtdJri
	 KMmoTqpAmxru+fmpnPe7tte5w6kqD77BLqlMjJHVY+MLZnPuLYIed4SdiGvLMwfk9j
	 gDbbruZf2ywLpmrfFIIuoI6uBruEj2EG9ApVQvQlUjACZs5FpYVK7KvNIQYCvXcLfZ
	 MpokbRFizOmYxa0cdjJ47mRHBtCJwfdWwGcmS5Rgc+OuEC5NJkw//L5ZqCnruOGsGX
	 OO57D0Oh4MB6OCjAbGUzjMAxFXdnA/5cYQre/lrQqWHyEDtt2mgKKmC2hhwREq6omy
	 /2R3T1E/LZtAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6FF40F0D;
	Thu, 24 Sep 2026 18:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AED72937
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9953340AD3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8Sn1zKugBCi for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C13240AD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=Vp1/vzI7UUic9YR3DscjimImbsbWccP1lIESVsDwe/4qnkHbS5Qv6rXQTc2KW5NxTx4P
 gaQg5H5zdcbDps6RXEQRIl+xdPmCRQZFnxGT1hEzqVDalRBksLKpefOlvFuyYrb8FA6g8
 DBaTjOSLYY4k9jsYPZL/xiBJpEfg11Fx3ugdE0PBJhFQJMrj3yuISXP3cWbVE2l1zH5a3
 Mnr8++c2n7oYMDa38EFRcdVfheAVnizWMqpbdROhctlOfdm/A2SMiVAIgPiGPHO/gqBeO
 EnsXVId+2OZCuaFjm9vaakhOCM8TYq3nhg6Pl4XGqznshbBrd10+eriV2m8SJuVGqOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X5skKO6jz4VeGP6Mge8BRZ/ji2/bPcDq4h+p5UeZKkQ=;
 b=hadhOghgHH/eQooWYTQcC+68rC9KIPackwXbJis8L/r2s8xbCvZQdfuzSKR3TEfsIQKw
 MeDPHDjB+XaqNWRrp0bIlzqMvM4isVlHhHHn3kJ8fADq6u5UA6pAxncItyBX9sOV/m2V0
 j/SBBO5pb4eMbTh9xYyZbeKzs196oq6fiLjmEmGK4QMX8hVfx98dMJN5aYv9g7j2zhISp
 5eNqu222b6d1y4/zjcWwnkcTcGuKGWqjVXwmgP2JpDvqoHEkN7bNF99vLKun1WuD7ehB4
 m4CtnXWJPG4NDtUgPoMM6bp8FeCX8H2vOIaJTwXFsDV0NAC75esLMEy6ZU/odFYT+Tw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C13240AD0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F30F0976B0; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:35:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f1d99a9c2d7773e8418c09f43d2cf930e75b697f
X-Git-Newrev: 917f03d0625bf0b8b07fa8b8c3f4ff15be4246d6
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.F30F0976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmpeg2: fix
 build with C23 compilers
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1170618416229089624=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1170618416229089624==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/917f03d0625bf0b8b07fa8b8c3f4ff15be4246d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

libmpeg2 contains code using K&R-style empty parameter list
declarations, which no longer builds with C23 compilers.

This causes issues with:

- GCC >= 15.x, which defaults to C23

- GCC 14.x, since the bump of autoconf to 2.73 in commit
  a6e8c07a330a389e9578d8f1110e41becac264d2, as it causes -std=c23 to
  be added in the CFLAGS by the autoconf machinery. This doesn't
  happen with GCC 13.

Fixes:

  http://autobuild.buildroot.net/results/53daf0b4bd8b476252ca219e53a966405ece7e51

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f472d08d87dadb4301db2afbb72088bf573d7c8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libmpeg2/libmpeg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index ec23dff57b..4d4e17d13d 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -16,6 +16,10 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
+# Compilers using C23 no longer allows K&R style function
+# declarations, so force to use gnu89 standard.
+LIBMPEG2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 LIBMPEG2_CPE_ID_VENDOR = videolan
 
 ifeq ($(BR2_PACKAGE_SDL),y)

--===============1170618416229089624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1170618416229089624==--
