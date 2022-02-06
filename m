Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0986AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A428A60B64;
	Sun,  6 Feb 2022 14:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2_Alh5HGlXx; Sun,  6 Feb 2022 14:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E911F60ADC;
	Sun,  6 Feb 2022 14:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD751BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 281DD60ADC
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AH4Y2qpiRVok for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:34:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78820605A3
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:34:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m14so20409726wrg.12
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=hWe5JkWakkxax4oolmNNIri/uEuNVhMfIU8U/bw5xO0=;
 b=IiNgonNegPFFpQIJGCVHr1Qvsz+TwT1DeUStCnKb6U5E4dgnM1PoPImBRFuxwc1B/3
 8SCYmWgqqti0cpJS3xsdi+HShCNyiPhUG0bEah3Q3nweXpgqo8SStIsUXVotLQQbbJen
 hNtdM2VG5u4Y/MnYR21D0lWlD+Z1iwF/+0BrA+glFTnDQVcWD0+/kDT5/wVReeixlmz1
 QNzFjPNB4Fsvi+itmTiiDMCPXWRyAfFL9t+LD/R7MMf95f4a6AFtA9fySDcKfzDjWOOU
 N8CDLMDn5yzzJy5VK9X8T4pLOTi4IAAH1HCh5vpzLpAMDMGrDoyvM5R0dRMdk/PlB4iT
 TVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=hWe5JkWakkxax4oolmNNIri/uEuNVhMfIU8U/bw5xO0=;
 b=Y5huUMe5rcbZIn8Bn8Cuanb/CpM9I48GuMUG63jPaFrHwSnKdv2YUxoiY7SoHl9jk1
 cbVc3v2ZDTiZlvyza6UeDPUwvfJKQP9v9dR5ir70Dm4/ZyPJL0QuhN4No4XbMMs+5nWO
 1cTaTYDI9FNSY5+mwGkHmDXv2SV8ansnubhmtsjN6y3KRf0gq/XX3ZQ7ZG9WQHgQYeZP
 zQlMjhzwMlTFUMDx9okt3cCtmc1JBdIfQghrFMoB6ifOwaEOEmlSBuLoeY6nVpD5hXTw
 TR3nlIdwXcMY2Dkm3D3z2exwZuREwhD9CkG0J+6qTWCKbANTijOOnSyYTh9Ex6mkuCbK
 eZzQ==
X-Gm-Message-State: AOAM530IE8M6k8Nkp4y5sPlZe8GKq0aO9zWRxoRFhYAiKRemfHq7Qq8k
 sOGmxsqwOhHnd9e1rfJNE3s=
X-Google-Smtp-Source: ABdhPJyaUvtrFTEFr4ahaWSeBfMuyEmciEO2olPEIJf1Bb7iwBwN50yK1SsDpjIbMXqRvZpPdpQYbw==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr6670348wri.228.1644158089591; 
 Sun, 06 Feb 2022 06:34:49 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id m30sm1570156wms.34.2022.02.06.06.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:34:49 -0800 (PST)
Date: Sun, 6 Feb 2022 15:34:46 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Yf/chpjM6KaLCJ6h@pevik>
References: <20220206131758.28001-1-peter@korsgaard.com>
 <87tudcw0zg.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tudcw0zg.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: nfsiostat used python3,
 not python2
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

> s/used/uses/ in the subject naturally.

+1

>  > nfsiostat is a python3 script, so keep it if python3 is enabled and not
>  > python2:

Good catch, thanks!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

>  > head -n 1 target/usr/sbin/nfsiostat
>  >  #!/usr/bin/python3

>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  > ---
>  >  package/nfs-utils/nfs-utils.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)

>  > diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
>  > index 6a3a801359..44653e2707 100644
>  > --- a/package/nfs-utils/nfs-utils.mk
>  > +++ b/package/nfs-utils/nfs-utils.mk
>  > @@ -114,7 +114,7 @@ define NFS_UTILS_REMOVE_NFSIOSTAT
>  >  endef

>  >  # nfsiostat is interpreted python, so remove it unless it's in the target
>  > -NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
>  > +NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON3),,NFS_UTILS_REMOVE_NFSIOSTAT)

>  >  define HOST_NFS_UTILS_BUILD_CMDS
>  >  	$(MAKE) -C $(@D)/tools/rpcgen
>  > -- 
>  > 2.20.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
