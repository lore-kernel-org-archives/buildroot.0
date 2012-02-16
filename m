From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Feb 2012 00:10:31 +0100
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: fix lifetime
In-Reply-To: <20120216153821.3db68aef@skate>
References: <1329382425-2288-1-git-send-email-s.martin49@gmail.com>
 <201202161047.27002.arnout@mind.be> <20120216153821.3db68aef@skate>
Message-ID: <201202170010.53333.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 15:38:21 Thomas Petazzoni wrote:
> Le Thu, 16 Feb 2012 10:47:26 +0100,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
> >  I would prefer that.  I don't like the way it looks now, with
> > the .cmake file lying around in the output directory.
> 
> No, not in $(TOOLCHAIN_DIR), because the CMake toolchain file must be
> part of our SDK, so it should be moved somewhere into $(HOST_DIR).

 True.  How about $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/ (right
beside the sysroot)?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
