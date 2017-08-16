From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Aug 2017 00:51:23 +0200
Subject: [Buildroot] [PATCH 1/1] Keep HOSTCFLAG and HOSTLDFLAGS
 consistent when Making Linux Kernel
In-Reply-To: <20170729150402.40d27236@windsurf.lan>
References: <1501286200-4274-1-git-send-email-jqiaoulk@gmail.com>
 <20170729150402.40d27236@windsurf.lan>
Message-ID: <a2bbac58-b29b-cd95-ece4-1972bbafc971@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-07-17 15:04, Thomas Petazzoni wrote:
> Unrelated to your patch, but this $(HOSTCFLAGS) thing is messy. We
> actually have:
> 
>  - HOSTCFLAGS, defined in the main Makefile to the value of
>    $(CFLAGS_FOR_BUILD), which is empty. HOSTCFLAGS is then exported. It
>    was done this way a long time ago in commit
>    c0d7d4e0355b49b489d7235e945481cf5d32087f (from 2007) for kconfig.
>    I'm not sure we still need this.
> 
>  - HOST_CFLAGS, defined in package/Makefile.in, which actually contains
>    some useful flags. It is most likely the one we should pass as
>    HOSTCFLAGS in LINUX_MAKE_FLAGS.

 In addition, I see no reason why we would *override* the kernel's HOSTCFLAGS.
So I think the proper fix is to do HOST_EXTRACFLAGS=$(HOST_CFLAGS) instead.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
