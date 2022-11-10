Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC6C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 10:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E708081AD7;
	Thu, 10 Nov 2022 10:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E708081AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KStqCEiedZqN; Thu, 10 Nov 2022 10:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B9781948;
	Thu, 10 Nov 2022 10:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B9781948
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5248B1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39AF5402D1
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39AF5402D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDFH7d53Xkpa for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 10:01:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110674029D
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 110674029D
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 10:01:53 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id 131so1753182ybl.3
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 02:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2nq+NM0Py4DZNDYz5tCTer5KhFHXkTCRzCDDD+YJfjE=;
 b=QPaqjtkDBX+flucxMj/oWI7G4Z8t1wMxTQRfSG4YAecTHOCylH9BxdbG/r+uN3HBFx
 0FVQPc4wuR0LhlT5lfmzRskuZkrUUX/bqn7cHIOaCmIvHCaW6X6SD2LPs9WVucG41cku
 p7pBtmaV2SdHCpH3zWU9vy9vviVq8ocIjTy+h9vBYz8j4v2Lerbcpdgd+n4NQ4Ienbk8
 rIr7sWJsm/27pEMr+3Z6GVzc52ndlYlPovtdXQaYTT/NpHVv24e8oCLkdoavRSpNhTXI
 kShCE6vwkhbBfQtIepoc4/tdHL2YFTgOqqKXvWBdcWfsucJqmdCQcJDoosp6zbAsiJuU
 4cOg==
X-Gm-Message-State: ANoB5plAig5u6OTvSk0UKXHGi5Atms+BBvq+3A7ZSNstm3UO83xpHOq3
 cCTUVOaLmO0XHNW7kOzEQlnsn76cz9MZ3BIXXfF4mqIzLM0=
X-Google-Smtp-Source: AA0mqf5f0dLYhElvn35ecX9JjxutWzZm45JYLjl5/EwY5811ng2r9gTwWDQrILtuyW9gEPMXweNTPztLxa8L59VFmdo=
X-Received: by 2002:a25:2c2:0:b0:6dc:ffba:8d70 with SMTP id
 185-20020a2502c2000000b006dcffba8d70mr1281982ybc.110.1668074512603; Thu, 10
 Nov 2022 02:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20221011084946.2276735-1-nunes.erico@gmail.com>
In-Reply-To: <20221011084946.2276735-1-nunes.erico@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 10 Nov 2022 11:01:41 +0100
Message-ID: <CAK4VdL2JLMZvb6oE7gkZxt_VaccQOy+f1OkNnG4paHkkmMmNyQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2nq+NM0Py4DZNDYz5tCTer5KhFHXkTCRzCDDD+YJfjE=;
 b=UgVbC0ZTAB2v+jcS3mj8e0pigE5dJmOT57MPdnb6KW0SCkdNNltEVGlw9e2Y9zKAlQ
 2KeobGiB672s2VN1rT6UR6vhY+5n1N13fU2VNWy3IW4f6ILLW2z+/ROUkrEqgoZlF/+T
 MFNO+C7gU2w+eL7Br/z9RxwkDNd1amknJmFDrc6O6G/alDhsqw7h8+Id4b/j8+S9+Koz
 Fk2oMvglYVCTnGsV42bGwLoHy7CB+P0ZEaG23k4mbLJxkvAzLGKUPnN3tzPXDZ9vaXPn
 5VnD2zcqrsYt3e2vZXVrI8XkoUaZt406l1juU3b4LQHpVVCkP9WNXniYw1gPVCbjZXb7
 f16A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UgVbC0ZT
Subject: Re: [Buildroot] [PATCH] package/efivar: fix build with musl libc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, Oct 11, 2022 at 10:49 AM Erico Nunes <nunes.erico@gmail.com> wrote:
>
> Backport upstream patch to fix build with musl libc.
> This patch is only a requirement since efivar 38 and was applied
> upstream shortly after the 38 version tag.
>
> Fixes:
> http://autobuild.buildroot.net/results/c49d894b109d68e2624074eab8b939fefa3b42ef/

Looks like this patch was missed in the queue and that issue is still
generating daily autobuilder failures. Could someone take a look
please?

Thanks

Erico
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
