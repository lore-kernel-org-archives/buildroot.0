From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 22:40:17 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <20130306195913.2c7e6db7@skate>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <20130306195913.2c7e6db7@skate>
Message-ID: <513FA0C1.6070404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/13 19:59, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed,  6 Mar 2013 18:14:25 +0100, Luca Ceresoli wrote:
>> CMake fails in detecting the compiler when ccache is used. Add a wrapper
>> script to make it happy.
>
> This raises the question of whether we want to generalize this in some
> way: should we be doing the ccache wrapper thing in a generic way, and
> use it everywhere? Since we already have a wrapper for external
> toolchain tools, does it really make sense to have a shell wrapper
> around a C wrapper? Should we have a single C wrapper used in all cases
> (internal, external, crosstool-ng), that handles everything?

  Yes, I would be very much in favour of that. It also solves the issue 
that some configure systems don't deal very well with a CC that contains 
spaces. And for external toolchains, it's nice that the actual options 
that are passed to the external toolchain are also visible to ccache.

  I see two issues however:

- How to deal with HOSTCC?

- How to deal with HOSTCC_NOCCACHE? (TARGET_CC_NOCCACHE can probably be 
removed)


  Anyway, for cmake the solution proposed by Samuel works even better.

  Regards,
  Arnout


> I don't (yet) have a strong opinion on this, I just wanted to have a
> more global reflection about wrappers, and avoid creating many
> wrappers to solve different problems.
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
