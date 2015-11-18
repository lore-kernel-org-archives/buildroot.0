From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:21:11 +0100
Subject: [Buildroot] [RFC] wine: Bump to 1.8
In-Reply-To: <564CE703.2070706@dawncrow.de>
References: <564CE703.2070706@dawncrow.de>
Message-ID: <20151118222111.06e1de92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Wed, 18 Nov 2015 22:00:51 +0100, Andr? Hentschel wrote:

> In a couple of weeks Wine 1.8 will be released, 1.7.55 was the last 1.7.x version.
> To prepare for the version jump of two years, I want to make sure early if i do something wrong.
> So a quick overlook over the patch would be nice.
> What about moving the patches around like I do? 0003->0001?
> Note that this patches is missing a hash file, will be added back later

The patch looks good to me, there is nothing really complicated in
there. Just a few comments:

 * Use 'git format-patch -M' to enable rename detection, so that the
   renaming of the patches is detected, and instead of seeing a
   complete file being removed, and a complete file being added, we see
   a rename.

 * In your commit log, please explain what is happening: which patches
   are dropped and why, which changes are made to the package other
   than bumping the version.

Of course, don't forget your SoB in the commit log as well.

Last suggestion: can you submit the SANE_CONFIG patch upstream, so that
hopefully they merge it before the 1.8 release, and we can have zero
patches for the wine package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
