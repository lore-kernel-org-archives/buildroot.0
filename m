From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 17:27:48 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Makes it possible to
 override the default extract commands
In-Reply-To: <BANLkTimPeuvXnL=Pv_nyBC2EpLLMd8H_Hg@mail.gmail.com>
References: <1305027254-21565-1-git-send-email-a@awn.dk>
	<1305027254-21565-2-git-send-email-a@awn.dk>
	<20110510204332.62afd066@surf> <20110516215226.26540f2a@surf>
	<BANLkTimPeuvXnL=Pv_nyBC2EpLLMd8H_Hg@mail.gmail.com>
Message-ID: <20110518172748.70078d60@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2011 16:39:42 +0200
Allan Nielsen <a@awn.dk> wrote:

> Hi Thomas
> 
> Sorry for not replaying the last couple of days, but I have been busy
> with some other concerns.
> 
> However, when I did a rebuild I did also realize the problems with the
> solution I suggested. Since then I changed the extract_cmd statement
> to also the same as you have suggested:
> 
> 430 $(2)_EXTRACT_CMDS ?= $(if $$($(2)_SOURCE),$$(INFLATE$$(suffix
> $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
> 431 ????????$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR)
> $(TAR_OPTIONS) -)
> 
> This solution has been working fine for me, (and it should make no
> difference if I changes it to your suggestion).

Ok.

> Anyways, I would like to know where you stand on this, do you think
> this solution to be included in buildroot or would you prefer to wait
> for a better suggestion?

I'm fine with your existing proposal. Could you repost a proper patch
with the quoting fixes, so that I can give it a test, and send my
Acked-by ?

Note however that we are pretty close to the 2011.05 release, so it is
quite likely that Peter will delay such infrastructure changes until
after the release. But that doesn't prevent us from making progress on
it, getting my Acked-by, and therefore be on track to merge it
post-2011.05.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
