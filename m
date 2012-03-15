From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Mar 2012 23:55:42 +0100
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <702f6e09c17e9a072c3e4458c35a83a2@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <20120315213041.3bda3650@skate>
 <702f6e09c17e9a072c3e4458c35a83a2@zacarias.com.ar>
Message-ID: <201203152355.42554.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 21:51:42 Gustavo Zacarias wrote:
> > ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
> > else
> > SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
> > endif
> >
> > And SHARED_STATIC_LIB_OPTS is used in package/Makefile.autotools.in. 
> > I
> > am not sure why alsa-lib requires those different options than the
> > standard ones.
> >
> > Thomas
> 
> Because it doesn't build with both static & shared set starting with 
> version 1.0.25, the configure script just errors out complaining about 
> some libtool issues about building both.

 But the --enable-shared=n in case BR2_PREFER_STATIC_LIB is enabled is
probably redundant, right?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
