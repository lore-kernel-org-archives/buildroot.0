From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 18:12:15 +0200
Subject: [Buildroot] [PATCH v2] set simple network setup via the system
 configuration submenu
In-Reply-To: <20141021103611.7e43d2b4@free-electrons.com>
References: <1413814486-10716-1-git-send-email-jeremy.rosen@openwide.fr>
 <20141021103611.7e43d2b4@free-electrons.com>
Message-ID: <5447D75F.90800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/14 10:36, Thomas Petazzoni wrote:
> I certainly don't like to push back stuff, but I'm wondering if this
> isn't too much complexity compared to just having people use an overlay
> containing their own /etc/network/interfaces. We will never be able to
> handle all the possible cases, with multiple network interfaces, hook
> scripts called before/after bringing up/down interfaces, etc.

 Personally I think that the network interfaces is at least as relevant as the
getty, hostname, timezone, default shell, and other system configuration.
Similar to the getty configuration, it's good to have something that gives you a
working system with a simple config without having to create custom files. And
at least for the network interface, the simple configuration will often be
sufficient. getty  on the other hand becomes irrelevant when you create a custom
inittab (i.e. always for a real product).

 So I'm definitely in favour of having something like this. On condition that it
is sufficiently simple, and doesn't attempt to cover all cases.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
