Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B687606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rm30YY6B
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1A960886;
	Fri, 23 Oct 2026 13:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T216xRAw2McF; Fri, 23 Oct 2026 13:21:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8381460711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761681;
	b=cKFGyBEpnMenrNaCxUDe35836Kx0//0J738Rwb7L41xHFlVEmh02P+nODql+dfXwbh/W
	 bkyqY5+fFRw7DHYdkrYBoClFuFjmdEwKNBmmgG9bEOMdjT+ykRos9lQ/fp5K2LnYL5S23
	 1Slpal34lSH0TGh2EFnSec1BVdmjAPSnfJNfz0nXXRKFHK2LreXyBnIXizjkaj4HAkYmz
	 fOZyYCw65ngmFUh9LqxXTiT/Z8Kt4YGnFM333zYjiThHcYSwzTLn7LgFVP4EPa9kSnxks
	 mSjy3BpyJ1M0YkwNKGJJCknRZWwkJ/h4fIDMV5kgtffZfHr7nYIaaVCov/KCFJuHauw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dNxXOedH246y3sLVSwfWRDderEioBiPtP22LQBze6DA=;
	b=U2e/vAfNdBGCjDfWM7Xko+I3+cq0Gpjk4mYxI0o8k3sLPBFQURK9mU+//BnKBemkMIg8
	 n+DQuCseuLqLT/DIuOaNk9EihVaomMH6hPU9DO+NW4el0lVUPOJn0lgO1U7PSovT5clGz
	 sIIummQnpGaKrO/OIqG4b5kYBn+vJq128Wrwmi8PZObzm7Tlc6U+otyciBl/zLEh3sThD
	 t5Mip/gsgJovNtZ9aOQmSqKdoyMvxTknBcE4D0x93zuIlxv1LQFZkhyxvnau76mu4BSWm
	 sFoy+doLbai0RM3JOmTkrozSHZupNuOh7HCY9JfqjuRsLAzuoUD/uwkl/8ofj+6gw1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761681;
	bh=dNxXOedH246y3sLVSwfWRDderEioBiPtP22LQBze6DA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rm30YY6BIOWhs+rKutmt7TM95gDEmWBAwPvby+4JmG0HJ2LhNrr+u6tdcOmEoxCgC
	 JBn5Ntr+Ugvauyc4QZeXNvAZIzVTZ0EmuA6JlmkWplJmGZiCNNu6AAXQP5C0zCRF4H
	 jY2A2iH34OsOHNTchnvH7J0rqJ4MgJyut+orxMchgYu1BgnLUU4YSdWUZ/xs7ekW4q
	 szz77jTJo/ezW4bAKQ0Ddi4xMeCVdfNEU5lGovJbsTnt0/dm/YyVbh18wzRKGyg83R
	 /qzbCYb4bqhK7WL+qvkIeI0VAJpDurgtIrWxkRU5edNS5o4vVRiH9jVmcuDWHKIJaV
	 wVAMHad/mH56A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8381460711;
	Fri, 23 Oct 2026 13:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1884F3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1618860886
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYtSDiHzW5dX for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4043460711
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761677;
 b=gKinHnGuPqz1sliV0aOP1iYTYDCQumX64BI0VN4JU93kgTCcL+KijnAWQv4vx1H72gP7
 M3wYxOiyu+37Ke3B5eazI61wqwAF7sISbv+LNury6XGgG+XPANEDRrsC0FFKYUH/gsqaH
 Td1zlX+4I8KQVcWEGhwTfBlAaDjDO/exAVaZq3lzHuU69OJp77V5tOWQrJC219jrnjHQd
 V5iEU9nQan9hikdNCdU72x5aMWUpCC1nHifynfiSK+4orBRoaWhnvdw8iHYdr9e5EHs4+
 RnIJZDzbFlxLnHhbyP2qGty7q8hTX3oAgNbspx8+iGXCgQsqeJYZq/YpOj3Jq0jCVAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761677;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=RQ9PC6Y/GziApWIw+6RiEeFUCIO+MJpghdVmeuU9N6g=;
 b=X+fo9/GT9tWSzNbnq+rPmLhkOBHHCyOu0EUc2Irznttvq0dYj4VZTR2jyBBRFZJ4XmIX
 No12d3NnGQ3NPYozYUl+buVbwHOE7YIWpjLEAiicd5ZTkLsWImjDi6S0kekfQajJWu8zH
 RslWpZ2/ZUlsv2mb489QzLtWX6rUN3HV9EdrzERc3kGzSjO3POdd4pmZE2R+FVxsSe6Z7
 GTvWjkh5Jfwq1t+ioQ8jRpx6pSRCfvnBFyEIakhATdDb9jrO5jIwpachX0yPloI/WAXED
 DoR6K0JwVLw/gEzFlnrPpPbgnzcaVPpKlXV/wOzfICQpk+W85AkxAsE6ED3q6c08bAA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iTwdtViM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4043460711
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so599472f8f.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761675; x=1793366475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RQ9PC6Y/GziApWIw+6RiEeFUCIO+MJpghdVmeuU9N6g=;
 b=z8QTv0bKvNJg8xJt7z4VpmO7d5gvnKLNNKYzgNVWrrbr+MLvKJ1IdlN5nFwWLCV/8o
 WMwHa26uqk3B5a3wQ4BG+ub60dJp4TQbTeY2xRgCLhE5Z2RhcP6LVYHl5/K/f4PoCTFN
 aD6LGYxOGwTToP2jKwgnCQvNgbbBxz+mNHrB9HE6DGUmjfzUCftCFgts17DYfmz1QX8t
 6LzWPNVMwwgztZX7Nk2f5v991scNid4v6V7Obh5Cs60Ybva0CqDZkwcHYO/FOiCLt0hG
 H7SHsRmd6eq6BVwvj4cAIUk3jH9eFu5Pn9eTyGszPQA+V5Y2HKsOYeGI0kZwUh5eyYNv
 HGxw==
X-Gm-Message-State: AFq9FYIfxFeXkkKdVRkSg9iLgZAD0WFml5Z1avpRV0hFX+nW60/+pEl9
 z9AlHZckYV74UWlJsP+8pQcHNmRB/XEW+mul1+PDeJPH1NTm5bMUjtA1K7s83j5T2BSuD2jyaJF
 iPom0V5s=
X-Gm-Gg: AYBFou0PuSojQgENoqy2aF8VaCp/sHE/oCKDLZfksn1g6AHgxOxmW7Eg0Hk+F+66zsK
 bc/NGz8W2ukp6N+QqKpcHJm6jazusCdT6umUAH6gVuyVtcmFIdtu3yVfXp1WVb9nQcirZYPegg+
 MgIQxaNmmnd1jUfvYZGN/M/Cv3fVKmm7kec6w2Avkt/jNXdvx3MEEkaNw2f4jzFYyG5AhMxaVx5
 J6DvrgC2/GCiWjoUzS1jyIGR3SRAvSq0BWT3MWLe12LzR1fK5prwW4oGRh1m/xsIQn2EDh7LONg
 7EqmQ00JBCTwVmFOXGwiizWqYX2memWlCF/9qo+gVWktbK5bpcR2gI4uZ1TEvQ91uS+/cWUyH3o
 RTLHQXN78eQewEPMLPKK5gBYR18pw4HYmsQ0T3dtdFoFazwn909aaTEyASkPhymoxpVa2rQyMqR
 h+N2HJblpekzmoAoSBHGMXkTw2inq9vQ1FhgOlqb3yJvg37sJMoMMC+wFYaF5J5YjOt+W0Pyvfk
 KEhwmwlqWrdAs4IDZDdM7VYKDSWTNz/6Ly8vjpftYw/O65/CfzyITXWAA==
X-Received: by 2002:a05:600c:a00c:b0:4a2:ebb:397b with SMTP id
 5b1f17b1804b1-4a211c916fbmr33460415e9.11.1792761674290; 
 Fri, 23 Oct 2026 06:21:14 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2153da673sm40369405e9.2.2026.10.23.06.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:13 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:11 +0200
Message-ID: <20261023132112.1607659-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020064225.176913-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/zfs: fix uclibc support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit [1] fixed ZFS support for uclibc 1.0.57. This commit
> has been cherry picked in LTS branch 2025.02.x as the same error
> occured in that target branch.
> 
> At the time the master branch was based on 2.4.1 while 2025.02.x branch
> was based on ZFS version 2.3.2
> 
> The ZFS version present on the master branch included a number of
> upstream commit [2][3] not present in 2025.02.x. Those commits adds
> the infrastructure to properly support statx in both uclibc and glibc.
> 
> Later a follow up commit [4] has been commited upstream.
> 
> This commit backport this set of commit to fix the uclibc support for
> zfs. Those patches change the autoconf files and thus needs to be regen.
> 
> [1] b6884913ae package/zfs: add patch to fix build with uclibc >= 1.0.57
> [2] https://github.com/openzfs/zfs/commit/523d9d6007effb01bf6a44f9942158f47a65e2b2
> [3] https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
> [4] https://github.com/openzfs/zfs/commit/2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...nt-on-path-based-unmount-using-statx.patch | 92 +++++++++++++++++++
>  ...e-sys-stat-h-instead-of-linux-stat-h.patch | 82 +++++++++++++++++
>  ...04-config-fix-STATX_MNT_ID-detection.patch | 41 +++++++++
>  ...s-cmd-statx.c-avoid-statx-conflicts.patch} |  0
>  package/zfs/zfs.mk                            |  5 +
>  5 files changed, 220 insertions(+)
>  create mode 100644 package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
>  create mode 100644 package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
>  create mode 100644 package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
>  rename package/zfs/{0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch => 0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch} (100%)
> 
> diff --git a/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch b/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
> new file mode 100644
> index 0000000000..4f1fcb75b4
> --- /dev/null
> +++ b/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
> @@ -0,0 +1,92 @@
> +From 523d9d6007effb01bf6a44f9942158f47a65e2b2 Mon Sep 17 00:00:00 2001
> +From: Ameer Hamza <ahamza@ixsystems.com>
> +Date: Wed, 9 Jul 2025 07:10:00 +0500
> +Subject: [PATCH] Validate mountpoint on path-based unmount using statx
> +
> +Use statx to verify that path-based unmounts proceed only if the
> +mountpoint reported by statx matches the MNTTAB entry reported by
> +libzfs, aborting the operation if they differ. Align
> +`zfs umount /path` behavior with `zfs umount dataset`.
> +
> +Reviewed-by: Alexander Motin <mav@FreeBSD.org>
> +Signed-off-by: Ameer Hamza <ahamza@ixsystems.com>
> +Closes #17481
> +
> +Upstream: https://github.com/openzfs/zfs/commit/523d9d6007effb01bf6a44f9942158f47a65e2b2
> +[thomas: stripped to only add support for the statx infrastructure]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + config/user-statx.m4                   | 34 ++++++++++++++++++++++++
> + config/user.m4                         |  1 +
> + 5 files changed, 89 insertions(+), 6 deletions(-)
> + create mode 100644 config/user-statx.m4
> +
> +diff --git a/config/user-statx.m4 b/config/user-statx.m4
> +new file mode 100644
> +index 000000000000..0315f93e0c20
> +--- /dev/null
> ++++ b/config/user-statx.m4
> +@@ -0,0 +1,34 @@
> ++dnl #
> ++dnl # Check for statx() function and STATX_MNT_ID availability
> ++dnl #
> ++AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
> ++	AC_CHECK_HEADERS([linux/stat.h],
> ++		[have_stat_headers=yes],
> ++		[have_stat_headers=no])
> ++
> ++	AS_IF([test "x$have_stat_headers" = "xyes"], [
> ++		AC_CHECK_FUNC([statx], [
> ++			AC_DEFINE([HAVE_STATX], [1], [statx() is available])
> ++
> ++			dnl Check for STATX_MNT_ID availability
> ++			AC_MSG_CHECKING([for STATX_MNT_ID])
> ++			AC_COMPILE_IFELSE([
> ++				AC_LANG_PROGRAM([[
> ++					#include <linux/stat.h>
> ++				]], [[
> ++					struct statx stx;
> ++					int mask = STATX_MNT_ID;
> ++					(void)mask;
> ++					(void)stx.stx_mnt_id;
> ++				]])
> ++			], [
> ++				AC_MSG_RESULT([yes])
> ++				AC_DEFINE([HAVE_STATX_MNT_ID], [1], [STATX_MNT_ID is available])
> ++			], [
> ++				AC_MSG_RESULT([no])
> ++			])
> ++		])
> ++	], [
> ++		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
> ++	])
> ++])  dnl end AC_DEFUN
> +diff --git a/config/user.m4 b/config/user.m4
> +index badd920d2b8a..62e59ed94437 100644
> +--- a/config/user.m4
> ++++ b/config/user.m4
> +@@ -17,6 +17,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
> + 		ZFS_AC_CONFIG_USER_LIBUDEV
> + 		ZFS_AC_CONFIG_USER_LIBUUID
> + 		ZFS_AC_CONFIG_USER_LIBBLKID
> ++		ZFS_AC_CONFIG_USER_STATX
> + 	])
> + 	ZFS_AC_CONFIG_USER_LIBTIRPC
> + 	ZFS_AC_CONFIG_USER_LIBCRYPTO
> +diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
> +index 488554f4e844..a605af962a6d 100644
> +--- a/lib/libspl/include/os/linux/sys/stat.h
> ++++ b/lib/libspl/include/os/linux/sys/stat.h
> +@@ -31,6 +31,11 @@
> + 
> + #include <sys/mount.h> /* for BLKGETSIZE64 */
> + 
> ++#ifdef HAVE_STATX
> ++#include <fcntl.h>
> ++#include <linux/stat.h>
> ++#endif
> ++
> + /*
> +  * Emulate Solaris' behavior of returning the block device size in fstat64().
> +  */
> +
> diff --git a/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch b/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
> new file mode 100644
> index 0000000000..1cac841a5a
> --- /dev/null
> +++ b/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
> @@ -0,0 +1,82 @@
> +From ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d Mon Sep 17 00:00:00 2001
> +From: classabbyamp <5366828+classabbyamp@users.noreply.github.com>
> +Date: Wed, 27 Aug 2025 17:42:32 -0400
> +Subject: [PATCH] linux: use sys/stat.h instead of linux/stat.h
> +
> +glibc includes linux/stat.h for statx, but musl defines its own statx
> +struct and associated constants, which does not include STATX_MNT_ID
> +yet. Thus, including linux/stat.h directly should be avoided for
> +maximum libc compatibility.
> +
> +Tested on:
> +  - glibc: x86_64, i686, aarch64, armv7l, armv6l
> +  - musl: x86_64, aarch64, armv7l, armv6l
> +
> +Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
> +Tested-By: Achill Gilgenast <achill@achill.org>
> +Signed-off-by: classabbyamp <dev@placeviolette.net>
> +Closes #17675
> +
> +Upstream: https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + config/user-statx.m4                   | 6 +++---
> + include/os/linux/spl/sys/stat.h        | 2 +-
> + lib/libspl/include/os/linux/sys/stat.h | 2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/config/user-statx.m4 b/config/user-statx.m4
> +index 0315f93e0c20..1ba74a40e9b8 100644
> +--- a/config/user-statx.m4
> ++++ b/config/user-statx.m4
> +@@ -2,7 +2,7 @@ dnl #
> + dnl # Check for statx() function and STATX_MNT_ID availability
> + dnl #
> + AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
> +-	AC_CHECK_HEADERS([linux/stat.h],
> ++	AC_CHECK_HEADERS([sys/stat.h],
> + 		[have_stat_headers=yes],
> + 		[have_stat_headers=no])
> + 
> +@@ -14,7 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
> + 			AC_MSG_CHECKING([for STATX_MNT_ID])
> + 			AC_COMPILE_IFELSE([
> + 				AC_LANG_PROGRAM([[
> +-					#include <linux/stat.h>
> ++					#include <sys/stat.h>
> + 				]], [[
> + 					struct statx stx;
> + 					int mask = STATX_MNT_ID;
> +@@ -29,6 +29,6 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
> + 			])
> + 		])
> + 	], [
> +-		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
> ++		AC_MSG_WARN([sys/stat.h not found; skipping statx support])
> + 	])
> + ])  dnl end AC_DEFUN
> +diff --git a/include/os/linux/spl/sys/stat.h b/include/os/linux/spl/sys/stat.h
> +index 087389b57b34..ad2815e46394 100644
> +--- a/include/os/linux/spl/sys/stat.h
> ++++ b/include/os/linux/spl/sys/stat.h
> +@@ -25,6 +25,6 @@
> + #ifndef _SPL_STAT_H
> + #define	_SPL_STAT_H
> + 
> +-#include <linux/stat.h>
> ++#include <sys/stat.h>
> + 
> + #endif /* SPL_STAT_H */
> +diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
> +index a605af962a6d..13cc0b46ac93 100644
> +--- a/lib/libspl/include/os/linux/sys/stat.h
> ++++ b/lib/libspl/include/os/linux/sys/stat.h
> +@@ -33,7 +33,7 @@
> + 
> + #ifdef HAVE_STATX
> + #include <fcntl.h>
> +-#include <linux/stat.h>
> ++#include <sys/stat.h>
> + #endif
> + 
> + /*
> diff --git a/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch b/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
> new file mode 100644
> index 0000000000..176dca28d2
> --- /dev/null
> +++ b/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
> @@ -0,0 +1,41 @@
> +From 2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5 Mon Sep 17 00:00:00 2001
> +From: Rob Norris <rob.norris@truenas.com>
> +Date: Fri, 13 Mar 2026 03:58:54 +1100
> +Subject: [PATCH] config: fix STATX_MNT_ID detection
> +
> +statx(2) requires _GNU_SOURCE to be defined in order for sys/stat.h to
> +produce a definition for struct statx and the STATX_* defines. We get
> +that at compile time because we pass -D_GNU_SOURCE through to
> +everything, but in the configure check we aren't setting _GNU_SOURCE, so
> +we don't find STATX_MNT_ID, and so don't set HAVE_STATX_MNT_ID.
> +
> +(This was fine before ccf5a8a6fc, because linux/stat.h does not require
> +_GNU_SOURCE).
> +
> +Simple fix: in the check, define _GNU_SOURCE before including
> +sys/stat.h.
> +
> +Sponsored-by: TrueNAS
> +Reviewed-by: Ameer Hamza <ahamza@ixsystems.com>
> +Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
> +Signed-off-by: Rob Norris <rob.norris@truenas.com>
> +Closes #18312
> +
> +Upstream: https://github.com/openzfs/zfs/commit/2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + config/user-statx.m4 | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/config/user-statx.m4 b/config/user-statx.m4
> +index b2441631c824..d359f48b8579 100644
> +--- a/config/user-statx.m4
> ++++ b/config/user-statx.m4
> +@@ -14,6 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
> + 			AC_MSG_CHECKING([for STATX_MNT_ID])
> + 			AC_COMPILE_IFELSE([
> + 				AC_LANG_PROGRAM([[
> ++					#define _GNU_SOURCE
> + 					#include <sys/stat.h>
> + 				]], [[
> + 					struct statx stx;
> diff --git a/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch b/package/zfs/0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
> similarity index 100%
> rename from package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
> rename to package/zfs/0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> index bdd7b2a3b0..e6c8f98af9 100644
> --- a/package/zfs/zfs.mk
> +++ b/package/zfs/zfs.mk
> @@ -14,6 +14,11 @@ ZFS_CPE_ID_PRODUCT = openzfs
>  
>  ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux
>  
> +# 0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
> +# 0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
> +# 0004-config-fix-STATX_MNT_ID-detection.patch
> +ZFS_AUTORECONF = YES
> +
>  # sysvinit installs only a commented-out modules-load.d/ config file
>  ZFS_CONF_OPTS = \
>  	--with-linux=$(LINUX_DIR) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
