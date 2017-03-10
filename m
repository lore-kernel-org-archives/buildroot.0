From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 10:59:52 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAAMH-yvbmyvqbRckOBm7UuMM8eNH2k6TQGS0mH0O4_B-iDBOnA@mail.gmail.com>
 (Gary Bisson's message of "Fri, 10 Mar 2017 10:47:34 +0100")
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
 <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
 <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
 <CAAMH-ys1J+wuKrEQ7dN=YbcbgTB+kjK0SJJV4Cvj2X9G0yf1pQ@mail.gmail.com>
 <CAOMZO5BxKvub7SRbiwdDFc0W6Kxr=V8nj7uA=WYUc_iAGAQpNw@mail.gmail.com>
 <CAAMH-ythsVpak9K2JqXG5qR3gXNOgWQ60vXxMwvRKPksbrVOnQ@mail.gmail.com>
 <878toeaz13.fsf@dell.be.48ers.dk>
 <CAAMH-yvbmyvqbRckOBm7UuMM8eNH2k6TQGS0mH0O4_B-iDBOnA@mail.gmail.com>
Message-ID: <87varha1uv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

Hi,

>> The question is what happens if kmscube is run on a kernel that doesn't
 >> support DRM_MODE_OBJECT_PLANE (E.G. kernel < 4.7)?

 > I believe it would work since the declaration was in the kernel
 > already, just missing from the uapi header:
 > http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=8812f38141

Ahh, ok - Good. And looking at the state before that, the drm plane
stuff was added in 3.3 (8cf5c91771515).

 >> If it really needs
 >> support for this then we should simply make the package depend on >= 4.7
 >> headers, and if not we could add a patch to add the include.

 > Adding a dependency on headers >= 4.7 would definitely work and I
 > think it's the easiest/cleanest option here.

 > I'll just be sad not to be able to use the prebuilt (linaro) toolchain ;)

It is indeed a bit stupid to not allow the Linaro toolchain when the fix
is so easy. Have you tried to contact upstream about either adding the
drm include and/or local definitions for this define?

-- 
Bye, Peter Korsgaard
