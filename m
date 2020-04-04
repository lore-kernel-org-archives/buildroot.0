From: Psychesnet Hsieh <psychesnet@gmail.com>
Date: Sat, 4 Apr 2020 14:52:46 +0800
Subject: [Buildroot] [Question] How do I build source code at source
 folder?
In-Reply-To: <CAEyMn7bt=wUY=RLDSE=QAD8F+ap5K4rRaB12Rs1SgjmOSeN_CQ@mail.gmail.com>
References: <1585904837068-0.post@n4.nabble.com>
 <CAEyMn7bt=wUY=RLDSE=QAD8F+ap5K4rRaB12Rs1SgjmOSeN_CQ@mail.gmail.com>
Message-ID: <CAF6vTZZctgOOnqcseZ5-UVGQbg2baC8Le4qazOZ2rFpdH_3tcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

Thanks and yes, I know I can use _OVERRIDE_SRCDIR to define local folder as
source.
But what I need is directly build source code at source folder without
copy/rsync.
And eventually the target object will install into output/fakeroot folder.
Do you have any idea to get it done? Thanks.

Heiko Thiery <heiko.thiery@gmail.com> ? 2020?4?3? ?? ??5:51???

> Hi Eric,
>
> Am Fr., 3. Apr. 2020 um 11:07 Uhr schrieb Eric Hsieh <psychesnet@gmail.com
> >:
> >
> > Hi everyone,
> >
> > Now, Im trying to create a special mode which can help me to build source
> > code at source folder instead of output/build folder. I checked the
> makefile
> > at package, looks like there is no directly way to be done.
> > So, I would like to ask is it possible to be done? If yes, please give me
> > some tips. Thanks.
>
> If you want to build a package from an external source folder you can
> specify the source directory by creating the  $(CONFIG_DIR)/local.mk
> file and set the <pkg>_OVERRIDE_SRCDIR varialbe. But this will
> copy/rsync your sources and build your package at output/build.
>
> Please check "8.13.6. Using Buildroot during development" in the
> buildroot user manual for more information about that.
>
> --
> Heiko
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200404/3e7c4930/attachment.html>
