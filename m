From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 21 Mar 2012 11:05:10 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to
 apply patches in proper order
In-Reply-To: <87k42e5nt8.fsf@macbook.be.48ers.dk>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <1331739237-29872-7-git-send-email-ludovic.desroches@atmel.com>
 <871uomkh2d.fsf@macbook.be.48ers.dk>
 <20120321082335.GH11834@ldesroches-Latitude-E6320>
 <87k42e5nt8.fsf@macbook.be.48ers.dk>
Message-ID: <20120321100510.GK11834@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 21, 2012 at 10:02:43AM +0100, Peter Korsgaard wrote:
> >>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@atmel.com> writes:
> 
>  Ludovic> Thanks to take this set of patches.
> 
> I'm afraid I'll have to revert patch 5+6 unless we can fix it up though,
> as the tarball change broke the build for (atleast) liblockfile:
> 
> http://buildroot.humanoidz.org/results/cf2f653df3e083b75d3f8d0f4020a68100588d2d/build-end.log
> 
> The patch tarball contains:
> 
> .
> ??? debian
>     ??? changelog
>     ??? control
>     ??? patches
>     ??? ??? 02-COPYRIGHT.patch
>     ??? ??? 04-505851-remove-debug-code.patch
>     ??? ??? 06-493462-dotlockfile.1.patch
>     ??? ??? 07-493462-dotlockfile.c.patch
>     ??? ??? 09-562937-make-ar-overwrittable.patch
>     ??? ??? series
>     ??? postinst
>     ??? postinst.nfs
>     ??? postrm
>     ??? prerm.nfs
>     ??? rules
>     ??? shlibs
>     ??? shlibs.nfslock
>     ??? source
>         ??? format
>         ??? options
> 

I was afraid by this kind of tarball. Nightmare becomes real!

> I guess it worked more by accident than anything else before, but I
> think we should atleast ensure we only apply files matching
> *.{patch,diff} inside the tarballs.
> 
> I don't have a problem with having to add a specific post-patch hook for
> liblockfile similar to E.G. argus, but we need to get it to work.
> 
> Care to have a look?

I will have a look o this issue

Regards

Ludovic
