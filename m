From: Tal Shorer <tal.shorer@gmail.com>
Date: Sat, 10 Dec 2016 20:39:50 +0200
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <20161210143119.778e63b1@free-electrons.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161210143119.778e63b1@free-electrons.com>
Message-ID: <CAFDyS3Mp5SkXG9hJwCxDnoPEK_h6Xd1B_Jp6bE6GDu0CRSnMyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 10, 2016 at 3:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  9 Dec 2016 10:37:51 +0200, Tal Shorer wrote:
>> Add usbip tools (usbip, usbipd) from the running linux source
>>
>> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
>
> Thanks for your contribution. However, since usbip tools is provided as
> part of the Linux kernel source code, it should be supported by the
> package/linux-tools/ package, which already handles similar tools (perf
> and others).
>
> However, it is true that the linux-tools infrastructure currently only
> handles tools that just need to be built/installed, and not tools that
> use autoconf/automake. So most likely, we want to extend
> package/linux-tools/linux-tools.mk? Or should we, because usbip is
> different, have a separate package?
Thanks for your reply.

I managed to compile usbip as part of linux-tools, but it's quite a
hack, doing configuration stuff in USBIP_BUILD_CMDS before actually
calling make. The other option I see is defining
LINUX_TOOLS_POST_CONFIGURE_HOOKS and doing that there, but it's still
duplicating what's already being done in pkg-autotools.

Either way, I noticed I sent a silly placeholder for the help string
in Config.in in my patch, so even if you decide to have usbip external
to linux-tools, don't apply just yet . I'll conjure a real help string
and send a v2 soon :)
