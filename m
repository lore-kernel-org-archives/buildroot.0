From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Oct 2012 22:32:19 +0200
Subject: [Buildroot] post-buil script in chrooted
In-Reply-To: <507C882B.5080609@free.fr>
References: <5077A820.7050202@free.fr> <20121012093032.7ef6b972@skate>
 <CAAXf6LVCr25_i_6CMR6DYs-5z1+bVuNNYEF4DedEe3j-6=4hqg@mail.gmail.com>
 <507866D6.8020608@mind.be> <507C882B.5080609@free.fr>
Message-ID: <507F15D3.2080805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/12 00:03, David Bonnin wrote:
> Hello,
>
> yes, sorry , i mean , i was looking for a post-build script for my board in a fakeroot environnement.
> customize package is deprecated.
>
> in board/me/Myproject/rootfs-adds/root/
>
> i want to cp files of root user.

  Do you mean, files that are owned by root and are not readable by you?
That won't be possible.

  Or do you mean, files that should be owned by root in the target?  In that
case, you can just copy them in the post-build script - buildroot will make
everything owned by root.


> So i need to use custom skeletonfs or use customize package.

  Neither of these will do anything that the post-build script cannot do.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
