Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6F8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4FA8175B;
	Sat, 12 Mar 2022 16:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TzTxQvipryW; Sat, 12 Mar 2022 16:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A698C8149E;
	Sat, 12 Mar 2022 16:03:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 211ED1BF41A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 107948148D
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CN38I73tn3rS for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:03:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B82C781470
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:03:50 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p15so25187284ejc.7
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HLqaOK/MZv0gE/1AGC1QSyGTeAgnliEqQRB+osMeoaQ=;
 b=ZOGew7FnLsLt0iW5Lh61pw/E3t1c5FLpb1gKxtlB0HAElm+0XH48xWObCTDGr6Wxjn
 JD8zfC6itwAh/PpFoDcPYoG74OF8yhw0Q9Jf0Wj+YW3bzkIYCmME34ODk68Oe3MgDNK3
 J8RoJu/FH/rZGp2nh4XT2uNzKqxVd3EQbXt7tX5alZexskCB+adxH+Jd/D085e6YyIAS
 dIlWMnPH4F6KMToCjkhCA8nYEey3HGn253hgbm7TxaCkwCa21BAEZtjfcm+b0+V3HS47
 tGhqlTNgZ3Zyp4tq2Cilol4NdXABByRCsJuMDx/woW5kFfFLPU2U4szs0mZQiI3Dbxpg
 2hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HLqaOK/MZv0gE/1AGC1QSyGTeAgnliEqQRB+osMeoaQ=;
 b=cREFm1S3U9q3jytfzJ5eH9RjFTb9EUf8Xlq5qkNO/qRjSN+iGr1FlicZGb/vhNAFQ2
 Q89/gIN0IeI2MmtwOv7G46uaUNIufJSWZte0Spc+rLmXYg2AhF3CQi5zkeuIFf7yU3Zb
 dKUkw6kY2D/3vPddoNYYsHoweLHAIiEyz2u4JJAjsSaZkS3jHUvMSByGKud7BPD3QTgo
 CS4hIt4kUz3dQaGNYYPQ7b8r++LzQ0a87uJoPgVjErtIdiPbvbBYrS5kgCpQCPonMg8l
 SIyqROMFxdOc1ppwUBhdVVwekdz+qYQ3yICkywEca4Wr3T3PAugBMGtW5sx0vikuyrUF
 52HQ==
X-Gm-Message-State: AOAM533dRzZ5bdyXwlM7BRvpDDlM5W45HUYFr+QXrWtQ67d+hmSYrhS5
 Aa4kBkNGqTS8Lg00ZEca/n+/aDKZ0uv/QA==
X-Google-Smtp-Source: ABdhPJzcYorCjyHzIZDj/SXXJCzcc+qagR1T44/tKwt83MVwsmuonqrvjvPPKkde8J+81x2l3oa5VA==
X-Received: by 2002:a17:906:dc10:b0:6da:f383:86ed with SMTP id
 yy16-20020a170906dc1000b006daf38386edmr12579824ejb.391.1647101028854; 
 Sat, 12 Mar 2022 08:03:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z92-20020a509e65000000b00416466dc220sm4952148ede.87.2022.03.12.08.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:03:48 -0800 (PST)
Message-ID: <a1117827-b5d2-d2c8-0a1b-e55cd3e83c7e@mind.be>
Date: Sat, 12 Mar 2022 17:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Ben Dooks <ben@fluff.org>, buildroot@buildroot.org
References: <20220311171325.jwcww5qb7ao5vnpy@hetzy.fluff.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220311171325.jwcww5qb7ao5vnpy@hetzy.fluff.org>
Subject: Re: [Buildroot] error during cpio build failing to rm
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/03/2022 18:13, Ben Dooks wrote:
> I'm getting the following error with upstream buildroot:
> 
> rm: refusing to remove '.' or '..' directory: skipping '/home/ben/project/buildrot/output/build/buildroot-fs/cpio/target/run/..'
> rm: refusing to remove '.' or '..' directory: skipping '/home/ben/project/buildrot/output/build/buildroot-fs/cpio/target/tmp/..'
> make: *** [fs/cpio/cpio.mk:74: /home/ben/project/buildroot/output/images/rootfs.c
> 
> I've temprarily fixed this with:
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 45beb5ae7b..6bb993663f 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
> 
>          $$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
> 
> 	                $$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> 			-       echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
> 			+       echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/tmp/*" >> $$(FAKEROOT_SCRIPT)
> 			        $$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
> 				        $$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
> 					        $$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> 
> It looks like this was introduced in 5e78e7e97d772124f0d31653aca33731abe5b4db
> 
> Author: Norbert Lange <nolange79@gmail.com>
> Date:   Sat Jun 6 00:48:57 2020 +0200
> 
>      fs: clean the volatile /run and /tmp directories
>      
> 
> Any ideas on how to fix properly?

  There's already a patch submitted [1].

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220310120256.GA11974@parad0x.org/


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
