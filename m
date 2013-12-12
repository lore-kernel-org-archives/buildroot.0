From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Dec 2013 00:08:46 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <20131212231338.33eae486@skate>
References: <52A730B0.3020104@orange.com>	<1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>	<52A842A3.3010302@mind.be>	<201312111325.49600.yann.morin.1998@free.fr>	<52A862B4.50103@orange.com>	<52A8710F.7040406@orange.com>	<52AA31F2.8070900@mind.be>
 <20131212231338.33eae486@skate>
Message-ID: <52AA41FE.6060705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/13 23:13, Thomas Petazzoni wrote:
>> >   I also feel that the way the opengl stuff is handled now is a bit
>> >hacky, but I don't have any better ideas.
> Huh? Can you be more specific in what you find hacky? The way the
> OpenGL stuff is handled today is kind of becoming the norm to handle
> virtual packages, so it'd be good to understand what you think is hacky
> in this implementation.

  It's hacky because you have double binding between opengl/libgles and 
the gles suppliers: opengl/libgles/libgles.mk enumerates all possible 
suppliers, and the suppliers select BR2_PACKAGE_HAS_OPENGL_ES.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
