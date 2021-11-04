Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A44CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 03:53:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91BB9611AE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 03:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91BB9611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3214880CD3;
	Thu,  4 Nov 2021 03:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9YGv8umBngR; Thu,  4 Nov 2021 03:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9707D80C40;
	Thu,  4 Nov 2021 03:53:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE89B1BF9B2
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 03:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDBC9402DC
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 03:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfMRMpc4aOC4 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 03:53:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EF6B402BC
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 03:53:36 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id s9so4431813qvk.12
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 20:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLrTqPIecA6E7yT2g/CTZMcUWD/OnA600So85qc/EMQ=;
 b=m312LuzgtnB/qJq6Dt5s/fYXoKzCEDmtzUU7K1MwnkbCpWj4HaRXXDKCvON5lyj12g
 NoR0mTb9dwt2OdxrZd8j25E9DmJsl5i6CGCRDaAaAjA2fsTeKbyXhoO3s3E+W5a+nfPp
 Rue6aFRq1UwBfkas1UMeQWNVFhNbzTVYUSwa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLrTqPIecA6E7yT2g/CTZMcUWD/OnA600So85qc/EMQ=;
 b=0lPCBTF+WG17JOwuaTlfUBKjYfOqIvDseYxMAqLWcrBZZ3j4vu1N1bsYvrC/9XoY3H
 VkP6q9Y3Y1z6xEl4NtsDKcYL25sKFMfzLnIAUIl0IGcvRiPM4U44cA+UGCoukjVXyzLI
 F50zgeaksYSoF+Y9n0rUL8TSumUr6mI6HsgUbU5BuuLft4tCiNAW6GDqBwdGY83XPF6w
 Udx+/8KnJuFGsIoXGYInEj9NGCImW0wXHCMjlHFk+AN/mXKGMfrhYOKyNPjtIrXOIZbG
 xQP/B/7O/S/x/htG1bGQf5sOvrmcuQ/kodEjNSBpxk3xBYuxMyRgwjXOHrJQkyIUVrk2
 1t+A==
X-Gm-Message-State: AOAM531tNH6f7xLzsxUj5VL//1YD0Tx9RP4bKVuzUzAVAKW6GzqR0ydj
 GeB4gSLR4W1hjyQ6747MF3zcMH6W8IIM2qwYdnI=
X-Google-Smtp-Source: ABdhPJxplwRdglu48nbKcbqfr2yPOYCCnZ3APtfwm0L4vWAW0IOAM5Ft99t1bj53DjIn3k+JSN47uHlK95LKKyEp9J8=
X-Received: by 2002:a0c:c784:: with SMTP id k4mr47436019qvj.43.1635998015064; 
 Wed, 03 Nov 2021 20:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211103045627.1281356-1-joel@jms.id.au>
 <20211103184432.77423564@windsurf>
 <bb8d99ec-8544-388d-41bd-16a032ae9e46@gmail.com>
 <20211103220519.22d12e03@windsurf>
In-Reply-To: <20211103220519.22d12e03@windsurf>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Nov 2021 03:53:23 +0000
Message-ID: <CACPK8XdJtEiSK490HNYnr+JMyKyQDRmQP-7C60pqkAaKCNVC2g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 0/2] configs: Update ppc machines to v5.15
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
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 3 Nov 2021 at 21:05, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 3 Nov 2021 21:56:52 +0100
> Romain Naour <romain.naour@gmail.com> wrote:
>
> > This series can't work without adding kernel 5.15 support :)
> > http://patchwork.ozlabs.org/project/buildroot/patch/20211101185420.2338601-1-michael@walle.cc/
>
> Dammit, you're right. I'll have a look at merging those patches.

Thank you for your enthusiasm!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
