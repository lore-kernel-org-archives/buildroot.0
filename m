From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Sep 2012 01:38:36 +0200
Subject: [Buildroot] RFC: deprecate BR2_GCC_SHARED_LIBGCC
Message-ID: <505A577C.1080700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  I've been playing around a bit with the options of the buildroot toolchain,
and disabled BR2_GCC_SHARED_LIBGCC.  Turns out that this makes it impossible
to build shared C++ libraries, because they have to be linked with a shared
libstdc++.so... Also, it looks like libgcc_s.so is still built, but it isn't
copied to the target directory.  So there's a risk that something links against
it and fails to run.

  So I propose to remove the BR2_GCC_SHARED_LIBGCC option, and instead make it
equal to !BR2_PREFER_STATIC.  That will probably still cause problems in some
corner cases, but we reduce the room for error.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
