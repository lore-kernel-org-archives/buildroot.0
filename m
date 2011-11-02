From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Nov 2011 12:58:33 +0100
Subject: [Buildroot] PKG_CONFIG_PATH question
In-Reply-To: <CALX2uoNrcXSLW0LxOomt=sKMPPPZBrxKVBn5pc-rv0xG0QGN2Q@mail.gmail.com>
 (=?utf-8?Q?=22=C5=81ukasz_Pu=C5=82ka=22's?= message of "Wed, 2 Nov 2011
 12:46:52 +0100")
References: <CALX2uoNbshTRLzEXYJMOKuKF2WOxks+Q3w5Rz83YXoku3z_ueA@mail.gmail.com>
 <CAAXf6LU3fXXea4e5_kXftPMeLoYz6AuSO75s6OShtYsgnjgE=g@mail.gmail.com>
 <CALX2uoNrcXSLW0LxOomt=sKMPPPZBrxKVBn5pc-rv0xG0QGN2Q@mail.gmail.com>
Message-ID: <87ehxqlora.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?ukasz" == ?ukasz Pu?ka <lukasz@oxnet.pl> writes:

Hi,

 ?ukasz> The error occured when building xcb-proto for the target
 ?ukasz> machine, not host-xcb-proto.

I guess you mean libxcb?

 ?ukasz> My version of pkg-config was 0.21, or 0.20, and it did not supported
 ?ukasz> PKG_CONFIG_SYSROOT_DIR environment variable.
 ?ukasz> After updating my build OS (slackware 12)  with newer pkg-config
 ?ukasz> (0.23) it was possible for me to move forward without the trick with
 ?ukasz> PKG_CONFIG_PATH.

 ?ukasz> After some time I found that buildroot generates host-pkg-config
 ?ukasz> package, but I wonder why buildroot uses my host installed pkg-config,
 ?ukasz> what is the reason to build host-pkg-config and use pkg-config from my
 ?ukasz> machine?

Because of a missing dependency. I've fixed it in git now.

Thanks.

-- 
Bye, Peter Korsgaard
