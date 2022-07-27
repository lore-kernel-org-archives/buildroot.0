Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F75C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 755B940A16;
	Wed, 27 Jul 2022 18:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755B940A16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GeybbaB08pz; Wed, 27 Jul 2022 18:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58795409EC;
	Wed, 27 Jul 2022 18:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58795409EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D13471BF39C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC95C40982
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC95C40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnIx9_l6owiP for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEF5A409EC
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEF5A409EC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:08:25 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so23550105fac.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3uprG83sXY3iWIfOC75LZ0rJGuxQeRcdyqHwmPXNWU=;
 b=2n3TL2+IUJLW0dGW1i+8kDxKcZMc1w53shgBZ/YXYtTTnYpOjRW2U8+EhoRc0QVpXu
 qzHcqpo7AM6NAStYYEtkjzlZ6RcahUaONdNkCd3iWYbmo7OJFNqKTrNxIXmuJGtD0j6s
 Zs5PCI1VAyrIWmPRaufWkfH7izwbT7V7Wmha5RpwM3NWdZ00DWVfMMqytPqW4eSeM7Eb
 UyRaZTJGVYLb1gqBjOGKXt87hsaNIEGj1dHID2mZfRoPTWmuMCp9e9lRhQ+ApJHo8PUW
 9C3WwAkiF+UvOt/n3bLNQXQenMH4TQfGAud6tvK53G2/PxClYpk6auM/0TQqjO5qOwnq
 lMQA==
X-Gm-Message-State: AJIora9tM1JtepEY4gG/gacpOyymwPg+kBlzqgF2jC3EFE/savKNvYHj
 fkXZcCuwYTqjNZZ22GTNu1CGyNQYDTbbqoI1oCk=
X-Google-Smtp-Source: AGRyM1vUJA1+/D+bA/sXkeir+EUR8KdiIVaUijaCCDEMdncOxdKixPqhBVfe4tMagkvzlHRgU7l9la1jINdaeGE0vkw=
X-Received: by 2002:a05:6870:3282:b0:10d:7164:c66e with SMTP id
 q2-20020a056870328200b0010d7164c66emr2768739oac.147.1658945305008; Wed, 27
 Jul 2022 11:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220518013424.2558229-1-james.hilliard1@gmail.com>
 <ccbd9868-2add-5859-f19b-d46b394f8ca9@mind.be>
In-Reply-To: <ccbd9868-2add-5859-f19b-d46b394f8ca9@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Jul 2022 12:08:13 -0600
Message-ID: <CADvTj4qQLwsDOWUsaOcR54Owi4YYfHqoSF-5Uu1TLEVhAevg1A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=D3uprG83sXY3iWIfOC75LZ0rJGuxQeRcdyqHwmPXNWU=;
 b=GazhyQoSTBs8QOmQFGRRk4KfteDq5odMn90ZfdIUa9xpY3hAcgzA9Nsp1ULnOpfCcB
 5Ef4DNiIqaaBco13Qz78IuiglRn3xLnmTiTMnZ8tWOldElPoBGtNS/T/ew3wGcRs31Dj
 CGI6vEhwDmBi9sZol8QA+e5TpkX5MxeXRlWHEB/AWxzoWFqksnz6p8cOk6zYF/Ug/dwe
 ZE7zsZUgED6VRqpU4uH0uUl5TOIpwHd+hb5AYMqlCVwGjiZYqFYFkK5GNe6tAx+E+p6q
 T/7lQcEakC1yhj+Y5FGRgZCfLt/iew/FYUVe86O/K5tkc+rpIc3P+LUNI7cQvE7m1Ot4
 T1hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GazhyQoS
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: bump packages to latest
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot <buildroot@buildroot.org>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 27, 2022 at 5:08 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 18/05/2022 03:34, James Hilliard wrote:
> > Bump qt5 packages to latest submodule versions from:
> > https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> >
> > Drop a qt5location patch which is now upstream.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/qt5/qt53d/qt53d.hash                  |   2 +-
> >   package/qt5/qt53d/qt53d.mk                    |   2 +-
> >   package/qt5/qt5base/qt5base.hash              |   2 +-
> >   package/qt5/qt5base/qt5base.mk                |   2 +-
> >   package/qt5/qt5charts/qt5charts.hash          |   2 +-
> >   package/qt5/qt5charts/qt5charts.mk            |   2 +-
> >   .../qt5/qt5connectivity/qt5connectivity.hash  |   2 +-
> >   .../qt5/qt5connectivity/qt5connectivity.mk    |   2 +-
> >   .../qt5/qt5declarative/qt5declarative.hash    |   2 +-
> >   package/qt5/qt5declarative/qt5declarative.mk  |   2 +-
>
>   Is it possible that you missed qt5doc, which I merged two days ago? Or did it
> really not have an update?

This patch was from back in may.

>
>   Regards,
>   Arnout
>
> >   .../qt5graphicaleffects.hash                  |   2 +-
> >   .../qt5graphicaleffects.mk                    |   2 +-
> >   .../qt5/qt5imageformats/qt5imageformats.hash  |   2 +-
> >   .../qt5/qt5imageformats/qt5imageformats.mk    |   2 +-
> >   ...fix-compilation-for-no-opengl-builds.patch | 528 ------------------
> >   package/qt5/qt5location/qt5location.hash      |   2 +-
> >   package/qt5/qt5location/qt5location.mk        |   2 +-
> >   package/qt5/qt5lottie/qt5lottie.hash          |   2 +-
> >   package/qt5/qt5lottie/qt5lottie.mk            |   2 +-
> >   package/qt5/qt5multimedia/qt5multimedia.hash  |   2 +-
> >   package/qt5/qt5multimedia/qt5multimedia.mk    |   2 +-
> >   .../qt5quickcontrols/qt5quickcontrols.hash    |   2 +-
> >   .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |   2 +-
> >   .../qt5quickcontrols2/qt5quickcontrols2.hash  |   2 +-
> >   .../qt5quickcontrols2/qt5quickcontrols2.mk    |   2 +-
> >   .../qt5quicktimeline/qt5quicktimeline.hash    |   2 +-
> >   .../qt5/qt5quicktimeline/qt5quicktimeline.mk  |   2 +-
> >   .../qt5remoteobjects/qt5remoteobjects.hash    |   2 +-
> >   .../qt5/qt5remoteobjects/qt5remoteobjects.mk  |   2 +-
> >   package/qt5/qt5script/qt5script.hash          |   2 +-
> >   package/qt5/qt5script/qt5script.mk            |   2 +-
> >   package/qt5/qt5scxml/qt5scxml.hash            |   2 +-
> >   package/qt5/qt5scxml/qt5scxml.mk              |   2 +-
> >   package/qt5/qt5sensors/qt5sensors.hash        |   2 +-
> >   package/qt5/qt5sensors/qt5sensors.mk          |   2 +-
> >   package/qt5/qt5serialbus/qt5serialbus.hash    |   2 +-
> >   package/qt5/qt5serialbus/qt5serialbus.mk      |   2 +-
> >   package/qt5/qt5serialport/qt5serialport.hash  |   2 +-
> >   package/qt5/qt5serialport/qt5serialport.mk    |   2 +-
> >   package/qt5/qt5svg/qt5svg.hash                |   2 +-
> >   package/qt5/qt5svg/qt5svg.mk                  |   2 +-
> >   package/qt5/qt5tools/qt5tools.hash            |   2 +-
> >   package/qt5/qt5tools/qt5tools.mk              |   2 +-
> >   .../qt5virtualkeyboard.hash                   |   2 +-
> >   .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |   2 +-
> >   package/qt5/qt5wayland/qt5wayland.hash        |   2 +-
> >   package/qt5/qt5wayland/qt5wayland.mk          |   2 +-
> >   package/qt5/qt5webchannel/qt5webchannel.hash  |   2 +-
> >   package/qt5/qt5webchannel/qt5webchannel.mk    |   2 +-
> >   package/qt5/qt5websockets/qt5websockets.hash  |   2 +-
> >   package/qt5/qt5websockets/qt5websockets.mk    |   2 +-
> >   package/qt5/qt5webview/qt5webview.hash        |   2 +-
> >   package/qt5/qt5webview/qt5webview.mk          |   2 +-
> >   package/qt5/qt5x11extras/qt5x11extras.hash    |   2 +-
> >   package/qt5/qt5x11extras/qt5x11extras.mk      |   2 +-
> >   .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   2 +-
> >   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |   2 +-
> >   57 files changed, 56 insertions(+), 584 deletions(-)
> >   delete mode 100644 package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch
> >
>
> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
