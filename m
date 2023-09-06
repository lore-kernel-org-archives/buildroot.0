Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BD6EE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A77F8209A;
	Wed,  6 Sep 2023 20:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A77F8209A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TpvmrO8ybkA; Wed,  6 Sep 2023 20:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9612E8129B;
	Wed,  6 Sep 2023 20:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9612E8129B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFB141BF363
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8FDA812AE
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8FDA812AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWna6yJOMCF3 for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:19:01 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1047E8128D
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1047E8128D
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-41206fd9717so1709781cf.3
 for <buildroot@buildroot.org>; Wed, 06 Sep 2023 13:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694031540; x=1694636340;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HD3306kaZjkE80gGb4saIe5vHqQefghn9HI81eoCE3Y=;
 b=SZPfN8J633R5/cDeu6EHVI0Q0hRe1r0D2KLvHBz+XvQjMPn4C/1t8PKOlEQp/JAOZ9
 P3/o1Z8zT/E9ucD5z7a9pC3woZjNavEpZHFkndd9ehdp4pzgdC/Bc2p4QbPzkZL8mdnB
 QsGuN4oVSXe4L8g9MnpKIdKOPNEo4MgCSe1CoZ/OpcLWdLtBT6b3t1dEXmxdSgHwBd+X
 iHe+I/Q20RVVqF4SAq7QbccHH67Psz0+DYWOxkOftsqSR8PvBbP4VdjP4mDcx4RboY9Z
 vb6AVbPkXKdgpKn4n06qK17P0cSZ8qhKjBz362V8gz7LSc11MafMJKRExkyZkz4PeQhD
 WKvw==
X-Gm-Message-State: AOJu0YzJE2EdYAdmKIO4FKxMcGqiC2dA16nzwFVLXV60WoAETUmB3BDT
 pnPqNwt1ZZ67uagIEc1bB0Vu+eEh+Z3nDhQsSv8=
X-Google-Smtp-Source: AGHT+IFaQLjuJi1kucLNiVus+kcAiKRZKz7iWlM4gyqAYL1XXOLZUT9RTnUfh1lco9Ry2bLZc5hk2p3HxJiisUsFXM8=
X-Received: by 2002:a05:622a:1110:b0:403:8d8a:564e with SMTP id
 e16-20020a05622a111000b004038d8a564emr23969422qty.62.1694031539625; Wed, 06
 Sep 2023 13:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230904124334.94615-1-nolange79@gmail.com>
 <87a5tzi5gb.fsf@48ers.dk>
In-Reply-To: <87a5tzi5gb.fsf@48ers.dk>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 6 Sep 2023 22:18:48 +0200
Message-ID: <CADYdroPBDUOR43aocuuRC4xuBOgksfzvK7YeBcCtgUtg6k-wJg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694031540; x=1694636340; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HD3306kaZjkE80gGb4saIe5vHqQefghn9HI81eoCE3Y=;
 b=e4AnAzB8PwjpyDz5Gj+v6ogxuZkPQg0vbUHFkdQQMZjb+g5qc0LNii5pQPYiV+bCCE
 8N/6cLRz8JE80mW4VFzcX9UYQIoD6IR2yK7w3bSs+NKxFf7Efk0nUvGO1CYpC3CFFkC9
 6W/Hq0Zet1YqJljrrojZuC9UtfHYjJXvvGm1OUTfolvOU96j1+bi+LCONOWl2SX8tj/d
 WiMO5N4JhUcLrLJikkwTWMTKdoFvXnm3aCldL3cimsMOX+kjyIxVrH7HiTZFZy8UJDIc
 oW946paGbma1/JpGwmCeVy3UHWo2ZYMzfNy6cQBUb+norH7bh4kYdgVRMki/OhI96ER6
 wkrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=e4AnAzB8
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix detection of ncurses
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mi., 6. Sept. 2023 um 19:20 Uhr schrieb Peter Korsgaard
<peter@korsgaard.com>:
>
> >>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:
>
>  > the configure script seems to use the NCURSES6_CONFIG variable,
>  > however it will still check for a system ncurses6-config and prefer
>  > this script if available.
>
> Where do you see that? Looking at configure I see the normal
> ac_cv_prog_FOO / check FOO / fallback to program:
>
>
> if test ${ac_cv_prog_NCURSESW6_CONFIG+y}
> then :
>   printf %s "(cached) " >&6
> else $as_nop
>   if test -n "$NCURSESW6_CONFIG"; then
>   ac_cv_prog_NCURSESW6_CONFIG="$NCURSESW6_CONFIG" # Let the user override the test.
> else
> as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> for as_dir in $PATH
> do
>   IFS=$as_save_IFS
>   case $as_dir in #(((
>     '') as_dir=./ ;;
>     */) ;;
>     *) as_dir=$as_dir/ ;;
>   esac
>     for ac_exec_ext in '' $ac_executable_extensions; do
>   if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
>     ac_cv_prog_NCURSESW6_CONFIG="${ac_tool_prefix}ncursesw6-config"
>     printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
>     break 2
>   fi
> done
>
> What is the error you are seeing exactly?

I see in the config log, that buildroots ncursesw6-config is used,
and then following that /usr/bin/ncursesw6-config is detected.
Then the build fails as libtinfo.so is missing.

By setting ac_cv_prog_NCURSESW6_CONFIG (applying this patch),

I see in the config log, that buildroots ncursesw6-config is used.
Then the build succeeds.

If you asked me about where the error is buried in configure hell-script,
I demand the certainly following psychological harm compensated.

>
> --
> Bye, Peter Korsgaard

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
