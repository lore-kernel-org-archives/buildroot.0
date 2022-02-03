Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C54EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204E8408BB;
	Thu,  3 Feb 2022 20:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XI1yqqptN8bx; Thu,  3 Feb 2022 20:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E9D4088C;
	Thu,  3 Feb 2022 20:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD951BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A6C408D2
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WJ0yIhTKxsH for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40BF841735
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:47:09 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id m10so6029164oie.2
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2F1W+MEGQkm0Th4qfVjqdgF5wORUdG1XMp78JjJ0VCI=;
 b=TEz3saj6w9+FDXl+2SNRBzXXUujdpfDPy3VsGaseGBhv+o6cmSnYGFK2LXypY9BoFd
 t2aA7ZyXcMd+mnmvpPiZHm6g8GffD1NtgjM8WGvu3ag8ngclIsSyNIS7MKfV7vXo6Iay
 8C0NJTnbSoBaXaOWB2+aC4VH73jVhTcWRtkT0CwBuCmflHjg0mtFpekArDxJiQoe+ego
 RrmZlh6KFOKE8BUsD2M92R/Ludi4w5OHetEF4wyrDII1tb2AozH+d5fDjpX2KbzJgzy8
 i2iXzGPYJpeAifnrBlSoMXy+B7KAdrNXhmndpzAyn5hBnb+Vt4Ggta8oFuBGTZ3bBe/n
 7jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2F1W+MEGQkm0Th4qfVjqdgF5wORUdG1XMp78JjJ0VCI=;
 b=zLI8cEk88xZ2r4+xDi8kuLeblWrPqviVhM62Y7mYWscTPrItmiGKKbh4rJWFhgXZA1
 xSXwi4lhQ6CuhunODqYEY5rUZ66CnyHE86W+vuQef0fWMXeaDpMIytE8xZXxxF6laEX8
 eS8O6QMHuF0Gs7gbo0e6qZUCAZCjuJ7oGfJOZPE+oywlw4mqdVM6+jp87mcPYv8z3aNI
 rLyVHREYNKDwT/zXl1zZrYBW9GIqddTjhAgf359SsjyZex9GJoeY+ubQf8/ih9H13AFf
 uCHzp0giDd7WmR90Of50hQDtkzUiouPwlUDk4q3VzCtrj5F0u5W8r8/SldXgvELNVhrE
 Y4BA==
X-Gm-Message-State: AOAM532BFTKDDZ7rNmhre63k7jCw84nc+UpbNE+uxZVs0QEK4UGXO7qS
 ismcvYP0ewGpkJLayyXlR0uJO8njWNfJmoOvF67LGdx4
X-Google-Smtp-Source: ABdhPJwdYFbFilShWBqLoq7p11nZqm57eL5+YOMh6XHteyIdS2NPFpZHmUrrL4slRbCHkP6cBVOFWsO3wgotABmMuB8=
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr9006493oie.103.1643921228180; 
 Thu, 03 Feb 2022 12:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20220131225622.90226-1-james.hilliard1@gmail.com>
 <fe89e71a-ad55-44ab-20ba-d2b46b15a271@mind.be>
In-Reply-To: <fe89e71a-ad55-44ab-20ba-d2b46b15a271@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Feb 2022 13:46:53 -0700
Message-ID: <CADvTj4oBnkTotAUnOFssY8J0wN7_Q0cADYSA-wuvdBg_ciuOoA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v7 1/1] package/qt5: bump packages to latest
 kde submodule versions
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 3, 2022 at 12:35 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 31/01/2022 23:56, James Hilliard wrote:
> > This points all qt5 packages to the latest kde submodule versions
> > available at https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
>
>   It took me some reading of the patch and of the upstream repositories to
> understand that there are actually no release tarballs or tags, and the the
> 5.15.8 is something we just pull out of our hat to be compatible with
> qt5webengine. So I updated the commit message to (hopefully) better explain that.

Yeah, upstream def makes this a bit annoying.

>
> >
> > We need to remove some patches applied upstream already.
> >
> > We need to rework qt5location to pull in the mapboxgl dependency from
> > a separate package as that dependency is only included in release
> > archives.
>
>   Instead of creating a separate package for it (which BTW you forgot to add to
> DEVELOPERS), I changed this to use the git download method and _GIT_SUBMODULES =
> YES. I checked that it extracts to exactly the same thing.

Yeah, I had done it this way mostly for consistency with the qt5webengine WIP
update as for that we kinda need to patch multiple deps that have upstream
patches that apply easier against the deps directly.

>
> >
> > We need to pin qt5 packages not available in the new upstream to the
> > previous 5.15.2 version.
> >
> > We need to set SYNC_QT_HEADERS for all qt5 packages in the new
> > upstream as headers are only copied in release archives which are
> > not provided in the kde upstream.
> >
> > Set the MODULE_VERSION to 5.15.8 to match latest qt5webengine which
> > should be the closest release to the kde patches which don't have
> > proper version tags.
> >
> > Create a .git file so to trigger headers sync during configure.
>
>   I don't really understand why this was needed rather than calling syncqt
> explicitly, but OK.

Some packages like qt5base don't work with calling syncqt explicitly as they
have different logic needed.

>
>   Applied to master, thanks.
>
>   Regards,
>   Arnout
>
> >
> > Hold back updating qt5webengine for now since the latest version
> > requires significant changes to build, just tweak existing version
> > to be compatible with latest kde versions for now.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
