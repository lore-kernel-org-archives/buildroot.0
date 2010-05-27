From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Fri, 28 May 2010 07:32:12 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released uClibc 0.9.30.1
 patches missing ?
In-Reply-To: <201005272319.54338.yann.morin.1998@anciens.enib.fr>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1274994677.436.2.camel@ubuntu>
	<201005272319.54338.yann.morin.1998@anciens.enib.fr>
Message-ID: <1274995932.436.9.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bonjour Yann, tout le monde,

On Thu, 2010-05-27 at 23:19 +0200, Yann E. MORIN wrote:
> Kris, All,
> 
> On Thursday 27 May 2010 23:11:17 Microbit_Ubuntu wrote:
> > I don;t know if I'm off base here, but I notice that rc3 does not have
> > the patches for uClibc 0.9.30.1 at toolchain/uClibc folder in the
> > tarball ?????
> 
> Indeed, that because the 0.9.30.x that is used is .3, and .1 is not present
> in the version choice, in the menuconfig. See:
>   toolchain/uClibc/Config.in at 40
> 
> Regards,
> Yann E. MORIN.
> 

Thanks for reviewing.
This might have sounded like a dumb question - as of course uClibc was
compiled by ct-ng...
I haven't yet compiled BR, am about to though. I saw uClibc 0.1.29
patches, so I thought "where's 0.9.30.1 ??".

I mean, if 0.9.30.3 is used, why bother with 0.9.29 patches ???
Oh well, false alarm in any case !!

The *biggest* problem so far I had was the fact that ct-ng-1.6.1 patches
uClibc 0.9.30.1 BUT does NOT apply the ARM sysdep patch.
I kept getting "invalid module format" on my target. A rebuild with
(indeed) "new" linuxthreads enabled in uClibc of the x-tools toolchain
fixed it after manually applying the sysdeps patch !!

I'll still reply to your other post as well.

Au revoir,
Kris
