From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:18:54 +0200
Subject: [Buildroot] [PATCH v8 06/10] core: introduce "sdk" target to
 make a relocatable SDK
In-Reply-To: <12b29063-e931-6599-32f0-d28f61479378@mind.be>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-7-git-send-email-wg@grandegger.com>
 <12b29063-e931-6599-32f0-d28f61479378@mind.be>
Message-ID: <20170720231854.31f919e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 23:11:34 +0200, Arnout Vandecappelle wrote:

>  As mentioned by Thomas, this should depend on "world", not just toolchain.
> Indeed, plenty of host packages are built *after* the toolchain. You could add
> ${PACKAGES} as a dependency, but that still misses the dependencies of the
> rootfs targets that don't have a Kconfig option. So depending on "world" is the
> easiest.
> 
>  With that (and updating the commit message accordingly):
>  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Wolfgang added the dependency on $(PACKAGES) in PATCH 07/10. But
actually, I think PATCH 06/10 and 07/10 should probably be squashed
together, and indeed have sdk depend on world.

In fact even PATCH 09/10 should be squashed with 06/10 and 07/10. Just
one patch adding the "sdk" target is enough, it's just a few lines
overall.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
