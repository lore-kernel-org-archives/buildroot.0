From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Dec 2010 09:48:17 +0100
Subject: [Buildroot] [git commit master 1/1] ed: bump to version 1.5
In-Reply-To: <20101223082919.0d574cf8@surf> (Thomas Petazzoni's message of
	"Thu, 23 Dec 2010 08:29:19 +0100")
References: <20101222232249.DB1F38E20B@busybox.osuosl.org>
	<20101223082919.0d574cf8@surf>
Message-ID: <87vd2kswmm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed, 22 Dec 2010 23:47:28 +0100
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> +ED_VERSION = 1.5
 >> +ED_SITE = $(BR2_GNU_MIRROR)/ed
 >> +ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 >> +		LDFLAGS="$(TARGET_LDFLAGS)"

 Thomas> Sorry for this late review, but why is this ED_CONF_OPT needed ? We
 Thomas> already pass those variables through TARGET_CONFIGURE_OPTS.

Yes, it's a bit tricky. TARGET_CONFIGURE_OPTS are provided in the
environment, and the configure script overrides the variables
(CC=''). It then checks for a CC=<blah> argument and uses that,
otherwise it defaults to 'gcc'.

-- 
Bye, Peter Korsgaard
