From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 13 May 2016 14:39:23 -0600
Subject: [Buildroot] SDL2_ttf requires libpng12 but Buildroot installs
	libpng16
In-Reply-To: <20160512234548.20d6cd28@free-electrons.com>
References: <CAGrGpJB1XFuZWdXS7rWeaA9E7N2yzde8JuSp_A8KjU2vD6h_VA@mail.gmail.com>
 <20160512234548.20d6cd28@free-electrons.com>
Message-ID: <CAGrGpJANYGqcDrpsP_YXp_UrUAr-HP7ONbykBrT713K+J1JisA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
The  answer is that I was unaware of the Buildroot autotools capability.
Without really searching, I assumed if something was not already in
Buildroot, I had to add it manually.    I have re-examined the Buildroot
users manual
     https://*buildroot*.org/manual.html
and the Free Electrons notes
     http://free-electrons.com/~thomas/buildroot/manual/html/ch11.html
and it seems like a much better way to do it and is something within my
capability.

Having said that,  I learned a lot doing things manually even though it was
extremely frustrating and took me a very long time.    I almost gave up a
couple of times.    The help I got from you guys was super - and really
encouraging.

Thanks
Peter


On Thu, May 12, 2016 at 3:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 12 May 2016 13:05:56 -0600, Peter Thompson wrote:
>
> > Below are my personal notes on how I compiled the SDL2 suite  -   in the
> > hopes it is helpful to someone else.   pmtstaging is a copy of the
> > buildroot sysroot which I wanted to keep pristine during this process.
> >
> > I will try to convert these  notes into a buildroot patch and submit it -
> > making life much easier in the future.
>
> Quick question that might sound silly, but I believe worth asking: why
> are you taking this terribly complicated path to build SDL2_ttf
> manually, rather than creating a Buildroot package directly?
>
> The Buildroot autotools package infrastructure already handles most of
> the cross-compilation problems by itself. So all this terrible dance of
> CFLAGS and LDFLAGS, copying of sysroot and stuff that you're doing
> would have been completely unneeded if you had done a Buildroot package
> from the beginning.
>
> It seems to me like you've wasted a huge amount of time :-/
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160513/785cc619/attachment.html>
