Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A00C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7E7040A4D;
	Thu,  6 Jan 2022 22:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lxHXe1tj5lf; Thu,  6 Jan 2022 22:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B1240131;
	Thu,  6 Jan 2022 22:26:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0271BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BE5F80D7E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BH2Ldt3PqPhv for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:26:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0D3880BD3
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:26:26 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id r15so7117123uao.3
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s0pwh7U1YJfQif3dSbheEE/+rA2TN8i7LJ9TDdTcGmU=;
 b=XZ5MnIn9sHfG4BIxQFZHqhUQLP2zOiEZpuPJdEJc5JpbhEjOJDN4NWakFTEO7sO/ps
 lIzUM/UB97bOehMgcrM/23c7NBWkmyhZ1doh5y6PuPSQ63pQXZa4Ndz97Jw0mPUX3zf+
 +lw91Pzj/NSyIesydCczrdVyAFAJBKUT0sz+ermI5E2ZMS7yNMX/+0ciBmxJKd6WXm1R
 nb4eRN6mcMyryxuFJmP14H0aHEHkD+99AmescxcJVjQJZwSofY59SdhNgbZMh/1JbHRI
 0UADk63nepuqkqAQ1w1SQmFbSWgZSuwyIsHGCXowDwn/4ZgEYyWE33L3+QJqdiRDteXp
 PSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0pwh7U1YJfQif3dSbheEE/+rA2TN8i7LJ9TDdTcGmU=;
 b=q47dv0xgn55gMVfQMU82GrbnnnY09nYuTnY/f8EDPwOvb4Fpu0+yfCPf39qop7ouLs
 ve4G0bbS7uPSP/c1wW8ZIewJp1df0zR1VHpNHkt9NEqoXg0X3DwMD/2K2vVXCpUhGcUx
 8mlql8+2Zq82Go7HwWyvgbqxQ/daoNnHuVXVAsv9I63bMGY5Ws51ImxtDUXJGcS7L3/p
 bq5C4pBHOjGwhJ97BoYDTpY9cSwOHx2xwa/Az8+IQpRMYcuYU9EDmZFsZGEN7I67xpL+
 /5ojDB4C+jZUldRMTl0ph2rcgIzQEMFw2OQqM3IeVAsTa+gR4KNzk087ssHVpDNv99zK
 exqQ==
X-Gm-Message-State: AOAM530ZX2MlMBGLN1hQgRjivFnNrmdqA/OOVlsn6IV/5O0xNg5t4oh/
 24qKgL7eQliTD3rO5l38vYiCFbD48Y1W2nYf
X-Google-Smtp-Source: ABdhPJzqnfD65Zont0u3xBtH2VKXQjgmI0zlXc7IoMkDSV0MA+OtWRgeXS2paVwT/HlAu4z2kabB+g==
X-Received: by 2002:a05:6102:124a:: with SMTP id
 p10mr20045241vsg.3.1641507985297; 
 Thu, 06 Jan 2022 14:26:25 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id s204sm2078985vkb.3.2022.01.06.14.26.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 14:26:24 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id i5so7039338uaq.10
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:26:24 -0800 (PST)
X-Received: by 2002:a67:d489:: with SMTP id g9mr20437849vsj.85.1641507984585; 
 Thu, 06 Jan 2022 14:26:24 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
Date: Thu, 6 Jan 2022 14:26:13 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rb6kXYQmgN-BhYXVnxZHmdSC7DXEP-YeBj7THS2A=iYg@mail.gmail.com>
Message-ID: <CA+h8R2rb6kXYQmgN-BhYXVnxZHmdSC7DXEP-YeBj7THS2A=iYg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 00/11] Support for Cargo and Go vendoring
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Your time spent on this series is much appreciated.

On Thu, Jan 6, 2022 at 1:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Christian Stewart via buildroot (2):
>   package/embiggen-disk: new package
>   package/gocryptfs: new package

It'd be nice if the author on these commits could be edited to remove
the "via buildroot"

... this was added by a Patchwork bug a while back.

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
