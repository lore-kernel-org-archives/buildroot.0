From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 20 Apr 2017 08:03:53 -0400
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <20170420092015.3b2f7fbd@free-electrons.com>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
 <20170420092015.3b2f7fbd@free-electrons.com>
Message-ID: <CANxTyt7Ay4c2s2xhMf7kyqWs=1dVXAz+OJu8rv-ch72Oza-=YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Apr 20, 2017 at 3:20 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 14 Apr 2017 19:00:32 +0200, Arnout Vandecappelle wrote:
>
>>  This is the correct approach I think. I think we could also do this for all the
>> other cases where we have a -> busybox dependency just because they install the
>> same apps.
>
> Yes, I'm also wondering if it isn't better to disable the Busybox
> applets (like Matt does in this patch for ncurses) rather then
> overwriting the symlinks.
>
> First of all, overwriting the symlinks means that if you "make
> busybox-reinstall", you no longer get the right thing (for sure, we
> never guarantee that partial builds/rebuilds give the correct output,
> but it's nice when they do).

Actually, I think this situation is prevented by "busybox: enable
noclobber option in install.sh",
https://git.buildroot.net/buildroot/commit/?id=802bff9c42376078f28aa49d3eab630120940eb0

But of course, the bloat factor is there regardless.

Danomi -

> And then of course, it means that there is
> code in Busybox, consuming some space, that is never used.
>
> The only annoyance that I can see is a potential blotification of
> busybox.mk, with lots of conditional for various packages.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
