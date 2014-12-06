From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Dec 2014 19:20:32 +0100
Subject: [Buildroot] [PATCH 1/3 v3] package/mke2img: new package
In-Reply-To: <7e35d73bbeb1b9e6d4cc1b1a3142fbfa4ab572d7.1417868913.git.yann.morin.1998@free.fr>
References: <cover.1417868913.git.yann.morin.1998@free.fr>
 <7e35d73bbeb1b9e6d4cc1b1a3142fbfa4ab572d7.1417868913.git.yann.morin.1998@free.fr>
Message-ID: <20141206192032.7f46d261@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Dec 2014 13:29:44 +0100, Yann E. MORIN wrote:

> This new script is highly modeled from the existing genext2fs.sh, but
> was slightly refreshed, and a new, supposedly sane set of options has
> been choosen for the features we need (see above), and some new options
> were added, too, rather than relying on the arguments order or
> environment variables:
>   -b <nb-blocks>    number of blocks in the filesystem
>   -i <nb-inodes>    number of inodes in the filesystem
>   -r <pc-reserved>  percentage of reserved blocks
> * -d <root-dir>     directory containing the root of the filesystem
> * -o <img-file>     output image file
> * -G <ext-gen>      extfs generation: 2, 3, or 4
> * -R <ext-rev>      ext2 revision: 0 or 1 (1 is assumed for ext3 and ext4)
>   -l <label>        filesystem label
>   -u <uid>          filesystem UUID; if not specified, a random one is used
> 
> * Mandatory options

What about putting this in a "help" of the mke2img tool, or at least in
the comment header at the beginning of the script?

> +    # genext2fs does not generate a UUID, but fsck will whine if one is
> +    # is missing, so we need to add a UUID.

duplicate "is".

> +    # Of course, this has to happend _before_ we run fsck.

happend -> happen

> +    # Also, some ext4 metadata are based on the UUID, so we must
> +    # set it before we can convert the filesystem to ext4.
> +    # If the user did not specify a UUID, we generate a random one.
> +    # Although a random UUID may seem bad for reproducibility, there
> +    # already are so many things that are not reproducible in a

s/already are/are already/

Other than that, looks good.

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 (on x86-64 in qemu, tested an ext4 filesystem with only the ext4
 kernel driver compiled in, and then tested an ext2 filesystem with
 only the ext2 kernel driver compiled in).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
