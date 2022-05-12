Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D90C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 22:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1EB40348;
	Thu, 12 May 2022 22:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuBKPD_y3yPr; Thu, 12 May 2022 22:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030694016E;
	Thu, 12 May 2022 22:32:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15C851BF31C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12B43401E3
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 22:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3Jta7ls5l7j for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 22:31:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F82F40105
 for <buildroot@buildroot.org>; Thu, 12 May 2022 22:31:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g6so12950626ejw.1
 for <buildroot@buildroot.org>; Thu, 12 May 2022 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hCak88XWkJvrH3cpRKCoy7VImDp2HEj7ndz1HmJhoOI=;
 b=eHxN34xK+oboXdo/URVuVu/00xQIT+zV8+SLmoEeh/tFy5Df2VBR3fswLCnnXGGXbg
 nOGFN1XtUtwylwVD5g9gyNB1qA4BQ6OVuoRoRr8fUhWvddM2NYESYfz3aL9KGv9tcEyA
 fLXp8sYM/HBb/QCKL8KyEzy3AQCvJRcDjL0opwmUbd2oaA38tToRN8syBEYoOC9nkhak
 FwrQmoPZCAHOzmr3/M8csnXAIDPn8dOsqFb9OjawjWV/V8KVra5oMODNbn6DH3BPyzcg
 HCrj3c7v3oHHn/rTK8xrp08Mry7UGgCS2dau0LMajXrLBpP+7+XnFVTZCBsOfaMtQSi6
 +8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hCak88XWkJvrH3cpRKCoy7VImDp2HEj7ndz1HmJhoOI=;
 b=cTVil74o5bPHRMBQmfQru3bh6E5iPifRbdu1sddhcoNNc9kk9IBJHIjKWBockAKVqp
 ZwLT1lqOZCosqfToSPoO3WotKVeIeh2/cJ4f5W2ywx3IlVnFH00SYcnhGYjjcFU9bgd6
 ouj2Diiot/PV7OtCj7bJ+W3WJCIaG3fHKq8jo/NQJox+Oha1CoYVnJ0d0K7zx2RCmI/X
 xgicXm3g7/VvfKu22S1JQvCEnns+XYX2OX/0wOqZNbGoUgHGeuajOoUsPCdJaSaeVKtR
 37iqdShcjNc102B/ZrZczq0SVHgWUOVgpqo+MtXJ6fJ4eekKfQQl8XYng6vT8NO3JxCL
 1HHA==
X-Gm-Message-State: AOAM532ippwNXMrF05w+jSYvogYLSK+pbGe3tnZps3hAveHZ9En6Po1E
 sPR0C2VU8dxPcWLx8P5gdd/ENw==
X-Google-Smtp-Source: ABdhPJxo34iUmZd/dBaWgWVhAfgNblkIR0HUfiQDL+JKRIHVoOmMSQtNgnfy/5tsDlr3papOehokWw==
X-Received: by 2002:a17:907:2cc5:b0:6f9:1fc:ebef with SMTP id
 hg5-20020a1709072cc500b006f901fcebefmr1740286ejc.121.1652394716325; 
 Thu, 12 May 2022 15:31:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 og32-20020a1709071de000b006f3ef214db9sm182101ejc.31.2022.05.12.15.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 15:31:55 -0700 (PDT)
Message-ID: <d7ce3402-a37a-ca9b-52c5-1f85eeb79a7d@mind.be>
Date: Fri, 13 May 2022 00:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, yann.morin@orange.com
References: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
 <878rr6ahop.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <878rr6ahop.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 17:34, Peter Korsgaard wrote:
>>>>>>    <yann.morin@orange.com> writes:
> 
>   > From: "Yann E. MORIN" <yann.morin@orange.com>
>   > The prompt and variable name for the OCI "entrypoint arguments" are
>   > somewhat incorrect. Indeed, they are in fact use to set the image
>   > "command". Yet, using "command" would be confusing too, because the
>   > interplay between entrypoint and command is tricky [0].
> 
>   > TL-DR; when both entrrypoint and command are set, command acts as
> 
> s/entrrypoint/entrypoint/
> 
>> arguments passed to the entrypoint.
> 
>   > Additionally, we currently can only pass a single item as either
>   > entrypoint or command. This precludes passing actual arguments to the
>   > entrypoint, or passing multiple arguments as command.
> 
>   > For example:
>   >     BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="/bin/tini -g -p SIGTERM --"
>   >     BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="/usr/bin/env sh"
> 
>   > generates an images with (only relevant fileds are included below):
> 
> s/fileds/fields/
> 
>   >     {
>   >         "config": {
>   >             "Entrypoint": [ "/bin/tini -g -p SIGTERM --" ],
>   >             "Cmd": [ "/usr/bin/env sh" ]
>   >         }
>   >     }
> 
>   > This is obviously incorrect, and not what one would expect:
> 
>   >     {
>   >         "config": {
>   >             "Entrypoint": [ "/bin/tini", "-g", "-p", "SIGTERM --" ],
>   >             "Cmd": [ "/usr/bin/env", "sh" ]
>   >         }
>   >     }
> 
>   > Fix that by passing as-many --entrypoint or --cmd as there are
>   > space-separated items in the corresponding lists.
> 
>   > [0] https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
> 
>   > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
>   > Cc: Sergio Prado <sergio.prado@e-labworks.com>
>   > Cc: Matthew Weber <matthew.weber@collins.com>
>   > ---
>   >  fs/oci/oci.mk | 4 ++--
>   >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
>   > diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
>   > index aa81920d36..f98db0a8c8 100644
>   > --- a/fs/oci/oci.mk
>   > +++ b/fs/oci/oci.mk
>   > @@ -15,13 +15,13 @@ OCI_SLOCI_IMAGE_OPTS += $(and $(GO_GOARM),--arch-variant v$(GO_GOARM))
>   >  # entrypoint
>   >  OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
>   >  ifneq ($(OCI_ENTRYPOINT),)
>   > -OCI_SLOCI_IMAGE_OPTS += --entrypoint "$(OCI_ENTRYPOINT)"
>   > +OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--entrypoint %,$(OCI_ENTRYPOINT))
>   >  endif
>   
>   >  # entrypoint arguments
>   >  OCI_ENTRYPOINT_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS))
>   >  ifneq ($(OCI_ENTRYPOINT_ARGS),)
>   > -OCI_SLOCI_IMAGE_OPTS += --cmd "$(OCI_ENTRYPOINT_ARGS)"
>   > +OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--cmd %,$(OCI_ENTRYPOINT_ARGS))
> 
> It indeed makes sense to split the entrypoint on white space, but for
> the args (cmd) it exchanges one set of breakage for another -
> E.G. sometimes people want to run sh -c "my shell logic goes here".
> 
> I'm not sure what to do about that though. As you are not quoting the
> arguments you cannot even set it to stuff without white space but ith
> shell characters, E.G. ENTRYPOINT="sh -c" ARGS="date;date" as the ; gets
> enterpreted in the call to sloci-image.

  Do you mean

BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="sh -c"
BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="'date; date'"

? Yeah, we'd need a full quoting/splitting parse to support that. In this 
particular case

BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="date\;date"

would work, but it's kludgy.

  I do think it would help to put quotes around the options:

OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--cmd '%',$(OCI_ENTRYPOINT_ARGS))

  That way, the usual cases (which Yann put in the commit message) are covered, 
but weird stuff is still possible as long as you pay attention to spaces.

  If you really need spaces, you can still use $(space). So, after adding single 
quotes, the following should work:

BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="date;$(space)date"


> In general I'm not sure how much value the oci support brings over just
> doing:
> 
> docker import -c '<Dockerfile command>' output/images/rootfs.tar <name>:<tag>

  That requires a docker daemon installed on the host, while sloci-image can be 
run as normal user without any host support required.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
