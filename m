Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE4C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 04:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD94410D4;
	Mon,  5 Dec 2022 04:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD94410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfxY4ZNvTAzV; Mon,  5 Dec 2022 04:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD81410D1;
	Mon,  5 Dec 2022 04:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD81410D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 350321BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 04:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DCD74046D
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 04:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DCD74046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hKxTMFgym6x for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 04:14:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4DB40256
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E4DB40256
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 04:14:16 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id f3so9432597pgc.2
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 20:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vk44fW5KOqbGuvBtXnAj6gfBn640cwoxvg35dW7Ex1U=;
 b=zqIDiqWBWXytFyD3sU4F8EluEoDBRQLLnPN3L6Yx8COlRWWlc/xj46pLiwSPMd5y7E
 4EfrfMlDq2U1RPJjVW0/H94+YnTvZ08hJjG/MSYlVqspB2adqJR4c7TGSZUNj44tJzMe
 d2QzsRbx3i7irn6cSjHrxT+FcaAPIgKgpasMFtu0MGluIGKRygqfVnyixgmalgJlQjto
 UJcISveoq4NQobsFZ30CferPwm+rQ/8TRJjlWN0Nneioo1JlUt8rrvrQ+8nM6WT+Lrsy
 lXf98cRc24CPLEnEHQc46YODVNbHlzei/62lNA7Dd2gKuOXfoUpM+0kxtBngKHsJ67GV
 H9LQ==
X-Gm-Message-State: ANoB5pn9dIUntirgVptZMiiePv83ZiJPojAQ7o7BE1MIF8Q1GDHSUait
 qAaikYuW5POV1sc6mhPTkpnh5ANZMm8=
X-Google-Smtp-Source: AA0mqf5a3FMOghfzU6iCkySQV1IAm8w9myJV5VBoMzvsRIMA0VBAyMzPeyj1sKPLETyBYWBJXYzFsA==
X-Received: by 2002:a63:1062:0:b0:470:a47:996a with SMTP id
 34-20020a631062000000b004700a47996amr55363262pgq.377.1670213655639; 
 Sun, 04 Dec 2022 20:14:15 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-22.three.co.id.
 [180.214.232.22]) by smtp.gmail.com with ESMTPSA id
 u13-20020a17090341cd00b00186f81bb3f0sm9500692ple.122.2022.12.04.20.14.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 20:14:15 -0800 (PST)
Message-ID: <914d20f0-6668-50ae-fc9c-22103ff65e57@gmail.com>
Date: Mon, 5 Dec 2022 11:14:13 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: buildroot@buildroot.org
References: <e7c091e6-afdf-4f1b-0d38-dfabc267bde0@loongson.cn>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <e7c091e6-afdf-4f1b-0d38-dfabc267bde0@loongson.cn>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vk44fW5KOqbGuvBtXnAj6gfBn640cwoxvg35dW7Ex1U=;
 b=QtZa4oy4ZaOhbNumHjYS1kpa3yD1qqwZIvR+y/TgGIBOdnzv4vzO2VMgoALLZSZP2I
 fjm11+GerF0lpSnkl8q42dyNAS6gxrnM1R1ssdKTw5X40HZ0cSdQM0vkM+99NtEmA9Ld
 Slov1AelTxeVJMwytjl0qSkxdwDrCYlL+wZhZ2MMMuS6LUWGZnfwVGzRERbfzjHAmLkI
 J1mGCLfTwKUn8/ktGJHAwlyCqloHTwOpepbJ33j/7IlMNbTHJlLTkHiSvqkinjIA2qg/
 ZWPuNKdeeYB9KpN3tInxGrsKrOp8WX4x0JyUBV6d4tFzjP6L1ibWgjxDbUgQJPg4LGbt
 Aa6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QtZa4oy4
Subject: Re: [Buildroot] [PATCH] buildroot: Add support for LoongArch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/5/22 10:12, duan wrote:
> From: Zhiwei Duan <duanzhiwei@loongson.cn>
> 
> With this patch, buildroot works well on LoongArch.
> 

What about "Add basic support for LoongArch architecture (toolchain
only)."?

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
