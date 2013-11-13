From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 09:40:53 +0100
Subject: [Buildroot] menuconfig / legacy bug
In-Reply-To: <20131112224328.4edae7b0@skate>
References: <20131112224328.4edae7b0@skate>
Message-ID: <CAAXf6LUhpgN16gBY_WFnq=kSepT-LHt-Q3Js-cAHwSUGd2CL6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Nov 12, 2013 at 10:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Samuel noticed this today: it seems like we have a bug in menuconfig
> that is annoying for the legacy thing.
>
> Scenario to reproduce the bug:
>
>  * Checkout commit 38dbd33b91adb4543e922e644b09430fa3836068 (which is
>    right before the removal of the BR2_PACKAGE_QT_JAVASCRIPTCORE)
>    option.
>
>  * Create a configuration that has BR2_PACKAGE_QT_JAVASCRIPTCORE set.
>
>  * Checkout the latest master (or any other commit that has the
>    BR2_PACKAGE_QT_JAVASCRIPTCORE removal commit)
>
>  * Run make menuconfig, it shows that Legacy is detected, which is OK.
>
>  * Now, go in the Legacy menu, and try to disable the Qt Javascript
>    Core option. It doesn't disable it and instead menuconfig "jumps" at
>    the beginning of the long comment that explains the legacy thing.
>
> The following patch workarounds the problem by removing the problematic
> lines of the comment. Basically, all lines that contains only "signs"
> and not actual text seem to confuse menuconfig for some reason.
>
> Ideas?

I cannot reproduce this problem on my end. I followed the exact steps
as you described.
This is on Linux Mint 15, not sure which packages would be relevant
here. Ncurses is:
lib32ncurses5-dev: 5.9-10ubuntu4

Best regards,
Thomas
