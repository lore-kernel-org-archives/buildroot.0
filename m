From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 4 Nov 2013 13:41:28 -0600
Subject: [Buildroot] Speeding up builds
In-Reply-To: <5d58cf72-cd29-4f75-b348-4b59b4941a2f@email.android.com>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
 <5d58cf72-cd29-4f75-b348-4b59b4941a2f@email.android.com>
Message-ID: <CAE9DZUTgeeZTveEYUdHrDwpEP_iqqcd=JrPp6qWaVP_Huti3_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

It's BR2_JLEVEL=0, and I have confirmed that when make is invoked it is -j
16  (8 cores X 2) on my build system.

I have tried ccache, ran into problems, and ended up aborting.  I may pick
up that effort again.

My focus right now is reducing the build time for a fresh clean build with
no caching or exisiting object files.

That's a bummer about the configure steps being serialized.  I have
observed this as well.

Thanks,

Dallas


On Mon, Nov 4, 2013 at 1:06 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Dallas,
>
> Dallas Clement <dallas.a.clement@gmail.com> wrote:
> >Hi All,
> >
> >I'm just looking for some tips on how to speed up my build times.  My
> >rootfs contains many packages with lots of dependencies.  Even with 8 fast
> >Xeon cores, 64GB of RAM, SSDs, and SAS drives, my builds are taking 1 hour
> >and 50 minutes.
> >
> >When I observe CPU utilization with htop, I rarely see more than one CPU
> >core getting worked hard.  Occasionally, I will see all 8 cores maxed at
> >100%.
> >
> >make -j 16 seems to make little difference.
> >
> >What can I do to get all my CPU cores working all the time?
>
> What is the value of BR2_JLEVEL in your .config?
> And have you tried enabling ccache?
>
> What takes a significant amount of time are the configure steps of all
> packages, which are not parallelized.
>
> Best regards,
> Thomas
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131104/4a235859/attachment.html>
