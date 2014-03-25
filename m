From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Mar 2014 23:46:56 +0100
Subject: [Buildroot] [PATCH 1 of 4] qt5 packages: set correct PATH when
 running qmake
In-Reply-To: <bb907111e06d6d25c78f.1395257406@argentina>
References: <patchbomb.1395257405@argentina>
 <bb907111e06d6d25c78f.1395257406@argentina>
Message-ID: <53320760.4080206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/14 20:30, Thomas De Schampheleire wrote:
> The qmake step of qt5 packages may attempt to run pkg-config. If qmake is
> executed in an environment where the buildroot host directory is not in
> PATH, pkg-config from the build machine may be used (/usr/bin/pkg-config).
> This causes qt5 package compilation to fail on machines that do not have
> pkg-config installed.
> Refer to mailing list thread [1] for a specific error case.
> 
> This patch prepends TARGET_MAKE_ENV (which sets PATH) to the qmake call.
> 
> Reported-by: Marco Trapanese <marcotrapanese@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-March/092283.html

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
