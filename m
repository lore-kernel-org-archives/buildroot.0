Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF383C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670BB4190C;
	Wed, 23 Mar 2022 20:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyYjJ9m81YE5; Wed, 23 Mar 2022 20:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79105418E6;
	Wed, 23 Mar 2022 20:24:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC4FD1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C98F560AC3
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjeBnirIC9Pj for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:24:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DFE460AAA
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:24:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id t1so3239266edc.3
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NMWNpamebRNdk3RyzA9HCdHc7UIhT21lsk8W69Zy4aM=;
 b=WO5vC8JW7+lwVQXQudn8S6D1nZaTz79kzy9oAxK0ZWZwp2FN90HMX7c3p9n8Le4ol/
 EMlPacDqLRJOzzRznjxz4r/rLAkgXZa6jPcYh/scJDhH5pnk2EC/hR7eDvGPbqArGxOI
 u4nTtIWj0HzpZ37vxegx40+AK0oE4EWrkDJTEdbvaxZrcdmybkOuubgmv8N1ub4s/3AD
 N3LQy67GF8ed93kYDRz9EXoCL3YNqgfnQeJiKFwSEj7LnO+Sq2l03Qio2uEC116i6VR0
 cqw01t9T3w4ROKnf/4GnFAAagiryrF9586I6l+XTPUouHVFZMG80KATZkWy2ImHlzCoA
 JEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NMWNpamebRNdk3RyzA9HCdHc7UIhT21lsk8W69Zy4aM=;
 b=FND1pH6VdsR2dRtsbqPsC/B2TA060a7Yht95LNLxjhU5yOBJ00Ua6sY+e2AiiVAlNC
 wu8PMosQKVFzaEf6jK/Ff5lIeNBzuI/DBKZcJcF0OetVk5tXkqdCvUPTAA4vxNcacHve
 DCk3AXoxIhusBEZ5MWoJz+g3tCKWnfAsDQFWPj8Wea5KHbCPOG7RvAtrALYLQmS7fcYT
 zZ/4nMowBwjA2miQ/L/S0kQ+hN6mOHiGQOp7xYZD/2f94FqMv1yNGvF3mv1UB7XGDGau
 0ijKdFLjBpE3a3jR3mtrWb/nQSEG6167EtEa2sm6ZMvQSBNOtZf1okLli18r+mchgotv
 JjTw==
X-Gm-Message-State: AOAM530I9r9EVu7r18gOfg7w5YHmMpbtV2W2Li2txoboBhAEJuGfybMU
 Huw3Ko32Kqni2VDf9QXXdRXv1A==
X-Google-Smtp-Source: ABdhPJww+AWdYuepIx7dtXyR2tUnwZfSrD49oLtore5DiDbRmTb7OmR1vwDxPIkFxfPH4Xo8ezffQw==
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr2418316edd.405.1648067056361; 
 Wed, 23 Mar 2022 13:24:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ga42-20020a1709070c2a00b006df76956b53sm311232ejc.212.2022.03.23.13.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:24:15 -0700 (PDT)
Message-ID: <84a7799a-3b41-3253-d5af-e664e68ee215@mind.be>
Date: Wed, 23 Mar 2022 21:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/ola: drop autoreconf"
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 11:37, Fabrice Fontaine wrote:
> This reverts commit 66d348ae18c6e73d6ff9d935a241e55a65948be6 because
> for an unknown reason, the build fails if autoreconf is dropped:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolauartdmx.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolaserverplugininterface.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f8164c69da0b9fa38081e8b785d8234f0f297ae1
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master. I also added a commit that adds a comment to 
AUTORECONF, as suggested by Thomas.

  Regards,
  Arnout

> ---
>   package/ola/ola.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/ola/ola.mk b/package/ola/ola.mk
> index 1874350784..5090076175 100644
> --- a/package/ola/ola.mk
> +++ b/package/ola/ola.mk
> @@ -9,6 +9,7 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
>   OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
>   OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
>   OLA_INSTALL_STAGING = YES
> +OLA_AUTORECONF = YES
>   
>   # util-linux provides uuid lib
>   OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
