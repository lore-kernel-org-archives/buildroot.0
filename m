From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Aug 2012 13:26:23 +0200
Subject: [Buildroot] Announcement: availability of autobuilder toolchains
In-Reply-To: <20120826094518.0f0be0fc@skate> (Thomas Petazzoni's message of
 "Sun, 26 Aug 2012 09:45:18 +0200")
References: <20120825110931.5acc6645@skate>
 <87a9xjqodw.fsf@macbook.be.48ers.dk> <20120826094518.0f0be0fc@skate>
Message-ID: <87k3wlq4gw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Thanks, added to
 Thomas> http://autobuild.buildroot.org/toolchains/configs/gcc10/toolchain.config.

Great.

 Thomas> However note that I haven't see build results coming from gcc10 since
 Thomas> about two days.

Thanks. It was stuck in midori configuration (python waf?). Perhaps
because gcc10 uses python 2.5.


 >> gcc14 toolchain config is:
 >> BR2_powerpc=y
 >> BR2_powerpc_603e=y
 >> BR2_HOST_DIR="/home/peko/br/ppc603e-wl6"
 >> BR2_JLEVEL=8
 >> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 >> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
 >> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

 Thomas> Is this running on a x86/x86-64 machine? If so, then what we
 Thomas> need to do is generate a tarball from the toolchain you have in
 Thomas> /home/peko/br/ppc603e-wl6/, and then use this tarball as the
 Thomas> external toolchain instead of making a reference to this local
 Thomas> directory. This will allow everyone to reproduce the build.

 Thomas> Would you agree to do this?

Yes, x86-64. I'll take a look at your instructions and set it up.


 >> gcc110 toolchain config is:
 >> BR2_x86_i686=y
 >> BR2_HOST_DIR="/home/peko/br/i686-wchar"
 >> BR2_JLEVEL=8
 >> BR2_PTHREAD_DEBUG=y
 >> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 >> 
 >> But notice that this is a power7 machine, so an x86 toolchain won't work.

 Thomas> Argh. Then what can we do to allow other people to reproduce
 Thomas> the build?  I agree that doing a build targeting x86 on a !x86
 Thomas> machine is really an interesting test, so I'd like to keep
 Thomas> it. Or maybe we just say that the build results from this
 Thomas> machine cannot easily be reproduced by others and we live with
 Thomas> it?

I think we can just document the toolchain config for this one and not
archive the toolchain.

-- 
Bye, Peter Korsgaard
