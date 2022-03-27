Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9C1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BAC560EC6;
	Sun, 27 Mar 2022 15:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7A4AtcH0_rP; Sun, 27 Mar 2022 15:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF0660E27;
	Sun, 27 Mar 2022 15:41:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 508591BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9F160E27
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJqwfMr5eKhB for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:41:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 305C760B03
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:41:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z92so14321430ede.13
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9BetByumKAmWUZWUNbY9IOLiPFoCV6FHg6REJ1Rva7I=;
 b=EmPgmDwWxgxqtzNKq7sH8gZ2qCPnfMgU2UGvQJX6pqBLknZ5Fe3FuCNweV7wRWp7c7
 4vfkh1qk2jBGdToqwbtwH1kO070cTGZISCh7fGu0vQwkYL5d9ltBUoaO+E/KgiALkPqu
 hb6tOBy4VKsYucEbqg5zxnEE/0pb9WKOYDSm96rUOg8z48f2urNYQx8WjQLg8TC2vWAw
 QuCsXWwQPTe2q5rvIXx+Ffg235qvFdCRDIGj4YlB3meLUwTi/WxZ6HBi+xuwCZYd/s6u
 REMEwm8+1ZRCzej/fe3WhbjHkqbOinCVRG4hpPlp2AQ+S7eIDYyp9JjgcuAIlaTxwGdW
 znmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9BetByumKAmWUZWUNbY9IOLiPFoCV6FHg6REJ1Rva7I=;
 b=2og6l0WRWO4+nSrHLkyxI3SeKq8maYrveQcm1QKj4hAkEFBAfpU7o4ij8jVXV2uI1g
 5nxI8aTgJxE554li66q8LDQNORtOPXRvjB1AB3JFHW/t6kx88ivnXvRc96DH60bNoq3t
 GzX0D5QGfhIKWQy9AO5OpWHF1yzELIlj27ax6eDV5zyiK0TnOBWNGmWk2YvAtchsOV3y
 P5f9lqH3cyxtiTT/mByLdvgG+T9bh/fEZBbdSQZ+9tbQZ3Ij0pM7TU+43C4TU1GVRFri
 meNPwrJe5pa1l+lVKSjzJBORzfMIE/rkYZWUuNgVoC7kvZc8pszXOe8k1/riSRU/4Ntr
 w/nA==
X-Gm-Message-State: AOAM5328R2kmM1fzHDnULQ0H/+17Q0+hfz6xmcTo7x0B8CU7rGZqHbuz
 JydGtbBoQS55BvbC/pyaKiOD+g==
X-Google-Smtp-Source: ABdhPJzVp7pRL2wYWqS6uGyK1Pok5VOObMjSwHkFgB/Kl8QqBowrl4NiTYSsY2uIpxqJH2MmqB2oYA==
X-Received: by 2002:a05:6402:51c6:b0:419:8269:f33d with SMTP id
 r6-20020a05640251c600b004198269f33dmr10790285edd.264.1648395694367; 
 Sun, 27 Mar 2022 08:41:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a1709062b5500b006e10152162asm723057ejg.222.2022.03.27.08.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:41:33 -0700 (PDT)
Message-ID: <26ccbc4c-2654-4ce8-66b8-bfea5718890b@mind.be>
Date: Sun, 27 Mar 2022 17:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220318173507.10160-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318173507.10160-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libscrypt: fix CFLAGS
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
Cc: =?UTF-8?Q?Stefan_S=c3=b8rensen?= <stefan.sorensen@spectralink.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/03/2022 18:35, Fabrice Fontaine wrote:
> Don't pass TARGET_CONFIGURE_OPTS in LIBSCRYPT_MAKE_OPTS to avoid
> overriding CFLAGS (and so loossing -fPIC). This will fix the following
> build failure raised since bump to version 1.22 in commit
> 4542c6714d3951070c31739d24e4bd42b446fbae:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.36.1 assertion fail elf32-microblaze.c:1534
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: sha256.o: probably compiled without -fPIC?
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ba4234ad305badb5ce815080ddcad6727e8d51c4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/libscrypt/libscrypt.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
> index d28bd4e900..193c963f76 100644
> --- a/package/libscrypt/libscrypt.mk
> +++ b/package/libscrypt/libscrypt.mk
> @@ -11,7 +11,7 @@ LIBSCRYPT_LICENSE_FILES = LICENSE
>   LIBSCRYPT_INSTALL_STAGING = YES
>   
>   LIBSCRYPT_MAKE_OPTS = \
> -	$(TARGET_CONFIGURE_OPTS) \
> +	CC=$(TARGET_CC) \

  We'd normally instead pass TARGET_CONFIGURE_OPTS in the environment, but even 
that doesn't work since the Makefile use ?=. So applied to master as-is, thanks.

  Regards,
  Arnout

>   	CFLAGS_EXTRA="$(TARGET_CFLAGS)" \
>   	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
>   	PREFIX=/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
