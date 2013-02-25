From: Francesco Montorsi <francesco.montorsi@gmail.com>
Date: Mon, 25 Feb 2013 20:02:32 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?force_buildroot_to_regenerate_the_output/ta?=
	=?utf-8?q?rget=09directory_tree?=
References: <loom.20130225T144049-821@post.gmane.org>
 <3428566.nT0fW9ztJD@sagittae>
Message-ID: <loom.20130225T210005-949@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me Pouiller <jezz@...> writes:
> > does a "rm -rf output/target && make" works?
> As Thomas said, it does not work. But, some unofficial hacks exist:
> 
>   * remove build/.root will force to reinstall skeleton
> 
>   * remove build/*/.stamp_target_installed force reinstall each target package
> 
>   * depending of you toolchain, you can reinstall libc and co by removing
>       # stamps/ext-toolchain-installed (external)
>       # stamps/ct-ng-toolchain-installed (ctng)
>       # target/lib/libc.so.0 (buildroot)
> 
> Remind, there are ton of reasons these tips could do wrong things. The only 
> current official way to rebuild target is "make clean".
> 
Thanks!
I will test this approach next time, after doing a backup copy :)

Anyway I think it would be nice to have an additional target in the buildroot 
Makefile which does the operations above (with possible additional quirks) :)

Francesco
