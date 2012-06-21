From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Jun 2012 10:49:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-20
In-Reply-To: <20120621063115.B05E852CEBE@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Thu, 21 Jun 2012 08:31:15 +0200 (CEST)")
References: <20120621063115.B05E852CEBE@lolut.humanoidz.org>
Message-ID: <87ipelqccc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,

 Thomas> On 2012-06-20, 77 random build tests have been done and
 Thomas> submitted on autobuild.buildroot.net.
 Thomas>  68 builds have been successful
 Thomas>  9 builds have failed

Wee! Lets have a look at the remaining issues..

 Thomas> Status         : NOK
 Thomas> Failure reason : opencv-2.3.1a
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 01:48:17
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/7bc80c6592bf73dbc698969662467ee823eb2fde/build-end.log

Internal compiler error, so not much we can do about that.

 Thomas> Status         : NOK
 Thomas> Failure reason : libnspr-4.8.7
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 06:25:31
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/ede7b2054cfc51217971b2ab67d3fc724b51d486/build-end.log

That should be fixed by 792ddde39da3b.

 Thomas> Status         : NOK
 Thomas> Failure reason : directfb-1.4.16
 Thomas> Architecture   : mipsel
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 12:26:31
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/03d547d1328cf851d998d858e8a695817d928d5a/build-end.log

Linker/ABI mismatch? Someone with mips experience understand this?

 Thomas> Status         : NOK
 Thomas> Failure reason : lua-5.1.4
 Thomas> Architecture   : mipsel
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 12:53:25
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/9b80ad2c0689dab25be96071f9a2495465404309/build-end.log

MIPS linker/relocation error?

 Thomas> Status         : NOK
 Thomas> Failure reason : libnspr-4.8.7
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 15:13:00
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/e6bff1ed1594f6515f8f575dab8de0c394553a32/build-end.log

That should be fixed by 792ddde39da3b.

 Thomas> Status         : NOK
 Thomas> Failure reason : collectd-5.1.0
 Thomas> Architecture   : bfin
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 15:21:55
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/a3956908e46c49284c9dafa8526232f98486ab3b/build-end.log

Uses fork(). I've add the depends line now.

 Thomas> Status         : NOK
 Thomas> Failure reason : gmp-5.0.5
 Thomas> Architecture   : mipsel
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 17:52:22
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/650f699d8e111da9c4746f4138313806ec1d7418/build-end.log

MIPS ABI / 32/64 mismatch?

 Thomas> Status         : NOK
 Thomas> Failure reason : connman-1.0
 Thomas> Architecture   : avr32
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 19:08:30
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/cd5dae6495adc66992d62539e6c984c9fb6d8cdb/build-end.log

Too old / misconfigured uClibc. Resolver support was only added in
0.9.33, but not easy to handle this on kconfig level for external
toolchains.

Thomas, perhaps blacklist this package/toolchain combination in your
scripts?

 Thomas> Status         : NOK
 Thomas> Failure reason : ffmpeg-0.8.11
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-06-20 20:57:51
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
 Thomas> End of log     : http://autobuild.buildroot.net/results/3270ce7b816f7d141327a09e9c4273fd001827fb/build-end.log

ARM/thumb mismatch?

-- 
Bye, Peter Korsgaard
