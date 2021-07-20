From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Tue, 20 Jul 2021 09:21:00 +0300
Subject: [Buildroot] [SOLVED] Re: Question Linux-Module infrastructure
In-Reply-To: <d86c56879ede4cf090f30bac7364429f@umbiko.net>
References: <mailman.9992.1626731586.223516.buildroot@busybox.net>
 <d86c56879ede4cf090f30bac7364429f@umbiko.net>
Message-ID: <CACaKL1x0NeWs0h7yf7OJOP9X=fVi6WCQo+ZctQ9i3n9faRfonw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andreas,

Great, this wolves my problem.
Actually i was not too sure this SUBDIRS stuf was for .... now i got it :)

Thanks,
Jacques

On Tue, Jul 20, 2021 at 8:03 AM Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Jacques,
>
> On 2021-07-19 21:53, Jacques Samoun <jacques.samoun33@gmail.com> wrote:
>
> > Hello,
> >
> > I am using external tree build in my project. Trying to add a linux
> > kernel
> > driver that i am developing.
> > My problem is that, the sources of my driver are not flat but arranged,
> > for
> > various reasons in the following manner:
> > <mydriver>
> >                <some files>
> >                <top makefile>
> >               +--- inc
> >                    <shared includes>
> >               +--- user
> >                      <files>
> >                       <Makefile>
> >               +--- kernel
> >                        <files>
> >                        <Makefile>
> >
> > My hal.mk is  (hal is the name of the package)
> >
> > HAL_VERSION = 1.0.0
> > HAL_SITE =  ../top/source/hal
> > HAL_SITE_METHOD = local
>
> You probably just need a statement to point the kernel build to the
> correct subdirectory:
>
> HAL_MODULE_SUBDIRS = kernel
>
> Kind regards,
> Andreas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210720/f6233b6f/attachment-0001.html>
