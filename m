From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 16 Oct 2012 21:33:18 +0200
Subject: [Buildroot] [PATCH] fluxbox: select xmodmap
In-Reply-To: <20121016192401.04d2eaf1@skate>
References: <1350370149-2876-1-git-send-email-yegorslists@googlemail.com>
 <20121016192401.04d2eaf1@skate>
Message-ID: <CAGm1_kuoQ6QRmpyz0r8Uyb-KS140pzJhuP3Y65q4B4TDCFaCZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2012 at 7:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Tue, 16 Oct 2012 08:49:09 +0200, yegorslists at googlemail.com wrote:
>
>> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUXBOX
>>       depends on BR2_PACKAGE_XORG7
>>       depends on BR2_INSTALL_LIBSTDCPP
>>       select BR2_PACKAGE_XLIB_LIBX11
>> +     select BR2_PACKAGE_XAPP_XMODMAP
>>       help
>>         The Fluxbox lightweight window manager for X
>
> When a dependency like this is a runtime dependency, I generally like
> to have a short comment on top of it. It's kind of likely that someone
> will read fluxbox.mk, not see xmodmap in FLUXBOX_DEPENDENCIES, and
> therefore wonder why this "select" is around. For sure, Git history is
> here, but I think something like:
>
>         # Runtime dependency, needed by startup script
>         select BR2_PACKAGE_XAPP_XMODMAP
>
> Doesn't harm too much and can be quite useful in the future.

O.K. Thanks for review. I will resend the patch.

Yegor
