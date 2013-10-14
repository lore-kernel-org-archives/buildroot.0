From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 09:16:09 +0200
Subject: [Buildroot] [PATCH 1/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <f6240fcb39c5dcbfe7a74cc74da3089e3c982ae5.1381705600.git.yann.morin.1998@free.fr>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
 <f6240fcb39c5dcbfe7a74cc74da3089e3c982ae5.1381705600.git.yann.morin.1998@free.fr>
Message-ID: <20131014091609.06dcc63c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 14 Oct 2013 01:11:25 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This hooks will let us instrument the build process in many ways:
>   - log current step to see what broke
>   - time each step to see what is worth optimising
>   - sanity-check installed files (rpath, overwritten files...)
>   - call user-provided script
>   - ...
> 
> The steps are fine-grain, and all have a 'start' and a 'end' hooks.
> Here is the list of available steps (19 total):
>   - extract, post-extract
>   - pre-patch, patch, post-patch
>   - pre-configure, configure, post-configure
>   - build, post-build
>   - install-host, post-install-host
>   - install-staging, post-install-staging, pkg-config-staging
>   - install-image, post-install-image
>   - install-target, post-install-target
> 
> The download, clean, uninstall steps are not instrumented on purpose.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I am not sure to follow why we're introducing additional hooks here.
Why don't we generalize the existing pre/post hooks mechanism to *all*
steps (by all I mean the steps you are interested in instrumenting),
and use that to hook the different things you introduce in patch 2, 3,
4 ?

Also, do we really need to have hook points for the pre-hooks and
post-hooks each time?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
