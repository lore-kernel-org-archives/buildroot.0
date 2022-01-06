Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36246C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 13:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A4842930;
	Thu,  6 Jan 2022 13:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id keCdDmL8oMID; Thu,  6 Jan 2022 13:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C90428A8;
	Thu,  6 Jan 2022 13:48:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28CBF1BF329
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1584640A2A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wX7Jovagn7op for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 13:48:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D525741304
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 13:48:55 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BD8C3C0013;
 Thu,  6 Jan 2022 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641476933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0gOUFveorEqvKXgH8/q/oHqhgw3iTv+OOq8Jw1kwAE=;
 b=S+PhYKEVx7ZxfsgE9n0mAN8RR/b9sHoh6I8Q+Hx2s4Mmwk2ZqTih64/elXRpDEdYxrfA0o
 jdjQQVIRhB14ktvGpSIUkPr3emdJ0Kl0qeUWbLuQ7qW/3IOXCzRWkkF7uNHJJEOR5Rho3m
 M6lVjvIhAsT0yLbJ+GGmckfKt+Ibu0VsCK790hcgPJX6Egnh5ioJP+G0Z/1zm/TrC1O/vL
 YGa/Zz2EnLliYloN5rrQKJoA6g9uSNlPEe4dDW3M2+36RPL9BvlsQWq1BuPSZZWcQJo9NJ
 h7PGtmDg021e6Ov2s0iTDGilp+k1La4bSwSBu4U59NPxzqUG00qNKingR8VkCg==
To: buildroot@buildroot.org, yann.morin.1998@free.fr
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
 <20211223111348.3532601-3-thierry.bultel@linatsea.fr>
 <20220106103149.GN614810@scaer>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <313f164a-4f58-3212-a75a-d64acbbc0168@linatsea.fr>
Date: Thu, 6 Jan 2022 14:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106103149.GN614810@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3 3/3] fs/cpio: new option to use dracut
 tool
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


>> +
>> +show_modules=yes
>> +i18n_install_all=no
>> +lvmconf=no
>> +mdadmconf=no
>> +early_microcode=no
>> +hostonly=no
>> +hostonly_cmdline=no
>> +use_fstab=no
>> +kernel_cmdline="rd.break=initqueue"
>> +do_strip=no
>> +
>> +# Dracut modules need
>> +add_dracutmodules+=" \
>> +busybox-buildroot \
>> +bash
>> +"
>> +
>> +# Modules to ignore
>> +omit_dracutmodules+=" \
> [--SNIP big list of stuff--]
>> +"
> Rather than remove select stuff, can't we just start from an empty set
> and add just what is needed?

Yann,

Unfortunately, This is not that simple.
Dracut will unconditionally source a lot of unwanted modules present in 
host/usr/lib/modules.d
(basically because it considers that the init system is systemd always) 
unless you tell it not to do it.

There is no option to specify another directory to look in, nor a way to 
select the only needed modules.
Only excluding them seems the way.

Also, when you asked why I put the module-setup.sh as executable. You 
are right, it is not mandatory to do
so, because dracut just sources these files. The fact is that all the 
ones that it provides are set
as executables, with no real reason.

Regards,
Thierry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
