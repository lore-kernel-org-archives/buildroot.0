From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 May 2014 21:18:24 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: use the branch name
 instead of the sha1 for the linux kernel
In-Reply-To: <1399034711-12550-1-git-send-email-yann.morin.1998@free.fr>
References: <1399034711-12550-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140502191824.GA7817@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-05-02 14:45 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Previously, when we were using the rpi-3.10.y branch, we coiuld use a sha1 to
> refer to a specific changeset, and that would work and give reproducible
> builds, thanks to upstream merging linux-stable into their branch.
> 
> Now they have declared rpi-3.12.y the new stable branch, and deprecated the
> rpi-3.10.y branch.
> 
> Unfortunately, they are now rebasing the rpi-3.12.y branch instead of merging
> linux-stable as they used to do. This means we can no longer use a sha1 as the
> tree will change as soon as upstream rebases onto a new linux-stable.
> 
> There are two possibilities here:
>   - revert back to using a rpi-3.10.y cset
>   - use the rpi-3.12.y branch name
> 
> This patch goes with the second option, since rpi-3.10.y is no longer maitained,
> and we prefer to use a stable branch, at the cost of reproducible builds.
> 
> Reported-by: Jeremy Rosen <jeremy.rosen@openwide.fr>
> Signed-off-by: yann.morin.1998 at free.fr
> Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>
> 
> ---
> Note: before the next release, we should revisit this, and if upstream has
> not switched to merging over rebasing, then we will just revert to using
> the latest cset from the rpi-3.10.y branch for the release.

OK, upstream has agreed to merge the stable branch:
    https://github.com/raspberrypi/linux/issues/584#issuecomment-42057891

So, I'll send an updated patch to use the latest cset instead of the
branch name.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
