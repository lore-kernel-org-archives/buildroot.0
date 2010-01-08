From: Nicholas Walton <nwalton@aplopteng.com>
Date: Fri, 8 Jan 2010 09:24:20 -0800
Subject: [Buildroot] Compiling error with microperl
In-Reply-To: <b680c1c11001080923g4175a366icc1e37c1e8c7c2a4@mail.gmail.com>
References: <532dd5841001072305t2fed0ea0g2992e5a04ac61197@mail.gmail.com> 
	<b680c1c11001080923g4175a366icc1e37c1e8c7c2a4@mail.gmail.com>
Message-ID: <b680c1c11001080924n3e6a898bib25aab764b5a7ba6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ravi,

The most obvious question to me is, do you actually need to do native
development on your target? If not, turn off
BR2_TARGET_GENERIC_DEV_SYSTEM and only select the packages you
actually need to run on the target. Otherwise, you could edit
package/autoconf/Config.in to remove the dependency, but don't be
surprised if that breaks autoconf on the target.

Nicholas Walton

On Thu, Jan 7, 2010 at 11:05 PM, Ravi Kumar Kulkarni
<ravilinux4u@gmail.com> wrote:
>
> Hi all,
> I'm New to Embedded Linux. I was trying to compile buildroot in order
> to get a Jffs2 Image for my target . I'm getting a compile error with
> respect to microperl ?which is something below
>
> mkdir -p /media/disk-1/buildroot/buildroot-2009.08/project_build_arm/uclibc
> cp -dpRf package/config/buildroot-config
> /media/disk-1/buildroot/buildroot-2009.08/project_build_arm/uclibc/buildroot-config
> # we need to build a perl for the host just for Errno.pm
> (cd /media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8; \
> ? ? ? ? chmod a+x ext/util/make_ext; \
> ? ? ? ? ext/util/make_ext nonxs Errno MAKE="/usr/bin/make" \
> ? ? ? ?)
>
> ? ? ? ?Making Errno (nonxs)
> ext/util/make_ext: line 122: ../../miniperl: No such file or directory
> Warning: No Makefile!
> make[1]: Entering directory
> `/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
> make[1]: *** No rule to make target `config'. ?Stop.
> make[1]: Leaving directory
> `/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
> /usr/bin/make config failed, continuing anyway...
> make[1]: Entering directory
> `/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
> make[1]: *** No rule to make target `all'. ?Stop.
> make[1]: Leaving directory
> `/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/ext/Errno'
> make: *** [/media/disk-1/buildroot/buildroot-2009.08/build_arm/perl-5.8.8/.configured]
> Error 2
>
>
> ?i tried to find a option to disable to microperl since i dont want it
> at all ?and
> Unfortunately (for me) selecting the general devel install auto
> selects autoconf which in turn auto selects miniperl.
> ?how to deselect microperl from autoconf? thanks.
> warm regards,
> Ravi Kulkarni.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
