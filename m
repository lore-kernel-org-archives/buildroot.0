Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05ECC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 09:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FED680EE8;
	Sun,  9 Jan 2022 09:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJs4gkJBzMGL; Sun,  9 Jan 2022 09:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7BC980E17;
	Sun,  9 Jan 2022 09:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56A331BF577
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4490C80C31
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJjFqPtimL5a for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 09:11:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72EC680BF2
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 09:11:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so7967079wmk.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 01:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1Jlh5vJup3wyUCwfRUumRnmyI2TGdKnXSgB9DdEeG4s=;
 b=h2UnETxQTQLXW1BSH1N0TzvDt36j2nCVbauzbO7KbS/kYw+CpC77jRSW+HENBMNuwD
 hSj3MtSTcv8Wz6xjc4TQe03BECom6aVdFIDda5BIcsWDWX5+3PsGxSPKvqGgvLShqz4h
 xU0GEpC5JKzdF82olJU17GZfd1jVcdOp+OpjhCGyvnI0HuprwSStBpW6xeIbxG4dAk8J
 RQkd0/zedNxGg8XYmkFj0sQk+OfsDJVrP3g8eFeo+vkjfgT1DYxEMybsQ2cIxVjAultW
 QeNkCn7DlbmDnVV+VDB7OC89V7Fm5j0bXpDfxZfcK6lM8OtqeViI2PaU85DDYKWnxosU
 uBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1Jlh5vJup3wyUCwfRUumRnmyI2TGdKnXSgB9DdEeG4s=;
 b=AeXakkxCifAl1VVbqF7w5jAAbDnd5qZrdqKKMKeN2TB0qL8JJpOt0D0ezaaJdkVxul
 9VnbN9LOfaK/zuaCJ2H+b8zwu8YQt+a7RGrDoQEB0YPpjthTfGQk49Zv/KqUFo5q2ZFS
 hwC/cFaK4VGp8HoR7AIWZQ0cT00GuaOKGImMZWCMCfZ8rO+Z23Cozsvo0pQvwB33qfan
 OePq42I/AYsXXFgf+XvrEK56bOkx59WdLt5BOhRItfv3DY6C4PJEl3iVwRBuTD8c9woO
 5PZxvEEEksrqUWYHv+6NIE9yxOqUpO7NKRm/zBSVrtpiDt5fKgNPajruUM3JmT8HMHgn
 NDNQ==
X-Gm-Message-State: AOAM531fDC12Ws9GOnKQt5wZNrT/BBTU40Gv0TL3HlzGVSYyeTF3GQ2F
 AftPQ0Qh/evJeEKmIUoxESk/vw==
X-Google-Smtp-Source: ABdhPJy8Z3KC1QLNdu70W+B2PBvhcoV9//V8yEh4AUVLA9BJB6YO4KfO7GkIzkJXK5u+BaA3/ScXGw==
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr17493267wmb.175.1641719484702; 
 Sun, 09 Jan 2022 01:11:24 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id n14sm3752066wrf.107.2022.01.09.01.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 01:11:24 -0800 (PST)
Message-ID: <c62f6a91-18cc-4ace-69fa-ba39890fbe03@mind.be>
Date: Sun, 9 Jan 2022 10:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20200605224858.12870-1-nolange79@gmail.com>
 <20200605224858.12870-2-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200605224858.12870-2-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] fs: clean the volatile /run and /tmp
 directories
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Norbert,

On 06/06/2020 00:48, Norbert Lange wrote:
> Scripts in the fakeroot environment could call
> tools preparing the early environment, leaving
> traces in /run or /tmp.
> 
> mkusers might create home directories in /run for
> example.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  I finally applied to master, thanks. I extended the commit message based on 
the discussion on the patch.

  Regards,
  Arnout

> ---
>   fs/common.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 842ea924a5..a5c6b4ea96 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -171,6 +171,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>   
>   	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
>   		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> +	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
>   	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
>   	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
>   	chmod a+x $$(FAKEROOT_SCRIPT)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
