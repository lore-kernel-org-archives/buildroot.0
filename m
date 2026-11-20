Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F9606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k/lrihdy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F134840ADC;
	Fri, 20 Nov 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXav3rLzIpEQ; Fri, 20 Nov 2026 10:01:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0CEA40E1A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168902;
	b=F/4LU2erJghUpiVrbqgOzKaiNYYgaJZno5iFpIChayWgHia6TsJ/lXbpDLhZeGBeWQ6X
	 A87SZXw7tDaP6vKbUD2y0WTMEMg9+xvk1LJSpLFAYouqG9nzJjzByIM5vIlkNsNLyEmfB
	 LTL/Jurk3zvnChukhwg7Nf8Ef9pfoF/dtfV/dirMhsPsrgzYX8gNnYDIz4NygsEgSYB71
	 8vWEVBp5nfI9VtEKJGvz+5W48ar8kzNehA/1ADZeNvLOyzg6I9xVvgMVi4uH1Lr40kEvp
	 QI71i1xp6uMyTQwpljgUepsKh9NQ5vLVpKyKKk3gtQvn9Ozq5717nqXAJ+6ZSMNue3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DZHqqgIKAGJR54y0Qj3FGq9M8wkYr2SmriaAfwg5tGI=;
	b=gDdKV+mcSyEwKiStoqc4EOQmxKKSg8Xz/RLPtRUZfH1lAhEkbNqG8mOfU47xEdTj9voz
	 7f257dk+ouUWc5yArulzmZ0U12YONUMSTFerRDN0melWekuEXf00FWGACgi71b6vltmHs
	 PeuQGLweDwDWeGhcH82jchdrfC6LSEm3GL++7Z6YTfHIolTNpPqGw0WTMeqeSvLASIGK6
	 G+9/Myrmo2VmE+HEkwEYN5KC49TsUvZZvyF3+Us+i3RkOJUHR7eNO1/n0Z4CHRI6wAwCm
	 GjRU5qQl3n+JULdmx2mrFGlyaCpkSfdAKy6V5zUGbN1yEzn86UetvUoGs/2Zy+vbiaQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168902;
	bh=DZHqqgIKAGJR54y0Qj3FGq9M8wkYr2SmriaAfwg5tGI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k/lrihdyDnB8Jrh6YTYY6NPAt1KZlF1hLeVpsiABr/qaoqF42lOL/82RI5zLdTMdg
	 Ee8xjWFBglFODhOYdDAUYRuy63YUXrAfXfcenrh/DnLNGfTaXDdUKg4Yd6EApUfvzE
	 LPSMCCNrQS0bZLrCvXnVSeSVe/JJ9v2pAmbr3ey9kN9qfxbVrVBr7cxCjh07EpWo1l
	 t2Fa1l0xMF3Bk5YGnw5CE3/Ukh4FA2BpASaU6+vC4ybZLfBfKfk4pRAB+gp6V+54iT
	 vr0SNHln5XvbqON9VFdzpHu0ETqx48wX47A7QvXK+Hj1qkAZJ6pB4GIsv9//plWCVQ
	 G3jGQJf2UksYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CEA40E1A;
	Fri, 20 Nov 2026 10:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD5B169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33C3A40E1E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UJSsAebyv0T for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CACA240ADC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CACA240ADC
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so4786155e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168899; x=1795773699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PBSUVJiVTeClh/qzm9Pttcm1KQkaQZULS+Fro0dFYLQ=;
 b=HCHiCmETcANW9/szroQgCNGfKPiz0cX278MSS3CqCn0Z9+tIVnzNbt612oWD+WqUTu
 yxDHr60yCrPWq1PKPjvdu7XjzGbI2lOS1VF46A+udgpgr6j2kmzM85hf+mFf3nTQ/uZM
 veSqPJ+D5EseevS0IAUPBOkvJKJ9gTlOvxRXN2bFpHX5RhUIL0/r316820b5r+Ag+dRB
 eHLwwAXV+I+gCkxcyR+hh0f2UNPPjSdTLjWrRYxHiSRQjPeDltQbBG/IFBbtQ/KBRiNm
 emDHVh9HFzJ+HYeBoheU/wngNgq0zET0YP3mhKjiTu+34TsEjm5m501q/15XYqsbhzP4
 mC9Q==
X-Gm-Message-State: APuU4Z+Tw52pbfagfg7RRp739RDql22g9CpTZpCHUY7Ge81aFFNt2uBB
 E6nbKgcDbAE3RQUmF7XgXsP0Pbx+BHWfbe358qkWWC/pH9tR+RiiOVq/UYFMxzzHr1ZutqkVq4S
 fs3+3/1C79g==
X-Gm-Gg: AYBFou3IY+50ZC/YCi0fcNbm1FOqNkvNjs48xHo11LOFzEXX/a0cE8E3aTsaOG7gS9E
 sbaPWiSSk8Fqp2X1KlQZSzI/Y57PEnkeXTnIb9j8kQjBKSpAkMsK9ZNvLGmKXKRUCon90OC0rBB
 FH+g40ZUC+6NemNNpl81FatHRhK4RJtk9ulhe9V7PA+ZLT+2F0c+Z7RB0K4xVyu0O6IRgF2LpPM
 32Oe8dQdKXMOZqewD/YB+P084JPbXDzGPSdAJcafbr36Jg6MtinLlv0vrSN7gCnMoeLXEQI/I6z
 7nExRPx2T7oVEILEFRy/zNN7c8eE38hwaO1cnsP0K0Ufmx3lQVKMjG2OjxmnvszJUAeobTTeH7e
 XFoyq2t741/U5FhxWgNbG5sNZmUXou+GNj4mOTE1tVKzWJKOZskaV7PxANFMvPQI57UJ+kwtB3E
 XzvkFCv4wjseNuUoYV0v4bNvuFNCGSR8K0al0bl+/eoSTgjCRxJHlu08MVW8oTZXxTv/tp14ejS
 5SEjrglWWOZHnVMU3VaOTY7OiV+1sjSMU0M1+2PTelKpCwEQNGx6hB/5jUtamCpFMw3zfhnLleu
 qlOCdIjdulBNVpZ+XkQZg7JAmzx4SowjbnxJmXfVobsC
X-Received: by 2002:a05:600c:a08e:b0:4a1:fae5:f2e2 with SMTP id
 5b1f17b1804b1-4bb887e0682mr57839995e9.4.1795168898134; 
 Fri, 20 Nov 2026 02:01:38 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb895faa2csm41420575e9.1.2026.11.20.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:37 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:33 +0100
Message-ID: <20261120100136.543170-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116175316.1131644-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/libblockdev: patch
 CVE-2026-111581
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This fixes the following vulnerability:
> 
> - CVE-2026-111581:
>     A flaw was found in libblockdev. The bd_fs_ntfs_set_label() and
>     bd_fs_vfat_set_label() functions pass caller-supplied label values as
>     bare positional arguments to the ntfslabel and fatlabel utilities
>     without end-of-options separators or input validation for values
>     beginning with a dash. This allows a label starting with '-' to be
>     interpreted as a command-line flag by the spawned tool, potentially
>     bypassing safety checks or causing unintended operations. This is
>     reachable by unprivileged local users through the udisks2
>     Filesystem.SetLabel() D-Bus method without administrator
>     authentication.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-111581
>  - https://github.com/storaged-project/libblockdev/commit/4ef6b2b4798a46566fe8815eaabd163205be20bd
>  - https://github.com/storaged-project/libblockdev/commit/bf990ef6d720b4a0d3cb22c572f473fc5dc7f83c
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...ect-NTFS-labels-starting-with-a-dash.patch | 49 ++++++++++++
>  ...ls-from-being-interpreted-as-options.patch | 78 +++++++++++++++++++
>  package/libblockdev/libblockdev.mk            |  4 +
>  3 files changed, 131 insertions(+)
>  create mode 100644 package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
>  create mode 100644 package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
> 
> diff --git a/package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch b/package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
> new file mode 100644
> index 0000000000..9a4613f421
> --- /dev/null
> +++ b/package/libblockdev/0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
> @@ -0,0 +1,49 @@
> +From 4ef6b2b4798a46566fe8815eaabd163205be20bd Mon Sep 17 00:00:00 2001
> +From: Vojtech Trefny <vtrefny@redhat.com>
> +Date: Tue, 3 Nov 2026 15:39:58 +0100
> +Subject: [PATCH] fs: Reject NTFS labels starting with a dash
> +
> +Fixes CVE-2026-111581.
> +
> +CVE: CVE-2026-111581
> +Upstream: https://github.com/storaged-project/libblockdev/commit/4ef6b2b4798a46566fe8815eaabd163205be20bd
> +[thomas: drop tests and backport context]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/plugins/fs/ntfs.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/src/plugins/fs/ntfs.c b/src/plugins/fs/ntfs.c
> +index 424f606..78b56d0 100644
> +--- a/src/plugins/fs/ntfs.c
> ++++ b/src/plugins/fs/ntfs.c
> +@@ -221,6 +221,9 @@ gboolean bd_fs_ntfs_set_label (const gchar *device, const gchar *label, GError *
> +     if (!check_deps (&avail_deps, DEPS_NTFSLABEL_MASK, deps, DEPS_LAST, &deps_check_lock, error))
> +         return FALSE;
> + 
> ++    if (!bd_fs_ntfs_check_label (label, error))
> ++        return FALSE;
> ++
> +     return bd_utils_exec_and_report_error (args, NULL, error);
> + }
> + 
> +@@ -235,6 +238,19 @@ gboolean bd_fs_ntfs_set_label (const gchar *device, const gchar *label, GError *
> +  * Tech category: always available
> +  */
> + gboolean bd_fs_ntfs_check_label (const gchar *label, GError **error) {
> ++    if (!label) {
> ++        g_set_error_literal (error, BD_FS_ERROR, BD_FS_ERROR_LABEL_INVALID,
> ++                             "Label cannot be NULL.");
> ++        return FALSE;
> ++    }
> ++
> ++    /* ntfslabel does not reliably support '--' to terminate option parsing. */
> ++    if (label[0] == '-') {
> ++        g_set_error_literal (error, BD_FS_ERROR, BD_FS_ERROR_LABEL_INVALID,
> ++                             "Label for NTFS filesystem cannot start with '-'.");
> ++        return FALSE;
> ++    }
> ++
> +     if (strlen (label) > 128) {
> +         g_set_error (error, BD_FS_ERROR, BD_FS_ERROR_LABEL_INVALID,
> +                      "Label for NTFS filesystem must be at most 128 characters long.");
> diff --git a/package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch b/package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
> new file mode 100644
> index 0000000000..9594d16ad3
> --- /dev/null
> +++ b/package/libblockdev/0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
> @@ -0,0 +1,78 @@
> +From bf990ef6d720b4a0d3cb22c572f473fc5dc7f83c Mon Sep 17 00:00:00 2001
> +From: Vojtech Trefny <vtrefny@redhat.com>
> +Date: Tue, 3 Nov 2026 16:07:59 +0100
> +Subject: [PATCH] fs: Prevent VFAT labels from being interpreted as options
> +
> +Fixes CVE-2026-111581.
> +
> +This also requires dosfstools >= 4.2 for setting label from now
> +because the "--" option doesn't work with older versions. 4.2 was
> +released in 2021 and is now available in all major distributions
> +including Debian 11 (oldoldstable) and CentOS/RHEL 9 so it's not
> +a problem.
> +
> +CVE: CVE-2026-111581
> +Upstream: https://github.com/storaged-project/libblockdev/commit/bf990ef6d720b4a0d3cb22c572f473fc5dc7f83c
> +[thomas: drop tests]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/plugins/fs/vfat.c | 31 +++++++++---------------
> + 1 file changed, 11 insertions(+), 20 deletions(-)
> +
> +diff --git a/src/plugins/fs/vfat.c b/src/plugins/fs/vfat.c
> +index 744bc9f..7866964 100644
> +--- a/src/plugins/fs/vfat.c
> ++++ b/src/plugins/fs/vfat.c
> +@@ -46,7 +46,7 @@ static GMutex deps_check_lock;
> + 
> + static const UtilDep deps[DEPS_LAST] = {
> +     {"mkfs.vfat", NULL, NULL, NULL},
> +-    {"fatlabel", NULL, NULL, NULL},
> ++    {"fatlabel", "4.2", "--version", "fatlabel\\s+([\\d\\.]+).+"},
> +     {"fsck.vfat", NULL, NULL, NULL},
> +     {"vfat-resize", NULL, NULL, NULL},
> +     {"fatlabel", "4.2", "--version", "fatlabel\\s+([\\d\\.]+).+"},
> +@@ -281,33 +281,24 @@ gboolean bd_fs_vfat_repair (const gchar *device, const BDExtraArg **extra, GErro
> +  * Tech category: %BD_FS_TECH_VFAT-%BD_FS_TECH_MODE_SET_LABEL
> +  */
> + gboolean bd_fs_vfat_set_label (const gchar *device, const gchar *label, GError **error) {
> +-    const gchar *args[4] = {"fatlabel", device, NULL, NULL};
> +-    UtilDep dep = {"fatlabel", "4.2", "--version", "fatlabel\\s+([\\d\\.]+).+"};
> +-    gchar *label_up = NULL;
> +-    gboolean new_vfat = FALSE;
> +-    gboolean ret;
> ++    const gchar *args[5] = {"fatlabel", "--", device, label, NULL};
> ++    g_autofree gchar *label_up = NULL;
> + 
> +     if (!check_deps (&avail_deps, DEPS_FATLABEL_MASK, deps, DEPS_LAST, &deps_check_lock, error))
> +         return FALSE;
> + 
> +     if (!label || g_strcmp0 (label, "") == 0) {
> +-        /* fatlabel >= 4.2 refuses to set empty label */
> +-        new_vfat = bd_utils_check_util_version (dep.name, dep.version,
> +-                                                dep.ver_arg, dep.ver_regexp,
> +-                                                NULL);
> +-        if (new_vfat)
> +-            args[2] = "--reset";
> +-    }
> +-
> +-    /* forcefully convert the label uppercase in case no reset was requested */
> +-    if (label && args[2] == NULL) {
> ++        /* fatlabel >= 4.2 refuses to set an empty label, use --reset instead */
> ++        args[1] = "--reset";
> ++        args[2] = "--";
> ++        args[3] = device;
> ++    } else {
> ++        /* forcefully convert a non-empty label uppercase */
> +         label_up = g_ascii_strup (label, -1);
> +-        args[2] = label_up;
> ++        args[3] = label_up;
> +     }
> +-    ret = bd_utils_exec_and_report_error (args, NULL, error);
> +-    g_free (label_up);
> + 
> +-    return ret;
> ++    return bd_utils_exec_and_report_error (args, NULL, error);
> + }
> + 
> + /**
> diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
> index ecee8dee24..d1bd9a0f08 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -13,6 +13,10 @@ LIBBLOCKDEV_DEPENDENCIES = host-pkgconf libglib2 kmod udev
>  # 0001-Provide-replacement-function-for-strerror_l.patch
>  LIBBLOCKDEV_AUTORECONF = YES
>  
> +# 0002-fs-Reject-NTFS-labels-starting-with-a-dash.patch
> +# 0003-fs-Prevent-VFAT-labels-from-being-interpreted-as-options.patch
> +LIBBLOCKDEV_IGNORE_CVES += CVE-2026-111581
> +
>  LIBBLOCKDEV_CONF_OPTS = \
>  	--disable-introspection \
>  	--with-loop \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
