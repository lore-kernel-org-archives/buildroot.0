From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 18 Mar 2009 13:31:26 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318122515.GB27893@whatever.nu>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
Message-ID: <1237379486.6302.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-03-18 at 13:25 +0100, Per-Henrik Lundblom wrote:
> * Daniel Mack <daniel@caiaq.de> [090318 12:47]:
> 
> > You could try using the svn version. There were a number of fixes for
> > gcc builds, and I'm not totally aware whether they make it to the
> > release version you got.

All the relevant fixes are in the 2009.02 release.

> > # BR2_xscale is not set
> > BR2_iwmmxt=y
> > BR2_ARM_TYPE="ARM_IWMMXT"
> > # BR2_ARM_OABI is not set
> > BR2_ARM_EABI=y
> > BR2_ARCH="arm"
> > BR2_ENDIAN="LITTLE"
> > BR2_GCC_TARGET_TUNE="iwmmxt"
> > BR2_GCC_TARGET_ARCH="iwmmxt"
> 
> ...using these settings I get this result. It is a result of using
> iwmxxt target because I got the same error when I tried different
> combinations of xscale/iwmmxt.

Did you really do a completely new build in a fresh tree? My experience
with buildroot is that you can't change such fundamental changes to the
configuration and expect make to succeed in the same tree, not even
after 'make clean'.


Sven
