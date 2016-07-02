From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 16:52:14 +0200
Subject: [Buildroot] [PATCH 1/3] Move the host-pkgconf dependency from
 host-cmake to pkg-cmake
In-Reply-To: <20160702144455.GN22343@free.fr>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-2-git-send-email-luca@lucaceresoli.net>
 <14747128-2dd0-efb6-6c4c-faf744e8899a@mind.be>
 <20160702144455.GN22343@free.fr>
Message-ID: <a3e6ad6e-525a-80c7-9764-16bac0149e75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-07-16 16:44, Yann E. MORIN wrote:
> However, because the culprit for causing the dependency to host-pkgconf
> is cmake itslef, and not a cmake-based package, I would suggest that we
> do not consider this a hack, but the reality.

 Isn't the problem that package foo uses FindBar from cmake, which uses
pkg-config to find the package? For me, the burden of depending on host-pkgconf
is on package foo in that case.

 That said, this hack really simplifies things so let's indeed keep it.

 Actually, why don't we just always build host-pkgconf? On my machine 'make
host-pkgconf' takes 6.5 seconds, of which 4.7 seconds are parsing the makefiles.
Can we afford the cost of 1.5 seconds of build time and 844K of build size?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
