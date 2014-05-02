From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 May 2014 15:12:05 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: use the branch name
 instead of the sha1 for the linux kernel
In-Reply-To: <874n18pbrv.fsf@dell.be.48ers.dk>
References: <1399034711-12550-1-git-send-email-yann.morin.1998@free.fr>
 <874n18pbrv.fsf@dell.be.48ers.dk>
Message-ID: <20140502131205.GC3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-05-02 15:09 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Previously, when we were using the rpi-3.10.y branch, we coiuld use a sha1 to
>  > refer to a specific changeset, and that would work and give reproducible
>  > builds, thanks to upstream merging linux-stable into their branch.
> 
>  > Now they have declared rpi-3.12.y the new stable branch, and deprecated the
>  > rpi-3.10.y branch.
> 
>  > Unfortunately, they are now rebasing the rpi-3.12.y branch instead of merging
>  > linux-stable as they used to do. This means we can no longer use a sha1 as the
>  > tree will change as soon as upstream rebases onto a new linux-stable.
> 
>  > There are two possibilities here:
>  >   - revert back to using a rpi-3.10.y cset
>  >   - use the rpi-3.12.y branch name
> 
>  > This patch goes with the second option, since rpi-3.10.y is no longer maitained,
>  > and we prefer to use a stable branch, at the cost of reproducible builds.
> 
> Hmm, but that means that the builds are not reproducable :/

Indeed, that's a drawback.

> Can't we convince them to create a new branch whenever they rebase or
> something like that?

Already done:
    https://github.com/raspberrypi/linux/issues/584

I forgot to add this in my commit log. Can you do that before you apply,
please, or do you want me to re-submit?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
