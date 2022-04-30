Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF0CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 10:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4956060B1F;
	Sat, 30 Apr 2022 10:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bteNyHd-B9jz; Sat, 30 Apr 2022 10:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548EB605B5;
	Sat, 30 Apr 2022 10:46:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9965D1BF3AA
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 10:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FAEF4012D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 10:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcFVAjMT4m7k for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 10:46:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 430A540022
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 10:46:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id d6so11661420ede.8
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 03:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=SQkgUvzKXoa+9aRzHAJ1rV1mgwI0MHH0LNc8q1A8GTY=;
 b=NDp2YWk8LO2QHNuZIrHT6WvbZllb2m2NcQPhkrVVNKjx9Rtke21Wx0hJUX36aNzA/6
 X83JlKc19qD0RrbS1QmgiE/UABjzAbG/C9HdzlVA6KhdjgbBLTttpUaitiGTKN/5KIgH
 o3U9FiN8mC9uuuWzuBg6seDCwIIX7D1c47UQ9wQxEa0opoNYTS/pgs2K2SfSMm89u9RT
 QFA6DQ3q2OCLhCUMTlBR+H7tINZn5QHLBr6ASmeipum/Q6djXM5GKYKuBO6o6jI1rdSQ
 ud7QIx6/pyupWgRJgbxn57d9/2wsAln9mjVaPTxs3dNbyAs3qKxkc8pV1vCOpMvufk/m
 Ngow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SQkgUvzKXoa+9aRzHAJ1rV1mgwI0MHH0LNc8q1A8GTY=;
 b=J2E72l5Hte+1S2alHWrp0bSZV6BgLKOTEaD+XarS4IpAtjgYuhgQN3QfnZQUz1XSIs
 fZwDutc4wQY/FfqY6OVHpJAudtq07aKrFvm0fu7JXDEjll/y1cTX3WaMKiwkHuXtWKWG
 XJn/pM4i9lEefKZncidoLNLbeb/L0I1vF1ZbB7KL9h5juct+1DEtjSenyk+5uYZIhD2e
 Bw82fAXxu7ooCKdRkOYz25A86kxaX6tPjQWt14ldZa2/LuXTI9hIQO0QusUPiIJvVa6q
 kGVcVcUYV2dE3XduiZ3Ro5iswlqv1tVOckVislFIMfLaY+fxfGdIVUt4ZkbEc01tM7az
 u+7A==
X-Gm-Message-State: AOAM533sFzUAsrqQBBJHx2Nt0HS8JOMFvZgT+JBqnl+86F2BYnruB+H1
 O3nnAC5xWNpUADGEIjBuQR2ACQ==
X-Google-Smtp-Source: ABdhPJzXTKinizlTUttPqgieiPLk7xOCUOesjJ2hKGXUjqcQa0BiVh3r0WxNiG2e6oLkSAm/jYyicg==
X-Received: by 2002:aa7:d842:0:b0:425:f329:33b1 with SMTP id
 f2-20020aa7d842000000b00425f32933b1mr3908886eds.74.1651315610102; 
 Sat, 30 Apr 2022 03:46:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ml11-20020a170906cc0b00b006f3ef214e59sm1511430ejb.191.2022.04.30.03.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 03:46:49 -0700 (PDT)
Message-ID: <f3fa9d6c-a440-e146-a07b-b6b95d351295@mind.be>
Date: Sat, 30 Apr 2022 12:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Stefan Agner <stefan@agner.ch>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <1f0d993a5097ca6e94a4ded0b7e0c5cb@agner.ch>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <1f0d993a5097ca6e94a4ded0b7e0c5cb@agner.ch>
Subject: Re: [Buildroot] GRUB2 2.04 (buildroot 2022.02.1) failure reading
 sector errors
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



On 29/04/2022 16:47, Stefan Agner wrote:
> Hi,
> 
> On Home Assistant OS we are moving from Barebox to GRUB2 as the
> bootloader for UEFI based systems. The switch is currently on our beta
> channel with several hundert of users. I have now 4 independent reports
> where the system stopped booting after upgrading to the new OS version
> with GRUB2. The systems show the same error: "error: failure reading
> sector 0x9c900 from `hd0`." The sector number is not always the same,
> but it seems to be always within the partition holding the kernel. We
> are using compressed squashfs which might be a factor influencing the
> problem.
> 
> Despite testing on several actual and virtual x86-64 systems I am unable
> to reproduce so far.
> 
> At least one of the systems has been successfully tested with Debian 11
> bullseye (which is using GRUB2 2.04 as well). That boot flow doesn't
> make use of squashfs of course.
> 
> Anyone seen similar issues? Ideas how to get to the bottom of this?
> 
> I am considering moving to 2.06 to see if that fixes the problem, is
> anyone working on 2.06 already? I see that buildroot is carring 150
> patches on-top of vanilla GRUB2, so that requires some work.

  (Almost?) all of those patches are backports of upstream, because there were a 
large number of CVEs beginning of 2021 and there was no release which included 
fixes for them.  So updating grub shouldn't be that much of a problem.

  Regards,
  Arnout


> 
> Best regards,
> Stefan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
