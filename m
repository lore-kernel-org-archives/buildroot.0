From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 10:40:02 +0100
Subject: [Buildroot] Rework musl fix patches
In-Reply-To: <20160221235940.0b4d71ec@free-electrons.com>
References: <20160221235940.0b4d71ec@free-electrons.com>
Message-ID: <20160301104002.00d32dcb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

I am getting back to you about the below e-mail regarding musl fixes.
Do you think you would have some time to look into this? Or should we
try to spread the workload of cleaning up those musl fixes between
other Buildroot contributors?

Best regards,

Thomas

On Sun, 21 Feb 2016 23:59:40 +0100, Thomas Petazzoni wrote:
> Hello Bernd,
> 
> Your effort to fix musl build issues of a large number of packages is
> very very appreciated. Your latest submissions on the matter have been
> very good, with detailed descriptions, Git formatted patches and
> submission of the resulting fixes to the respective upstream projects.
> 
> However, a number of your older patches were still pending in
> patchwork, and do not comply with those requirements. Most of them
> simply borrow a patch from Alpine Linux, OpenEmbedded or OpenWRT, even
> when the patch fixes tons of unrelated things and the explanations are
> poor. Buildroot has higher requirements than Alpine Linux, OE or
> OpenWRT in terms of patch quality and upstream submission.
> 
> Would it be possible to rework those patches, to make sure that:
> 
>  - For a given package, each musl issue gets fixed by a separate patch
>    in package/<pkg>/.
> 
>  - Those patches should not be just "fix musl build", but instead a
>    real explanation of what the patch is doing, and how it is not a
>    fix that is musl specific, but a general fix (general for standard
>    conformance, or missing header inclusion, etc.). A detailed
>    description for each patch is needed.
> 
>  - Those patches should be formatted with Git when the upstream
>    project uses Git.
> 
>  - When the upstream project is active, those patches should be
>    submitted upstream.
> 
> Here are a few examples of problematic patches:
> 
>  * package/pppd: fix musl build
> 
>    A single patch that fixes tons of different issues, with no
>    explanation, and code being commented out instead of removed.
> 
>  * package/monit: Fix musl build
> 
>    No explanation why setting GLOB_ONLYDIR to 0 is safe. Yes,
>    GLOB_ONLYDIR is an optimization, but the monit code doesn't check
>    if the results are directories. It seems to be safe nonetheless
>    because the glob being tested is /proc/[0-9]*, which will probably
>    only return directories. All those assumptions should be
>    explained. Right now, the reviewers of your patches have to do a
>    significant investigation work to verify if the patch is correct or
>    not.
> 
> Consequently, I have marked the following musl fixes from you as
> Changes Requested:
> 
>     http://patchwork.ozlabs.org/patch/576240/
>     http://patchwork.ozlabs.org/patch/573519/
>     http://patchwork.ozlabs.org/patch/573517/
>     http://patchwork.ozlabs.org/patch/572316/
>     http://patchwork.ozlabs.org/patch/572303/
>     http://patchwork.ozlabs.org/patch/572304/
>     http://patchwork.ozlabs.org/patch/572245/
>     http://patchwork.ozlabs.org/patch/572242/
>     http://patchwork.ozlabs.org/patch/572241/
>     http://patchwork.ozlabs.org/patch/572240/
>     http://patchwork.ozlabs.org/patch/572210/
>     http://patchwork.ozlabs.org/patch/572208/
>     http://patchwork.ozlabs.org/patch/572204/
>     http://patchwork.ozlabs.org/patch/572200/
>     http://patchwork.ozlabs.org/patch/572196/
>     http://patchwork.ozlabs.org/patch/572195/
>     http://patchwork.ozlabs.org/patch/572192/
>     http://patchwork.ozlabs.org/patch/572189/
>     http://patchwork.ozlabs.org/patch/572183/
>     http://patchwork.ozlabs.org/patch/572156/
>     http://patchwork.ozlabs.org/patch/572154/
>     http://patchwork.ozlabs.org/patch/572127/
>     http://patchwork.ozlabs.org/patch/572125/
>     http://patchwork.ozlabs.org/patch/572109/
>     http://patchwork.ozlabs.org/patch/572102/
>     http://patchwork.ozlabs.org/patch/572101/
>     http://patchwork.ozlabs.org/patch/572099/
>     http://patchwork.ozlabs.org/patch/572096/
> 
> If you could find the time to rework them as suggested above and
> submit them again, it would be great!
> 
> Thanks a lot for this effort!
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
