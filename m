From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 28 Jul 2015 10:12:52 +0200
Subject: [Buildroot] [PATCH 00/13] Update Freescale packages to
	3.10.53-1.1.0_GA
In-Reply-To: <CAAMH-yuqz=JYq8Z=CuRAtzauxP3LQv4vyNGVLBpUwdB-Pt1Mjw@mail.gmail.com>
References: <CAD7j7Q-B9NAQqVHZr+uPmFTjOa5BJ-Orc3bOKFx81UHYX8Yk0Q@mail.gmail.com>
 <CAD7j7Q_sNtMoMvD5oCbGAG8zUr1tyiPEgGNQfODXxz-z2_TVdQ@mail.gmail.com>
 <CAAMH-yuqz=JYq8Z=CuRAtzauxP3LQv4vyNGVLBpUwdB-Pt1Mjw@mail.gmail.com>
Message-ID: <9103272.Gv7pRDqVQb@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary, Carlos,

On Monday 27 July 2015 19:42:08 Gary Bisson wrote:
> Hi Carlos,
> 
> On Sat, Jul 18, 2015 at 10:06 PM, Carlos Soto <csotoalonso@gmail.com> wrote:
> >
> >
> > 2015-07-18 21:55 GMT+02:00 Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com>:
> >>
> >> Dear Carlos Soto,
> >>
> >> On Sat, 18 Jul 2015 21:36:04 +0200, Carlos Soto wrote:
[...]
> >> > Anyway, they seem to work except for the fact that as soon as a program
> >> > is
> >> > stopped (mainly I've tried with glxgears) the xserver crashes. That's
> >> > the
> >> > error log:
> >>
> >> I'm adding Gary in Cc, he can probably help about this, at least
> >> confirm whether he can reproduce the same problem or not.
> >
> >
> > Great! I'll also try it again once I update my local copy
> 
> Yes I confirm I've built the master branch today and I see this error
> when closing the X app. I will let you know if I find what causes this
> error. Note that in my case it doesn't happen all the time. I suspect
> the vivante libraries...
As far as remember, by default X server terminate when the last client exit. 
When you produce problem, are you closing the last client? You can try to pass 
--noreset option when you launch X.

In add, notice glxgears is not the best program to test. Indeed Vivante driver 
does not support GLX/OpenGL API very well (it normally fallback to software 
rendering provided by mesa3d). Prefer test with a GLESv2 program.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
