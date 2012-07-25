From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 19:39:46 +0200
Subject: [Buildroot] [PATCH 08/11] libpng: fix host-libpng build on
 system on which zlib.h is missing.
In-Reply-To: <20120722162756.2d508583@skate>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-9-git-send-email-s.martin49@gmail.com>
 <20120722162756.2d508583@skate>
Message-ID: <50102F62.70005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/12 16:27, Thomas Petazzoni wrote:
> Le Sun, 22 Jul 2012 15:28:36 +0200,
> Samuel Martin<s.martin49@gmail.com>  a ?crit :
>
>> +-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
>> ++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) $(CFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
>
> Shouldn't we be passing the right arguments in CPPFLAGS instead?

  Good point.  HOST_CONFIGURE_OPTS doesn't set CPPFLAGS at all...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
