From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 00:13:55 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <201302132357.27593.yann.morin.1998@free.fr>
References: <20130209195709.323b9f5e@skate> <20130213231346.0ed68b45@skate>
 <201302132357.27593.yann.morin.1998@free.fr>
Message-ID: <511C1E33.4060500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 23:57, Yann E. MORIN wrote:
> Also, I wonder how and how much we could evaluate the Buildroot overhead.
> For example, considering a system that only has buildroot in it, how long
> does it take to build busybox, compile the filesystem generator (eg.
> genext2fs and fakeroot) and assemble the file system images, all manually
> (but only couting the build time, not the manual keying of the commands),
> and how long does it take Buildroot to achieve the same?

  You can approximate the overhead with 'make -qp > /dev/null'. 
Everything else that actually does get executed is necessary. Oh, wait: 
the time of dependencies.sh should also be taken along. But basically, 
the Buildroot overhead is roughly 5 seconds.

  Of course, with manually typing commands, you can make some shortcuts, 
like not using 'find' to find which things to remove in the finalize 
steps. On my allpackageyesconfig setup the finalize step takes in the 
order of 30 seconds.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
