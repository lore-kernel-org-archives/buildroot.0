From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:52:04 +0200
Subject: [Buildroot] Patchwork cleanup, 10 patches to look at
In-Reply-To: <20170326235320.448e802a@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
Message-ID: <20170401185204.60a79acc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Quick update on where we stand.

On Sun, 26 Mar 2017 23:53:20 +0200, Thomas Petazzoni wrote:

>  * avahi: link with libintl if libglib2 is enabled
>    https://patchwork.ozlabs.org/patch/683732/
> 
>    My plan is to enable the stub libintl in uClibc-ng and stop having
>    all those linking issues with libintl from gettext. The only
>    drawback would be that there would no longer be "translation"
>    support with uClibc: the libintl implementation in uClibc-ng is
>    really just a stub.
> 
>    Thoughts ?

No real solution provided. A discussion started with Arnout, but no
conclusion at this point.

>  * qemu: allow to build statically
>    https://patchwork.ozlabs.org/patch/692667/
> 
>    We normally don't want to have special options for each package to
>    build them statically. Should we make an exception for Qemu?

Following Arnout's suggestion, this patch was accepted and merged.

>  * infra: fix 'packages-file-list.txt' with TLP
>    https://patchwork.ozlabs.org/patch/694519/
>
>    Adds a lock around the installation step of packages, to make
>    top-level parallel build still generate a correct list of files per
>    package.
> 
>    Gustavo, what is your plan regarding this?
> 
>    Others: should we merge this?

Following discussion with Arnout, this patch was rejected.

>  * e2fsprogs: keep util-linux's fsck if chosen
>    https://patchwork.ozlabs.org/patch/696634/
> 
>    This fixes a real bug, but even Maxime who submitted the patch is
>    not too happy with the proposal. Could someone look into this?

No progress.

>  * linux-headers: Account for LINUX_OVERRIDE_SRCDIR
>    https://patchwork.ozlabs.org/patch/713927/
> 
>    I think I am against this patch, because if the user sets
>    LINUX_OVERRIDE_SRCDIR, then suddenly he will see his kernel headers
>    being rebuilt as well.
> 
>    Arnout ?

Following discussion with Arnout, this patch was rejected.

>  * python-lxml: allow build as host package
>    https://patchwork.ozlabs.org/patch/722644/
> 
>    Host package not used anywhere. Discussed at length during the
>    previous BR meeting. What do we do?

Following discussion with Arnout, this patch was accepted after adding
a Config.in.host file.

>  * fakedate: simplify logic
>    https://patchwork.ozlabs.org/patch/725396/

No progress.

>  * linux-tools/perf: fix build for MIPS by using the right emulation on
>    LD
>    https://patchwork.ozlabs.org/patch/729154/

No progress.

>  * package/pkg-download.mk: add gitlab helper
>    https://patchwork.ozlabs.org/patch/736382/
> 
>  * linux: Add CIP SLTS easy selection option
>    https://patchwork.ozlabs.org/patch/736383/

Patches marked as Changes Requested, with feedback given to the
submitter.

Temporary results:

 - 6 patches on which a decision was taken, and therefore the patches
   are no longer in patchwork

 - 4 patches still pending a decision

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
