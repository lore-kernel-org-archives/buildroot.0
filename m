From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 24 Mar 2015 14:03:02 -0500
Subject: [Buildroot] [PATCH 1/7 v3] support/download: make hash file
	optional
In-Reply-To: <5f50190fe62d33438bfe4c68ab566698c63d5102.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <5f50190fe62d33438bfe4c68ab566698c63d5102.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <CAMQcK5JmZ=r6U7eV4pR_GYa3-eP_VhXu-QBRf-WtvGdcUZTFDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Mar 22, 2015 at 10:21 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, specifying a hash file for our download wrapper is mandatory.
>
> However, when we download a git, svn, bzr, hg or cvs tree, there's by
> design no hash to check the download against.

I was thinking about hashes for the git/svn/(other VCS) and how these
sources could be provided by the buildroot sources mirror -
http://sources.buildroot.org/ or a primary download site. Do you have
an idea of how we could utilize hash checking if buildroot were to
pull the sources from one of these methods? There could be a "man in
the middle" attack since the sources mirror or the primary site just
provides a tar of these VCS repositories

This could be especially useful for when the BR2_PRIMARY_SITE_ONLY is
used. This wouldn't necessarily for "man in the middle" attacks but
for ensure that your downloads don't get corrupt.

To be clear - I am not suggesting that this series should take this
into consideration but it was something that I would like to get out
there before I forget.

Thanks,
-Ryan

[...]

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
