From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 09:46:02 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
In-Reply-To: <521F6E9C.6070703@mind.be>
References: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <521534E2.7020606@mind.be> <20130822232633.7ba9b14d@skate>
 <52169E42.2040904@mind.be> <20130823064845.2ec4800d@skate>
 <521E5AB7.1050702@mind.be> <20130829093809.75fe7e76@skate>
 <521F6E9C.6070703@mind.be>
Message-ID: <20130830094602.6b06926e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 17:54:04 +0200, Arnout Vandecappelle wrote:

> > Generally, 'make source' is unfortunately a bit broken with the new
> > internal toolchain backend based on packages. One of the reason is that
> > the 'make source' thing only works for one recursion level of
> > dependencies on host packages. I've started working on fixing that, but
> > it was more complex than I thought (or alternatively I was too stupid
> > to see that there was a simple solution).
> 
>   Probably requires an pkg-generic change, like:
> 
> $(2)-all-source: $(2)-source $(suffix -source,$($(2)_DEPENDENCIES))

Hum, right. I'll try to find some time to investigate that.

> >>> But I guess I
> >>> can probably make BR2_TOOLCHAIN_BUILDROOT_LIBC be equal to "glibc" in
> >>> both the glibc and eglibc case, which would be sufficient to make the
> >>> toolchain building logic use the "glibc" and "glibc-configure" targets
> >>> for both the eglibc and glibc selections.
> >>
> >>    You could also choose to keep eglibc.mk and make glibc the derivative.
> >> Or would that be strange?
> >
> > Have you seen my new patch set:
> 
>   Sorry, I thought I had checked before sending but obviously my search 
> wasn't good enough.

No problem. I guess you'll continue the review over here :)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
