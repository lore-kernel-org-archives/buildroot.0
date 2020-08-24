From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:54:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/davfs2: bump to version 1.6.0
In-Reply-To: <20200823093737.3243619-1-fontaine.fabrice@gmail.com>
References: <20200823093737.3243619-1-fontaine.fabrice@gmail.com>
Message-ID: <20200824225404.0efafc90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Aug 2020 11:37:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump is needed to fix a build failure with gcc 10:
> https://savannah.nongnu.org/support/?func=detailitem&item_id=110186#options
> 
> Here is an extratc of the bug report:
> 
> "It is not a bug to have variables with the same name in different source
> files. The bug was the missing keyword "static".
> 
> But there was a different bug that was not tolerated by GCC 10. It was
> same strange data type conversions in dav_coda.c. The resolution was to
> drop coda altogether because there is still fuse which is better suited
> anyway.
> 
> The new release 1.6.0 should fix all these problems. Please tell me if
> there are still problems with GCC 10."
> 
> Also update indentation in hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/42beafade6fd31927c8db14bc52110c0fc5b17c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied to master. I'm never really happy to apply version bumps
to master this late in the cycle.

But davfs2 is maintained with CVS, which makes it super annoying [*] to
track which specific changes between 1.5.6 and 1.6.0 fixed the gcc10
build.

And also, the changelog for 1.6.0 is just:

"""
The new release brings:

    The coda module is dropped. It would have required some serious
    maintenance. But the fuse kernel file system is better suited
    anyway. So coda is no longer required.

    The neon library from version 0.31 on has a workaround for
    SharePoint's href-bug. davfs2 can use this workaround.

    Some minor bug fixes (see the ChangeLog file).
"""

So it's not too bad. So I've applied to master.

[*] "super annoying" = "would require to dive back into how CVS works,
which is something any reasonable person on earth has long forgotten"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
