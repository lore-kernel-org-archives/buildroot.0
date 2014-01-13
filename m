From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jan 2014 08:40:27 +0100
Subject: [Buildroot] [PATCH v1] tcpreplay: bump version to 4.0.0
In-Reply-To: <1389575003-17982-1-git-send-email-judge.packham@gmail.com>
 (judge packham's message of "Mon, 13 Jan 2014 14:03:23 +1300")
References: <1389575003-17982-1-git-send-email-judge.packham@gmail.com>
Message-ID: <87zjn01g9g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "judge" == judge packham <judge.packham@gmail.com> writes:

 > From: Chris Packham <judge.packham@gmail.com>
 > Update the tcpreplay package to version 4.0.0. The upstream package has
 > a new maintainer and license. Version 4.0.0 brings a number of new
 > features see http://tcpreplay.appneta.com/ for details.

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>
 > ---
 > Changes since v0:
 > . Updated my git configuration to use a smtp server that doesn't modify my
 >   messages in-flight.
 
 > -TCPREPLAY_VERSION = 3.4.3
 > +TCPREPLAY_VERSION = 4.0.0
 >  TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 > -TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
 > +TCPREPLAY_LICENSE = GPLv3
 > +TCPREPLAY_LICENSE_FILES = docs/LICENSE
 > +TCPREPLAY_CONF_ENV = \
 > +	tr_cv_libpcap_version=">= 0.7.0" \
 > +	ac_cv_have_bpf=no
 >  TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 >  TCPREPLAY_AUTORECONF = YES

AUTORECONF can also go now that all the patches are gone.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
