Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD190606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MO3R7kFJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE45A60815;
	Fri, 23 Oct 2026 13:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gYJcamg4yjz; Fri, 23 Oct 2026 13:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E16B608D5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761625;
	b=BCRoLNggOw56Y5ymdxS7ZsbjBaMiFr9WOyHqK8cnYiB8sbBB0jexoC1txBHvqqjTma6O
	 x0qmYynEBpOtd3k5SmBuzX81GgtbFKl9bN/J1hM/Hw6KvakbgzjGiBDD0/CxJMcEXVUb1
	 RJ+OahAyDAWiVWRkuf1If69fjGJG4HoXAP8adlSUV2qUA4qpjsMA2BlcpIUbwgVsdbthi
	 Tj7vMb3fane7FvNYj5frh1bQDLYGBPDsYiEgWXBygdJ9F6TuaDnqaBAS3LOVCjHuouzG5
	 vASG/XfnxpFO32lKexOIKolxHjdl/Dd16m9fXjT53XIpmnAoH4Lkrm065WVXbcz16yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UZc7Qu++thV7d4VzdN9LpF5wcC1p0UAkkbRSXkTqFqc=;
	b=X3/JWQQTA/pZEXcRenJvXdBA7xoPMFxfmZclfOgl6s+Nn2ToBLGUqKc8Ut80cQx58AdV
	 lUy2gdgK0eIqdFrTBBUXtq389vLYQB3vA3QdC4tEz3XiQgrt3uhOKfcXw0Nda6pnNH0Kp
	 04EHaY7t1/lHR699ljKnP1gPYIWhEHVQXuXfe/pWCl89ZmbnMPIxpDi+ml5S3uExW8uMV
	 1y++1J4upHcwwk4xcOf4DktAWPfcwV8Mxh+goyq9l1RXkLgBst7WY+VKZAbZdfFV7+3M+
	 2eQmxx7dXEEGHy9niIDEtfL4iuo+mP/RMyQQY0cYZI0ZHZ//FHedkpYutaaCigtVZ4g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761625;
	bh=UZc7Qu++thV7d4VzdN9LpF5wcC1p0UAkkbRSXkTqFqc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MO3R7kFJVA84pfDC29HY83wiJ4jODegMkqu+ovDrZKzNuksuSBQZMa5GHejfXwE66
	 AT4hq8igOhbINjOCF7Qr9uFY2gx3WPGvOYaNXEAo6mrin+5HKSfuGq4FIAiaFGP7zH
	 ujRHgYhDijQZQFgr+momIVnMHi/dLHaugIGstZJtL3UV0canWw4NaExzps1PYG2iqn
	 BQxTU/8OrsJl5MIGnN3hNLB53xCCUhe1uWyr0t+KrlwdyTINumbjkWXoFBhy9z9+LT
	 QQKPEQrxK8AN/KvHcpL2qQ3hdSoch6gp+UMD2zAmolw/AKFA7d8DaHLc+zj4wGFzsy
	 Ox6jWp90r8oRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E16B608D5;
	Fri, 23 Oct 2026 13:20:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E603C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4990401CE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqC-rkBa_nj2 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 96A55400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761622;
 b=jfRg/g2Js63kLeVz0RNaDtcxb10+qeECQuqM0f8GWF4XUNXPEHed002xjaNQkvs/M/cH
 PSEbxSH3vbOucFfNeWSToI7v+fT0oxlMX4lw8B8Dz23aBYWhOMrTegehBYp3ByYt7zQ5g
 2n9UqqOSinMga72WpFojdm5fpFp4QGl1nI2tDQ+IMcFo42lZA8KKmlf1JqFZqcJC9AbQI
 K2ZYD6VAz07loJmxf/E1HoVvZxlDsHFsETm59JF5iSyzWDmmWWlxvMSAZqOejmII17xA6
 BCFJU1mEs3fdZCZYUM8l2j0VrbTh+oE30HczhhUnU1Nn10kAsVUg+BT7KMc8B2Pex0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761622;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=R5/MB9RsSPLNklAh7+BsCBp7uIAqeaSQNiaVi9ZjWvM=;
 b=Zdam6mbc78rYiAIIPAElZ5GUuJ3W71Uc5zAhLWqyDL69IpiD7sfi1XNh1fY8/q7e+nuh
 oFR8mBZTGHf8yqoquv06SSQaHb6in8fRWbfutZFtljmH5VBH9mDRBdF9weuQJajmoIE3y
 VzvXV8peWgtj3qeuhZayACU87ba1gRQZ6DftMWT+M1Utx4uiQvRsl2p/L3c6u08wvvZH4
 dwqF70djcqhvyDtvunahxqfwmP3KHSuQsBCkbxMnK4OwpSDJ8uWBM8Thr55qUF8YjqpwL
 J/sMdWSncE5yb2ZiPMt6Ny+SUH07LCuLU3gYbGB2vilkgW8sXKHyWs2jB6ZD+mZqFnA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="P/S88L6Q"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96A55400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so283858f8f.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761619; x=1793366419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R5/MB9RsSPLNklAh7+BsCBp7uIAqeaSQNiaVi9ZjWvM=;
 b=QAHhn9Ke5Y7s6i4IQyrgXoRzIkL2TyChjmiDCft5O8sQ7PlP5wtjkUHKzNfv1ICshX
 x2RxRG0NNeQhSnn4W1YRUUHs48S9Hv5ywkaYOU7T8/0+oySoOQZ5qNf5sZR6+X5Qh9r6
 n1MLPvS7Bkm9Gm1A9HYthfuMJryHv3dDTPbZxjGAbDB/+UWnTWrY2+AhM9WTAAtQRykV
 ZD4tyU4iUOuHApCrBPOuNjAu5BAch912CTCq9+I6HvUPeypgYO57pPDjOW6qSH8e8Vgr
 Buo6mu/9u1oOG8iKNFJS8CLkWq4wb088lDF/cJMm9qWZFIRtlY/5unkQ6erMjZKrUQm/
 n+FA==
X-Gm-Message-State: AFq9FYJLVSAi91WpjyKN9pMcecaB37QxKoCvWNDj7GiaSU5WBIcbbMXT
 +bz4RPsO6ULbw8f8f3WvKaMxOYsn0vJwR2p+rWC89p50oHIA9RUnkBOkDya9pRTyoqEXBjNKQoE
 O/e3tmD4=
X-Gm-Gg: AYBFou0K2NbPEkxcczz/H744iG7zJB2+kVUWpwLz6TTeoPSOi55NPDw24+OjzadLjOC
 mJYQAg1BkDuPr3ofyue57id7OQhi67nZJ/07PnYtgTa9Xvnofu7oy1CAve9X4y1OxG0leEXbIYe
 6YtzQcfj7WuhK9AyQnVN75eBm2enCoNkN7CZX0Cm1QJk+40dw3ocwNkcHpBxTZaAW4jq4r6o0nV
 MUw/nmExYhpKhPtKJ42t8N42xlFugc4IhnuUO8V5GUDdu0rW5qel/YMWLBIHaByxAc1AIoj5mrd
 w77rAIfGUZ2JAx+0HFpmgYhef9eyzU8LM8g0fHtBTng9Msnz28rPq0QYpUoMll2+40OBn9oAvrU
 Q+lhmGBjT9RhSDKthzceyJVsbPIrC8gpRlXtDAScTWyYMJG/j3TtRHWc/tJ8SwKEne2+HS8Dy7j
 kDFp4TKO7/SIlQ2k94Od8SGycsPAOenlbJK+78vmNluRtMkHP0zs5OrNNUndt8JhQiGWYExHHR/
 p/rzIeMQk8LtcKBYS5yjZqbH91T0mfbF8GUWb3gUCuuz50zHTWy4bxbZw==
X-Received: by 2002:a05:6000:3109:b0:48d:f56d:be56 with SMTP id
 ffacd0b85a97d-48e385881cdmr3153326f8f.13.1792761619150; 
 Fri, 23 Oct 2026 06:20:19 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3804872csm5019611f8f.34.2026.10.23.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:18 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:14 +0200
Message-ID: <20261023132016.1606785-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015190219.243913-1-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libglib2: backport upstream
 security fix for CVE-2026-58016
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulnerability:
> 
> CVE-2026-58016: A flaw was found in GLib.  A state confusion issue exists in
> g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> processing malformed D-Bus introspection XML, specifically with a `node`
> element nested within other elements like `method`, `signal`, `property` or
> `arg`.  This issue can cause an unsigned integer overflow and lead to an
> out-of-bounds read, resulting in a denial of service.
> 
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5156
> 
> Backport the upstream patch (included in 2.89.0), but drop the test addition
> for easier backport:
> 
> https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...on-Fix-XML-parser-state-handling-for.patch | 42 +++++++++++++++++++
>  package/libglib2/libglib2.mk                  |  3 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> 
> diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> new file mode 100644
> index 0000000000..4582382f80
> --- /dev/null
> +++ b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> @@ -0,0 +1,42 @@
> +From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Thu, 16 Apr 2026 15:27:37 +0100
> +Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
> + element nesting
> +
> +The check for whether a `<node>` element in D-Bus introspection XML was
> +nested correctly was broken. `<node>` elements can only be at the top
> +level, or nested immediately within another `<node>` element.
> +
> +Fix the check and add some unit tests for it.
> +
> +Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
> +uses example XML strings adapted from their report.
> +
> +Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> +
> +Fixes: #3932
> +CVE: CVE-2026-58016
> +Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +[Peter: drop tests]
> +---
> + gio/gdbusintrospection.c        |  2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
> +index 1138ba9d7..4df8e87db 100644
> +--- a/gio/gdbusintrospection.c
> ++++ b/gio/gdbusintrospection.c
> +@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
> +   /* ---------------------------------------------------------------------------------------------------- */
> +   if (strcmp (element_name, "node") == 0)
> +     {
> +-      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
> ++      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
> +         {
> +           g_set_error_literal (error,
> +                                G_MARKUP_ERROR,
> +-- 
> +2.47.3
> +
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 45aa894b81..3770e8671a 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -17,6 +17,9 @@ LIBGLIB2_INSTALL_STAGING = YES
>  LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
>  LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>  
> +# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> +LIBGLIB2_IGNORE_CVES += CVE-2026-58016
> +
>  # glib/valgrind.h contains inline asm not compatible with thumb1
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  LIBGLIB2_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
