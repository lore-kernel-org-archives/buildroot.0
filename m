Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1545C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6672C400A4;
	Wed, 12 Jan 2022 19:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWQzHWBAOViD; Wed, 12 Jan 2022 19:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64C704011D;
	Wed, 12 Jan 2022 19:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 512A71BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D6DA60ACA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxMWWPIRBvOg for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:40:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CDFB60AA7
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:40:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u21so14177690edd.5
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mApFpKqxMDIOvspJJWRXG+0Fs21Sm/EzDJ0E/GzTYBw=;
 b=NVRYCKEYlapzntrpMm1Usfw2ICTxvfNFhOdjIljjGG5vmJAYsnZAHOinWo1GYkU/39
 yPIwjJ5XguOH0HywhmCoJogETg4PmJdgtf7EI+UvIncfWkcnvp/NQjJ4NmyufFr26JfJ
 h5tA010mAsHgfsutPmyqg7yFtdbvBvQuQuOw7xxF0ZLknKXOZk/W9I3qRsk8o5Mr+Dcl
 2ENMAs9mW0ka64yMbETY4kLFhE8ACizO0rXPNsLs76TgV4kv/I7k5dWpuOdk4qgTPLHM
 cRVv2Qzlvw9EdqGx5QXKNWRNGnTvHYSogHDbX3Nt4P2a9p4Vp97/ar5dcxYAD/B9UBHo
 28hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mApFpKqxMDIOvspJJWRXG+0Fs21Sm/EzDJ0E/GzTYBw=;
 b=ahlinkb4fYpBDDjpP+GLwKAA02DfZiOqe9NjLlmi7zUG0ZPdhxZt1+7zC1tN/Kql3r
 9EirKYFd7txaWhKZG1In8ymvEdMoKvWjS9RQYIMl45ecYLXG+mxQ7GHTaJhBO3xRcgYH
 5eVpVy0+DaVHbotugRt0Fp+P92R1A1ROzzVXpogqo6Z8bzMpr4m7yp6sYCtaNNSBVIZD
 gDCg566bVCQkUZ9FLJ0PECuvoiFGURnQjAZ4PVefdcr/e9VbST5VCNXQbVdVIcyT33AO
 FjRWGidq5rq44gpesvoyiGZHRhqzk4Jia7gR4gEc6EQjsALiIqf/hW+pVE6jFw0QyLV5
 fehg==
X-Gm-Message-State: AOAM530sijTTSryjowCgYHsNA5yWAnWVrTEMPpYCpLf/LwvPdQ+Wwijl
 Pz1y5PxydA1BJGJPsAZpwdbmPg==
X-Google-Smtp-Source: ABdhPJzvGCP/WfldREb49ud0B9iyjScR8hpquuuagzaNt6gNs1UyDQqLy1G96DhVudt/gqpKAAqtDg==
X-Received: by 2002:a05:6402:27cb:: with SMTP id
 c11mr1110028ede.86.1642016399284; 
 Wed, 12 Jan 2022 11:39:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k8sm199608ejc.115.2022.01.12.11.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:39:58 -0800 (PST)
Message-ID: <9e39bdad-16dd-1fb4-2c5e-2de0e032fcbc@mind.be>
Date: Wed, 12 Jan 2022 20:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot <buildroot@buildroot.org>
References: <20220112101021.456463-1-nolange79@gmail.com>
 <CADYdroPR-+z0fNJa8pD0ZFB3z6-fdGLpes7cUem5xSnyBCHv7g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroPR-+z0fNJa8pD0ZFB3z6-fdGLpes7cUem5xSnyBCHv7g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2022 11:19, Norbert Lange wrote:
> Am Mi., 12. Jan. 2022 um 11:10 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>>
>> We changed the skeletons in bf01e51f3c, so that var/lock
>> points to run/lock. This resulted in build failures as
>> some packages want to work with these paths.
>>
>> -   Create run/lock, the run directory will be purged
>>      later anyway (since 5e78e7e97d).
>> -   for init == systemd, create the var/lock symlink early
>>      to prevent packages creating this path as directory.
>>
>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>> ---
>>   package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
>>   system/skeleton/run/{ => lock}/.empty                  | 0
>>   2 files changed, 2 insertions(+)
>>   rename system/skeleton/run/{ => lock}/.empty (100%)
>>
>> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
>> index 1e212cc2f7..795a171809 100644
>> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
>> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
>> @@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>>          mkdir -p $(TARGET_DIR)/srv
>>          mkdir -p $(TARGET_DIR)/var
>>          ln -s ../run $(TARGET_DIR)/var/run
>> +       # prevent install scripts to create var/lock as directory
>> +       ln -s ../run/lock $(TARGET_DIR)/var/lock
>>          install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>>          $(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>>   endef
>> diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.empty
>> similarity index 100%
>> rename from system/skeleton/run/.empty
>> rename to system/skeleton/run/lock/.empty
>> --
>> 2.34.1
>>
> 
> Fixes: http://autobuild.buildroot.net/results/3ee/3ee8f9ee55e51af38e9dbe7b9840c9589d88a30f

  Applied to master with that added, thanks.

> (and alot more containing the vtun package)
> 
> For someone not fluent with mailing list workflows, and working with a
> couple projects,
> it might help having a few example commit messages (-templates) in the docs.
> ie for respins, bug fixes, versioning (potentially of series)

  Absolutely! I'm waiting for a really nice example to turn up on the list and 
steal that for the documentation.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
