From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 11:18:29 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/speexdsp: new package
In-Reply-To: <20180610201509.30546-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 10 Jun 2018 22:15:05 +0200")
References: <20180610201509.30546-1-bernd.kuhls@t-online.de>
Message-ID: <87r2lc747u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quoting speex release notes from https://www.speex.org
 > "Speex 1.2rc2 and SpeexDSP 1.2rc2 are out
 >  December 6, 2014
 >  This release splits the speex codec library and the speex DSP library
 >  into separate source trees."

 > After bumping speex to 1.2.0 this new package is necessary to provide
 > speex-based DSP support.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: no changes

 >  package/Config.in                             |   1 +
 >  .../0001-port-resample-neon-to-aarch64.patch  | 250 ++++++++++++++++++

This patch is not documented in the commit message?

 > +config BR2_PACKAGE_SPEEXDSP
 > +	bool "speexdsp"
 > +	help
 > +	  Speex is a patent-free audio codec designed especially for
 > +	  voice (unlike Vorbis which targets general audio) signals and
 > +	  providing good narrowband and wideband quality. This project
 > +	  aims to be complementary to the Vorbis codec.

That sounds like a description of speex (and not speexdsp) to me. Maybe
we should add the description from the git repo to this as well:

"DSP library derived from speex"

 > +################################################################################
 > +#
 > +# speexdsp
 > +#
 > +################################################################################
 > +
 > +SPEEXDSP_VERSION = 20ed3452074664ad07e380e51321b148acebdf20
 > +SPEEXDSP_SITE = https://git.xiph.org/speexdsp.git

Why are we using a git snapshot (and still backporting a patch on top)
and not the 1.2-rc3 release?

-- 
Bye, Peter Korsgaard
