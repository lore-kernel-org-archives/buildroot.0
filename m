From: Nimai Mahajan <nimaim@gmail.com>
Date: Thu, 10 Sep 2015 11:56:54 +0000 (UTC)
Subject: [Buildroot] [PATCH] RFC: Adding Vagrant file for provisioning
References: <1441836107-17689-1-git-send-email-angelo.compagnucci@gmail.com>
 <55F0AF60.7030102@mind.be>
 <CA+TH9V=k=0wijd+PaZLi-Zm07EKCWHFSkO+5goQi-jDLD4V0fQ@mail.gmail.com>
 <55F13A3F.2040109@mind.be>
 <CA+TH9VkEP=QyF4qNevnPoy_f10zTM=FvTGPnWGZMdF_JPQfseQ@mail.gmail.com>
Message-ID: <loom.20150910T132603-530@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo Compagnucci <angelo.compagnucci@...> writes:

> 
> Dear Arnout Vandecappelle,
> 
> 2015-09-10 10:07 GMT+02:00 Arnout Vandecappelle <arnout@...>:
> >
> >
> > On 10-09-15 08:15, Angelo Compagnucci wrote:
> >> Dear Arnout Vandecappelle ,
> >>
> >> 2015-09-10 0:14 GMT+02:00 Arnout Vandecappelle <arnout@...>:
> >>> On 10-09-15 00:01, Angelo Compagnucci wrote:
> >>>> This patch adds a Vagrant file to buildroot. With this file
> >>>> you can provision a complete buildroot developing environment
> >>>> in minutes on all major platforms.
> >>>>
> >>>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@...>
> >>>> ---
> >>>>
> >>>> This patch is a tentative approach to add a standard and official
> >>>> Vagrant file to buildroot. With this file you can setup an isolated
> >>>> build environment based on Vagrant on all major platforms.
> >>>>
> >>>> The file is fairly basic right now, it sets up correct Ubuntu version
> >>>> to download and install required packages for buildroot.
> >>>>
> >>>> I'm open to suggestions and critics!
> >>>
> >>>  Here goes:
> >>>
> >>>  If you're already on a platform that runs vagrant, then you have
enough to run
> >>> buildroot as well, so why would you want to put it inside a VM and
double your
> >>> build time? Buildroot really really tries very hard to make sure it
runs in any
> >>> environment, so there should be no need for any of this trickery.
> >>
> >> Not true. I know of certain corporate environments in which you have
> >> to stick on windows, and usually the people working in these
> >> environment use virtual machines also if buildtime will be longer.
> >
> >  So I was wrong about Vagrant not running on Windows? Oh, now I see.
Sorry for
> > my confusion.
> >
> >  At some point I considered that we should host an official VM image.
This is a
> > lot better then, of course!
> 
> Yes, Vagrant make it simple and replicable.

We use strict configuration management practices and part of that is
automating reproducible builds. Vagrant allows doing just that (very
important use case in my opinion) so I thank you for submitting this; an
official VM image would be great for testing purposes as well. Furthermore,
you can have Vagrant automate a bunch of commands on top of just building
which introduces a lot of options.

> 
> >> IMHO with a fairly recent computer you will not notice of being inside
> >> a virtual machine.
> >
> >  Do the test. AFAIK it doubles the build time.
> 
> You can raise the core numbers and memory allocated to your vm, see
> the variable at the head of the Vagrant file. I have a quad core 4th
> generation core i7 and the build is slower, but not that much.
> 
> >> Also having buildroot on mac is not that easy, Vagrant will solve
> >> these problems brilliantly!

While our build servers are running native Linux, we use Vagrant + VMs (both
Virtualbox and VMware) at work on Macs daily as our development machines. It
works great. The past few years, performance has gotten very good and with
the recent Macbook Pro PCI-E SSDs, there is not a noticeable drop off in
performance. In fact, we also do daily builds on these machines. You just
have to make sure you have a beasty machine for it (i7, 8GB RAM minimum,
preferably SSD, etc.). This works especially well in corporate scenarios (as
mentioned) where you are required to run Windows as the host.

> >
> >  Yep, I didn't think of that either.
> >
> >  Regards,
> >  Arnout
> >
> > --
> > Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
> > Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
> > Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> >
> 
