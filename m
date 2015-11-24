From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Nov 2015 23:37:58 +0100
Subject: [Buildroot] Buildroot defconfigs now being built on Travis CI
In-Reply-To: <87d1uz15n2.fsf@dell.be.48ers.dk>
References: <20151123223332.3eff11d8@free-electrons.com>
 <874mgc4c6f.fsf@dell.be.48ers.dk>
 <20151124185221.16a4b432@free-electrons.com>
 <87d1uz15n2.fsf@dell.be.48ers.dk>
Message-ID: <20151124223758.GB3904@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-11-24 21:53 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> >> Is that XFS issue something we want to fix before 2015.11?
>  > I don't think we can fix it before 2015.11. The hack I've done in
>  > Travis is just what it is: a crude hack. The underlying problem is that
>  > we ask the host filesystem how many blocks are needed to store
>  > output/target/. It works fine if your host filesystem == target
>  > filesystem == ext2/3/4. And it probably works for most target
>  > filesystems, by chance. But it is clearly not correct, since the
>  > filesystem on your host may be different than the one used on your
>  > target.
> 
>  > Specifically, XFS stores small files and symlinks directly inside the
>  > inode instead of allocating a block for them. So the number of blocks
>  > needed to store output/target on the host is much smaller than what is
>  > needed on the target ext2 filesystem.
> 
> Ok :/

It's been tricky to track down...

[--SNIP--]
>  > Isn't the last 1000 lines of log already displayed in the Travis
>  > console sufficient to debug most problems anyway?
> 
> Probably it is, I just saw that you were copying them to the
> autobuilders.

Thomas did that so we could try to reproduce locally. Since it was
working on our machines, we hunted a difference on the host. And
suddenly, XFS... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
