Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E5EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 07:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC11785924;
	Sun, 12 Dec 2021 07:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFJwi2L6yui3; Sun, 12 Dec 2021 07:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A6E84F41;
	Sun, 12 Dec 2021 07:24:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 055651BF3BE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 07:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E289284F41
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 07:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQRSxNHBmZwA for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 07:24:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40A3084F3F
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:24:50 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id t13so23939975uad.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+HdhqlIiDZkiTzFkb7HKyrFy3HtSr8S44oeaRmlBSc=;
 b=GN18trY6iImYfkwQKpxheXrLK+ocOw1V+B6UUS2GXU121IBTAXygqVmRuTB6ewS9UN
 2hn/t2siEowF6jCvbABbaICTqx0A3SlHzseETX76e1f7mB8QuVSe5RhtR8AgDJ3kNxKQ
 Ny5shTss6Zvz7S4q01NNXhQgOl7KNmV8w4RHAPlaKDKrohfMK7Vn4b1Mv1JLIlYjyPlZ
 f5K4dhDdLXBRUMFSAaem82k/THDcZaewtE/JmTbrf1pEz/P+oKy6xgmQy/rRZK2RHZ0x
 1JodAOX2G65n3C2x3kjTvPfk7sm6J31frfepHdJU4lGfZxPl5ISn9698lEKAvcD5YeOo
 10TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+HdhqlIiDZkiTzFkb7HKyrFy3HtSr8S44oeaRmlBSc=;
 b=EQ9joXrEi0jWe6eLBF7YbpeuQ3LDPk4eqwUKENGRCXazCIg+EPEOJDiV7cJp6wOIQ8
 NeR1Nx8iV/72xasbR5AnwZtfINkkYm5LdQiBhMKxrjTHaXjXwEVX/TxSw9XabR8P2HqO
 2omK4b79ZNYDtUlIlZRanPjqboHjo239ivsy6wkLZU7UX6G8e3EA8nCwhFJAXkSU5OZc
 hlg9wCXyhcECHcxe3BzcTrgTNc4RapzjNvk13OjodEXlWjv77mmDOp5LsNME7emd3gI2
 uX8HnTvQ6ykZOQL086oIvuLy9nAwMlSY0j656aZK5KBQ7TykCtF9Tushb2ZQg6AJeGbk
 a0EA==
X-Gm-Message-State: AOAM531R138Zg9LslTJE9baShNpY/mZHkX3SAxP5hATQnuCwDbIesEU7
 b1ASxWQfcz1V1WWaK0ZfU30xpDIP5LWOQA==
X-Google-Smtp-Source: ABdhPJzWVjMgzK8iLOuHs0ETru1Yo/mPkg3f4eFUgJmiOZj7RrLwx3lAL7SJg8XBx+AUU4s52YO7cw==
X-Received: by 2002:ab0:2498:: with SMTP id i24mr36801564uan.18.1639293888624; 
 Sat, 11 Dec 2021 23:24:48 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id a4sm3193684vkm.46.2021.12.11.23.24.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 23:24:48 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id t13so23939939uad.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:24:47 -0800 (PST)
X-Received: by 2002:ab0:2041:: with SMTP id g1mr36028769ual.131.1639293887679; 
 Sat, 11 Dec 2021 23:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20211210181353.4012562-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20211210181353.4012562-1-fontaine.fabrice@gmail.com>
Date: Sat, 11 Dec 2021 23:24:36 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qF042yATGC_Hy_gaBemv51mOc+ZfXoFkmHtXiZ85N1ig@mail.gmail.com>
Message-ID: <CA+h8R2qF042yATGC_Hy_gaBemv51mOc+ZfXoFkmHtXiZ85N1ig@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: security bump to version
 1.0.3
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Fri, Dec 10, 2021 at 10:14 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>  # Locally computed
> -sha256  6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33  runc-1.0.2.tar.gz
> +sha256  0eaf2f6606d72f166a5e7138a8a8d4d8f85d84e43448c08c66a1c93ead17a574  runc-1.0.3.tar.gz

Reviewed-by: Christian Stewart <christian@paral.in>

Regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
