Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8582AC47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 09:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C0A83D1B;
	Fri, 26 Jan 2024 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C0A83D1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRxjLJWtJ5fy; Fri, 26 Jan 2024 09:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78BD383D14;
	Fri, 26 Jan 2024 09:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78BD383D14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D76E61BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B05C5408ED
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B05C5408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-gS1nSRZ4YU for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 09:17:02 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5F66408E5
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F66408E5
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2906855ac5fso55103a91.3
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 01:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706260622; x=1706865422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MOQ1P8k+R/57BVjMriwA2NIfgdnWylXMUjnvSOXoJ0w=;
 b=NMTAXem/dtd86XmjCpUkG0Eb4X8bpIU/12I3Z4GhFBKgIQpEYaNEAdJCftzr9gTqOe
 9+EXEKCOgwX2ysJBM6OMN1QDaImYJPHe69hj85QaXiAFNJog9+Lx8E6BCDIkfilVJv5k
 FopHjGfIFHpz0wHzYP+mRuCm6XLEUusZeMWkZVsLGqVwqa4gPRY2uuJcngrKevkh0PF+
 /a08KFCHn7oOsoV1iCRnb90mlx6QnCtn6qxbH9jiQYIEcTENljBt4O9T5AIcYvrORNsL
 guUuejO0YpKslRiSxij9sjcW5R6DllE3OZFqEA578IYJ84I6fg6XwG/TYApPSROVZ3OO
 A6Hw==
X-Gm-Message-State: AOJu0Yynzh3WdAOVI+k06m46rn3MyJG30MYf/140WvxziIFmsY/Hgg8y
 4YSsh+W1JqZRczLt3Bsg3yJkfe0j/nF+IsB4zVupLK6//eFHYk0yOkwuT4H8DmMi9B+1FGrCT9o
 Wgq/qB6WIVyF1N/JacK0lqFXTbYN4/HYEE7o=
X-Google-Smtp-Source: AGHT+IFOb56o9RJWqL9ptHxuncGMxMD0vVjd8vCaj0CEMIK29PtuswhLdivVlwW9I1pa5m7UwTI1Kv3bxtBis01FAtY=
X-Received: by 2002:a17:90b:1295:b0:290:33e7:9291 with SMTP id
 fw21-20020a17090b129500b0029033e79291mr584099pjb.37.1706260621853; Fri, 26
 Jan 2024 01:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20240111105621.2321957-1-peter@korsgaard.com>
In-Reply-To: <20240111105621.2321957-1-peter@korsgaard.com>
From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Fri, 26 Jan 2024 11:16:50 +0200
Message-ID: <CAKpO6uGU7VsJ=Brc7B1m_5b1cQ9=W=cK8-sOJMU+3s=KyEbNgw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706260622; x=1706865422; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MOQ1P8k+R/57BVjMriwA2NIfgdnWylXMUjnvSOXoJ0w=;
 b=XEVLm9Ia2WzlQ/Seq/qwQGyb6LEErHhEzAIgkQ7pImDFkS6IO4ciaZn3GqztoG7aLg
 1byXxnhUZj/1TLrGCJRnKOYd1jXgWKqdrJv6lckgm/2ZwY5GLcB3EnQXv8gTgXDPVF0y
 cLGfWefWYbG1EY5s3jjXLwe0wMj+na+JwjNBdb6YkpPos6Ix4vleyzXRIGSpioAXQo/v
 J4KBJ9d3AcCh0iI3xUFnPOb/IG9o3FUUDsw9ITI68ex14xJDn6HEU6rPdlNYTHMoxJmH
 Zye6tsapMYZ2u/o4lVGCCcdAbX6sZl0MhPZPUafKlJsgEONlpnz/TbEV1P8q7Y8V6hzY
 bhCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XEVLm9Ia
Subject: Re: [Buildroot] [PATCH 1/2] package/Makefile.in: set GIT_DIR=. in
 {HOST, TARGET}_MAKE_ENV
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

Hi all,

> In the context of Buildroot the packages are never built in their own git
> checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
> directory tree and finds the Buildroot git repo, which fixes the rauc (and
> similar) issues.

>
> -TARGET_MAKE_ENV = PATH=$(BR_PATH)
> +TARGET_MAKE_ENV = \
> +       GIT_DIR=. \
> +       PATH=$(BR_PATH)
>
>  TARGET_CONFIGURE_OPTS = \
>         $(TARGET_MAKE_ENV) \
> @@ -307,6 +309,7 @@ TARGET_CONFIGURE_OPTS = \

This will also break the usage of package/environment-setup. The
GIT_DIR=. leaks in
the environment script `environment-setup` useful when a developer
wants to use a Buildroot
generated SDK to build an external project.
So, on a developer machine after sourcing the environment script, all
git commands fail:

$ git status
fatal: not a git repository: '.'

Best regards
Mircea
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
