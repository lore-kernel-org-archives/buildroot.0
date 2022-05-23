Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8ACC433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 16:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4978E610D1;
	Mon, 23 May 2022 16:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSjr0PdV8WAH; Mon, 23 May 2022 16:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5762C605E9;
	Mon, 23 May 2022 16:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A831C1BF2C8
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 16:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C4840594
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 16:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WvZ1RO6aSoi for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 16:07:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4E53404B7
 for <buildroot@buildroot.org>; Mon, 23 May 2022 16:07:46 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id q4so13510746plr.11
 for <buildroot@buildroot.org>; Mon, 23 May 2022 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=207+rwhgJ/UgcYjTKelS3iRMBsP580YSKvr0BO4mOnI=;
 b=fMsjLHVpHJJcBYBS2Ts4D1ngpSmYPaYFJQeRsn7CjVZ3VGnrm5wOEMjWEfaN7RnkTG
 0yp9u0NV4ZdOhR3MWowdU9/1pWFaMjZmlz+MAIBNW5OhX7D77EJfzB1lBbt7u1lyfNMd
 iEWQ9lK66Zpx4b8IG8UejHnC7dAqz1jgO68sLLvuqWfbDY2f2i1BsNZ97UjFUhC65sca
 56vfvgGQj21yxor1a08hspUm392yfVpezYTr4HYjHC09Ad0vJVXaVseTDP1gKHiDjx0f
 8gsRRB+8f8jTq/qAxC0KjZft3kqUpQI8gvxxsDU5A5xxAwK5Ub+KEmw5MENtFrQkikll
 OeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=207+rwhgJ/UgcYjTKelS3iRMBsP580YSKvr0BO4mOnI=;
 b=HTBB78+zfL/cLAsym4/FvF/Bqbsb3s1sR8VZnz/vg4cYv+fPdKET+MUL1PNGBLWUDH
 v4EHuF53aebAEmmKPOXJM+0hewaQyWyZJAZXrZyvkkihlo7clchssx1wkTeG+3yVrXWC
 mr76f99KWK7NS+Hv6DQu6y5PBPpIsFWvYz9umKoAitlB4LRc6sdyUP8rdpckbPHbFiID
 DEaxn77tJlpw7MddF6IfMt6JpFkd760Ucg4QYF4uguc+NOPJBZ7qntYJABR9U1iatA8N
 fqUJnuBZri/XiObAJuWB2x1h0xP8+FWU1ehou0nTKAhasMoxvOxtjZm4VdBUjBNWZgo3
 fl/g==
X-Gm-Message-State: AOAM532X0HFBdecYDg+HI2E8d5DcEpHPJOJcVueG31/7Sdujv7a61WkQ
 xlcgssYkyr1sWsrR0rpcf7nPVNRudVCqqcoI8Aw=
X-Google-Smtp-Source: ABdhPJyzIVUxEfRa4n+/DVzPk1dYRshJncbT0F8Tpc3AFn1Lut6cTQwm4iy5DjBgVDdg8qIziTgXux+usT4ZMREGCXw=
X-Received: by 2002:a17:90a:7847:b0:1df:a16d:2bfb with SMTP id
 y7-20020a17090a784700b001dfa16d2bfbmr27721037pjl.71.1653322065874; Mon, 23
 May 2022 09:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
In-Reply-To: <87ilpwp82x.fsf@tarshish>
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 23 May 2022 18:07:10 +0200
Message-ID: <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Mon, 23 May 2022 at 17:44, Baruch Siach <baruch@tkos.co.il> wrote:
>
> It turns out I mixed BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS with
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS. BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
> depends on the latter, and that in turn can only be enabled for musl or
> glibc. The default libc in Buildroot is uClibc-ng. So you must select a
> toolchain with musl or glibc to enable BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.

I have just changed the toolchain from uClibc-ng to glibc or musl, and
it didn't appear the package BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.

Do you have any suggestions?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
