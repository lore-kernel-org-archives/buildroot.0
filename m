From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jun 2012 11:32:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-20
In-Reply-To: <87ipelqccc.fsf@macbook.be.48ers.dk>
References: <20120621063115.B05E852CEBE@lolut.humanoidz.org>
 <87ipelqccc.fsf@macbook.be.48ers.dk>
Message-ID: <20120621113207.616a649e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 21 Jun 2012 10:49:07 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> On 2012-06-20, 77 random build tests have been done and
>  Thomas> submitted on autobuild.buildroot.net.
>  Thomas>  68 builds have been successful
>  Thomas>  9 builds have failed
> 
> Wee! Lets have a look at the remaining issues..

Yeah, it's getting better. But for example there is also a PHP issue
that only occurs on x86/x86-64 that hasn't been triggered today (but I
have a fix for it, will send it shortly). So we have a lot more than
just 9 issues :-)

>  Thomas> Status         : NOK
>  Thomas> Failure reason : opencv-2.3.1a
>  Thomas> Architecture   : arm
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 01:48:17
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/7bc80c6592bf73dbc698969662467ee823eb2fde/build-end.log
> 
> Internal compiler error, so not much we can do about that.

We can rebuild the toolchain with an updated gcc version, and see if it
fixes the problem. This toolchain currently uses gcc 4.6.4 20120402 from
Linaro. And if upgrading does not fix the problem, report it to
gcc/Linaro people.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : libnspr-4.8.7
>  Thomas> Architecture   : arm
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 06:25:31
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/ede7b2054cfc51217971b2ab67d3fc724b51d486/build-end.log
> 
> That should be fixed by 792ddde39da3b.

Yes.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : directfb-1.4.16
>  Thomas> Architecture   : mipsel
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 12:26:31
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/03d547d1328cf851d998d858e8a695817d928d5a/build-end.log
> 
> Linker/ABI mismatch? Someone with mips experience understand this?

Don't know. This mips64el toolchain is quite new, I've added it just a
week or two ago or so. I know Gustavo had started a lot of MIPS cleanup
work, it would be nice to have it posted, so we can help Gustavo in
finalizing it.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : lua-5.1.4
>  Thomas> Architecture   : mipsel
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 12:53:25
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/9b80ad2c0689dab25be96071f9a2495465404309/build-end.log
> 
> MIPS linker/relocation error?

Sounds like the Lua code should be built with -fPIC. It might work with
other archs, but apparently on MIPS, shared libraries cannot contain the
same relocation types as the ones used in executables.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : libnspr-4.8.7
>  Thomas> Architecture   : arm
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 15:13:00
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/e6bff1ed1594f6515f8f575dab8de0c394553a32/build-end.log
> 
> That should be fixed by 792ddde39da3b.

Yup.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : collectd-5.1.0
>  Thomas> Architecture   : bfin
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 15:21:55
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/a3956908e46c49284c9dafa8526232f98486ab3b/build-end.log
> 
> Uses fork(). I've add the depends line now.

Good, thanks.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : gmp-5.0.5
>  Thomas> Architecture   : mipsel
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 17:52:22
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/650f699d8e111da9c4746f4138313806ec1d7418/build-end.log
> 
> MIPS ABI / 32/64 mismatch?

Yes, a 32/64 issue. I have the same problems when I build gmp for
x86/32 in a x86/32 chroot that runs inside a x86/64 kernel. I have to
pass an explicit ABI=... to gmp ./configure.

>  Thomas> Status         : NOK
>  Thomas> Failure reason : connman-1.0
>  Thomas> Architecture   : avr32
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 19:08:30
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/cd5dae6495adc66992d62539e6c984c9fb6d8cdb/build-end.log
> 
> Too old / misconfigured uClibc. Resolver support was only added in
> 0.9.33, but not easy to handle this on kconfig level for external
> toolchains.

Well, our uClibc Config.in says that 0.9.32 and 0.9.33 do not work on
AVR32. So the latest uClibc version available is 0.9.31, which does not
have resolver support.

Should I just blacklist it? Mark avr32 as deprecated, and get rid of
the avr32 toolchain from my automated builds?

>  Thomas> Status         : NOK
>  Thomas> Failure reason : ffmpeg-0.8.11
>  Thomas> Architecture   : arm
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2012-06-20 20:57:51
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>  Thomas> End of log     : http://autobuild.buildroot.net/results/3270ce7b816f7d141327a09e9c4273fd001827fb/build-end.log
> 
> ARM/thumb mismatch?

I don't know, maybe.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
