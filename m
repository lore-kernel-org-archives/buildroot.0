From: Julian Scheel <julian@jusst.de>
Date: Sun, 18 Oct 2015 22:13:38 +0200
Subject: [Buildroot] [PATCH v2 2/2] dvblast: new package
In-Reply-To: <20151018160612.1bb09b23@free-electrons.com>
References: <1445171651-28330-1-git-send-email-julian@jusst.de>
 <1445171651-28330-2-git-send-email-julian@jusst.de>
 <20151018160612.1bb09b23@free-electrons.com>
Message-ID: <5623FD72.9010306@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 18.10.15 16:06, Thomas Petazzoni wrote:
>> Address review comments by Yann E. Morin (thanks for review!)
>> - Complete license information
>> - Remove explicit INSTALL_STAGING=no
>
> You should have also removed INSTALL_TARGET = YES, because that's the
> default.

Ack, makes sense.

>> - Fix install command
>>
>> The build cmd is not changed to use TARGET_CONFIGURE_OPTS as it breaks the
>> build.
>
> A working solution is to pass TARGET_CONFIGURE_OPTS in the environment
> of make instead of as an option. This ensures that the CFLAGS += in the
> dvblast Makefile are still taken into account.

Ah, thanks, good to know. I'll keep it in mind.

> So, I've applied you patch, with the following changes:
>
>      [Thomas:
>       - add missing hash file.

Nice, I actually hadn't even realized that buildroot has hash files so 
far :)

>       - rewrap Config.in help text
>       - remove unneeded "DVBLAST_INSTALL_TARGET = YES", since this is the
>         default behavior
>       - pass TARGET_MAKE_ENV in the environment when calling make.
>       - use TARGET_CONFIGURE_OPTS instead of just CC/LD.]
>
> Thanks a lot!

Thanks for applying.

-Julian
