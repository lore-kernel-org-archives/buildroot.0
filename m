From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Thu, 19 Sep 2019 12:38:32 -0400
Subject: [Buildroot] Buildroot ts4800_defconfig no longer builds
In-Reply-To: <20190810105411.42aa7518@windsurf.home>
References: <20190810105411.42aa7518@windsurf.home>
Message-ID: <20190919123832.GD7701@t480s.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 10 Aug 2019 10:54:11 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Patrick,
> 
> The ts4800_defconfig you have contributed to Buildroot no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139300
> 
> The error is not visible directly in the Gitlab CI output, but
> inspecting the full build log reveals this:
> 
> /tmp/cceWXtEN.s: Assembler messages:
> /tmp/cceWXtEN.s:869: Error: .err encountered
> /tmp/cceWXtEN.s:908: Error: .err encountered
> /tmp/cceWXtEN.s:964: Error: .err encountered
> /tmp/cceWXtEN.s:1114: Error: .err encountered
> /tmp/cceWXtEN.s:1294: Error: .err encountered
>   CC      fs/ext4/namei.o
> /tmp/cceWXtEN.s:3832: Error: .err encountered
>   CC      fs/ext2/xattr.o
>   LD      fs/debugfs/debugfs.o
>   CC      fs/jffs2/compr.o
>   LD      fs/debugfs/built-in.o
>   CC      fs/kernfs/mount.o
>   CC      fs/lockd/clntlock.o
>   CC      fs/ext2/xattr_user.o
>   CC      fs/jbd2/commit.o
>   CC      fs/nfs/client.o
>   CC      fs/jbd2/recovery.o
> scripts/Makefile.build:291: recipe for target 'fs/fat/dir.o' failed
> make[3]: *** [fs/fat/dir.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> 
> This happens because we updated our default gcc version to gcc 8.x, and
> the kernel you're using is too old and doesn't have fixes to work with
> gcc 8.x. Could you update to a newer kernel version ?
> 
> Also, could you send a patch adding yourself as a maintainer for this
> defconfig in our DEVELOPERS file ?

I'm updating Patrick's email and copying Damien as well, as he might be
aware of this build issue.


Thanks,

	Vivien
