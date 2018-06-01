From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 1 Jun 2018 10:13:56 +0000
Subject: [Buildroot] [arc-buildroot] snps_archs38_hsdk_defconfig fails
 to build
In-Reply-To: <20180601112008.05171019@windsurf>
References: <20180601112008.05171019@windsurf>
Message-ID: <9aac68795624d5d0c785e9039e64147554ae2f40.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2018-06-01 at 11:20 +0200, Thomas Petazzoni wrote:
> Hello ARC Maintainers,
> 
> The snps_archs38_hsdk_defconfig fails to build in the master branch.
> See the log at:
> 
>   https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_buildroot.org_buildroot_-2D_jobs_71727022&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74r
> KOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=v-IUwcSvja4Y9JWwF8Cl2kmhg_NWZccI7bTCk1aIGLY&s=aGScLUTXH9MKxcsln3Nvd6jhd-0pgHGgi2sKbMLNUdA&e=
> 
> Could you look into this and provide a patch to fix this problem ?

So indeed that problem happens with newer GCC and we have a fix for that
in the kernel since v4.15, see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=79435ac78d160e4c245544d457850a56f805ac0d

> Perhaps it is fixed by
> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.buildroot.org_buildroot_commit_configs-3Fh-3Dnext-26id-3D63bf9e71d6153f5a8e73e191cff8ff39f4
> 09026b&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=v-
> IUwcSvja4Y9JWwF8Cl2kmhg_NWZccI7bTCk1aIGLY&s=E57p1GTPhH9rlFCuAjINxo8UxnUEouAW9R8KbSDQj94&e=
> which is just in next ?

Right that update definitely fixes the problem.
But if you want a cleaner solution we may just bump Linux kernel version to v4.14.13
where this fix was backported or maybe even v4.14.47 which is the most recent release
of 4.14 series.

Let me know what is your preference and we'll act accordingly.

-Alexey
