Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4309C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670D94162E;
	Thu,  6 Jan 2022 10:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lp5MJdYXVGFD; Thu,  6 Jan 2022 10:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC05E4162D;
	Thu,  6 Jan 2022 10:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26CDF1BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1177B4162D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qRYkhu269hE for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:35:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA2641620
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:35:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id e5so1445500wmq.1
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v32fQny049+Yb8Fb499ePBX38lnHXrj2rMjH18ADaOw=;
 b=K6wjDOaKfpgypTu6kluWZYJQGN/7TMPGChJm/UGx3m/aIBACeaxv6HVZRp8YeS4xup
 zd9MMrIYGGw2+r9halHn+6P23TKBVMLsdpR98BQwBIIbwpTTSYjjn9RyyAOQJ6wuR1PQ
 vr43SYppaiyqGpqZx6x57KbMdUxG0ND+XsZUdL8FxIi6HKy8HmDVjEpicf9n3NTnneGz
 t756PQQcHM96fW9PsfyDEEvBW/nbj3TKAFHM4+v+P7QU5omllUKjZsMZ+OAr6Mdpp0IQ
 YgKJxV+gbESiO5YdHxhlNzIm/TSYbvANdAMdeJk9/eLtS4YR2F560R2ynrZwE18LpLnd
 ORuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v32fQny049+Yb8Fb499ePBX38lnHXrj2rMjH18ADaOw=;
 b=rMFiUOCwmvDPGHBJ95p7fkXNIByQTwKHOgpTwvaIfZ9xpS73fwpdSbm2l+mSKhqduc
 0PeRWjIb8WBuEpzHeUkCLRf+LhY+Mbn/q5nS3BqKaWGRLF+TSaNjT8veLD7EZij6VzjL
 6iQtnKrKTr3+jnJk61fqbq1t/w9XKnDLzdsIl3wcUcxLr1D3J1MsN5Z4TvHrqyCKvqRB
 YW6xVZPRVsqs4E0UNYhpHy7S6AmzYf3J+3WhCjIj0e8DUU9IzONOzHRm4P0su6RLCL43
 yqTkIAMAmNx0d0SEkGzKAFPw2Gr2chNNMqfxe3w4/xQFw/a08Nd/12lJRKgyCDnekOFy
 mSpw==
X-Gm-Message-State: AOAM530TLKmTlhs0YahvcNjquTxcezGIq9FC1secJpRP5t9yKVItzYgr
 oDAcsRwOChaFTyBsEtVJrHGYtQ==
X-Google-Smtp-Source: ABdhPJztrKOlt1AxMAEov0FK1rzy+p6vEZza00AFEyTDPGZZOuD0+swq5IU4qFG1i5pCkjFQhdWrpA==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr6048420wmi.35.1641465322860; 
 Thu, 06 Jan 2022 02:35:22 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id e5sm1880141wrq.116.2022.01.06.02.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 02:35:22 -0800 (PST)
Message-ID: <d28ff21d-c2bf-f489-2d09-9f01936f1337@mind.be>
Date: Thu, 6 Jan 2022 11:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20200121203337.30856-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200121203337.30856-1-vfazio@xes-inc.com>
Subject: Re: [Buildroot] [PATCH 1/1] download/git: support Git LFS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Keeping <john@metanate.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi John, Vincent,

  I finally applied this to master, with a few minor changes.

On 21/01/2020 21:33, Vincent Fazio wrote:
> From: John Keeping <john@metanate.com>
> 
> Git Large File Storage replaces large files with text pointers in the
> Git repository while storing the contents on a remote server.  If a
> repository is using this extension, then git-lfs must be used to
> checkout the large files before the source archive is generated.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> [vfazio:
>    - add git-lfs to DL_TOOLS_DEPENDENCIES
>    - fixup for 5a0d6813948fea2cdb88a2e35984520eec856dec
>      ("infra/pkg-download: make the DOWNLOAD macro fully parameterised")
> ]
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

[snip]

> +# If there are large files then fetch them.
> +if [ ${large_file} -eq 1 ]; then
> +    _git lfs install

  AFAICS an lfs install is not needed. IMHO it's pretty bad to do that because 
it updates ~/.gitconfig, which Buildroot shouldn't do. We could do lfs install 
--local, but even that is not needed. The lfs install just makes sure that lfs 
is done automatically whenever you do commit or pull or something like that, but 
in Buildroot we always do it explicitly so the smudge filter isn't needed.

> +    _git lfs fetch
> +    _git lfs checkout

  As already mentioned by Yann, this doesn't work when combined with submodules. 
The solution is pretty trivial:

     # If there are also submodules, recurse into them,
     if [ ${recurse} -eq 1 ]; then
         _git submodule foreach --recursive ${GIT} lfs fetch
         _git submodule foreach --recursive ${GIT} lfs checkout
     fi

  I haven't actually tested this though.

  Vincent (or anybody), it would be nice to have a runtime test for this 
feature. 
support/testing/tests/download/br2-external/git-refs/package/git-submodule-{enabled,disabled} 
can be a good source of inspiration. Only I'm not sure if it's possible to set 
up an LFS repository that is purely file-based.

  Regards,
  Arnout


> +fi
> +
>   # Generate the archive, sort with the C locale so that it is reproducible.
>   # We do not want the .git dir; we keep other .git files, in case they are the
>   # only files in their directory.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
