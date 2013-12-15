From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Dec 2013 23:48:51 +0100
Subject: [Buildroot] [PATCH] manual: add section about dealing
 efficiently with big image files
In-Reply-To: <87ppoxu4cc.fsf@dell.be.48ers.dk>
References: <1387133792-32363-1-git-send-email-yann.morin.1998@free.fr>
 <87k3f5vqio.fsf@dell.be.48ers.dk> <20131215222521.GB3463@free.fr>
 <87ppoxu4cc.fsf@dell.be.48ers.dk>
Message-ID: <20131215224851.GC3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-12-15 23:38 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> I think that you should be using bigger block sizes, tools that
>  >> understand the filesystem layout or resize afterwards (E.G. resize2fs)
>  >> instead.
> 
>  > Not sure I follow you on that one. What if the user enters a large
>  > number of blocks for his ext2 filesystem? Those will be empty
>  > (zero-filled), but the image file will not be made sparse. So there is
>  > no 'fs resize' or such in the process.
> 
> What I meant was simply that if you want to end up with a filesystem
> with lots of free space and don't want to waste time writing zeroes to
> the unused areas, it is safer to:
> 
>  - create the filesystem spanning the entire partition yourself on the
>    fly (mkfs + tar xf output/images/rootfs.tar)
> 
>  - or resize fs to the full partition size after writing the image
>    (dd if=output/images/rootfs.ext2 + resize2fs)

I see, but in that case, we should no offer the user the ability to
specify the number of blocks to use for the ext2 filesystem, with
BR2_TARGET_ROOTFS_EXT2_BLOCKS, for example (and ext2 if the only
writable filesystem for which we do it).

Should I cook up a patch to remove BR2_TARGET_ROOTFS_EXT2_BLOCKS?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
