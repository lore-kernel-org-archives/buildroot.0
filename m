From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Mar 2014 07:24:14 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <20140310184119.GC3282@free.fr>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
 <20140310173941.GA3282@free.fr> <20140310182030.GB18832@pc-eric>
 <20140310184119.GC3282@free.fr>
Message-ID: <531FFD8E.8010209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/14 19:41, Yann E. MORIN wrote:
>> > 1. As Mesa3D is an implementation of OpenGL, it will be a provider for the
>> >    virtual packages libegl, libgles and libopenvg.
> I've looked on my distro, and mesa3d does not provide any file named
> libegl*.so or ligles*.so or libopenvg*.so. So I don't think it should
> be, *as is*, a provider for libegl, libgles or libopenvg.

 Have you looked at libegl1-mesa, libgles2-mesa, libopenvg1-mesa?

> 
>> > 2. Mesa3D also provides libgl, but:
> libgl or libglx ?
> 
> On my distro (Ubuntu 13.10), there's no libgl.so, only libglx.so which
> is provided by a bumch of different packages, of which the nvidia blobs.

 That one is in libgl1-mesa-glx.

 All that stuff is only installed if you need it - which you usually
don't because glx is enough for desktop use.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
