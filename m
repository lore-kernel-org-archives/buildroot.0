From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Jul 2015 21:15:27 -0400
Subject: [Buildroot] [PATCH v2 0/3] util-linux: rework utilities menu
 for finer control
In-Reply-To: <20150712003128.68c1964c@free-electrons.com>
References: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
 <20150712003128.68c1964c@free-electrons.com>
Message-ID: <CANxTyt5yJ6=862YBg1JJQmiSKEXYHnP-DDtFBzgxPucxOjJRzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 11, 2015 at 6:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Danomi Manchego,
>
> On Sat, 11 Jul 2015 18:09:58 -0400, Danomi Manchego wrote:
>> This series changes the util-linux tool setup to support more scenarios.
>
> Thanks. util-linux definitely needs some love. However, can you comment
> on backward compatibility in terms of Config.in option? I.e, what
> happens if a Buildroot user has an existing .config which uses
> util-linux, and upgrades Buildroot to a version that contains your
> patches. What will happen?
>
> In any case, your patch 2/3 is removing
> BR2_PACKAGE_UTIL_LINUX_BINARIES, so you should update Config.in.legacy
> accordingly.

With the series as sent, it looks like the new config would cause a
defconfig with tools selected to go to having no tools selected.  So,
not so good.

I can add a legacy option with the help indicating that the "custom"
choice must be selected (like some of the lua legacy options).  But -
we can actually preserve backwards-compatibility if I change
BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES to match the previous
BR2_PACKAGE_UTIL_LINUX_BINARIES ("BINARIES" vs the other choices
"ALL_BINARIES" and "NO_BINARIES").  Its not what one would do when
coding from scratch, but it avoids needing to add the legacy option.

(We could even claim perfect backwards compatibility if we enable the
"basic set" of tools by default, though it seems like changing that
particular default is not a priority for anyone.)

Any objection to reusing the old config name?

Danomi -

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
