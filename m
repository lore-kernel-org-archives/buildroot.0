From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 25 Feb 2013 16:15:37 +0100
Subject: [Buildroot] force buildroot to regenerate the output/target
	directory tree
In-Reply-To: <loom.20130225T144049-821@post.gmane.org>
References: <loom.20130225T144049-821@post.gmane.org>
Message-ID: <3428566.nT0fW9ztJD@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francesco,

On Monday 25 February 2013 13:46:00 Francesco Montorsi wrote:
> Hi,
> I've been using buildroot since some time and there is a thing I didn't
> figure out yet. Consider this situation: I have a working buildroot
> environment; I have copied into the output/target folder some stuff so that
> when I run "make" buildroot generates for me images into output/images
> which already contain the contents I manually copied.
> Now I would like to "reset" the output/target folder, i.e. obtain the
> buildroot "vanilla" output/target tree and to obtian the buildroot vanilla
> output/images.... how can I do that without doing a "make clean" (which
> requires re-compilation of all packages and takes a lot of time)?
> 
> does a "rm -rf output/target && make" works?
As Thomas said, it does not work. But, some unofficial hacks exist:

  * remove build/.root will force to reinstall skeleton

  * remove build/*/.stamp_target_installed force reinstall each target package

  * depending of you toolchain, you can reinstall libc and co by removing
      # stamps/ext-toolchain-installed (external)
      # stamps/ct-ng-toolchain-installed (ctng)
      # target/lib/libc.so.0 (buildroot)

Remind, there are ton of reasons these tips could do wrong things. The only 
current official way to rebuild target is "make clean".


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
