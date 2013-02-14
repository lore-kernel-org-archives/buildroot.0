From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 15 Feb 2013 00:59:30 +0100
Subject: [Buildroot] sdkdir in xorg-server.pc
Message-ID: <511D7A62.1040004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi all,

  xorg-server.pc has the variables sdkdir=${prefix}/include/xorg and 
moduledir=${exec_prefix}/lib/xorg/modules. These are used by some Xorg 
packages to add to the include and library search path.

  We patch pkgconf to add the sysroot to the variables includedir, mapdir 
and libdir. Should we do something similar for sdkdir and moduledir? But 
of course, there's no end to that...


  By the way, Peter, Thomas, do the autobuilders ever compile the full 
Xorg server? I don't see how xdriver_xf86-input-synaptics can ever build 
with this issue...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
