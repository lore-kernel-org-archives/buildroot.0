From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Oct 2018 13:04:50 +0200
Subject: [Buildroot] [PATCH 1/1] board/pc: improve image generation
In-Reply-To: <20181011223946.cqtbipkwm2gyviiu@lois>
References: <20180920143318.21284-1-greg@quimbo.fr>
 <20181011214932.350ef220@windsurf>
 <20181011223946.cqtbipkwm2gyviiu@lois>
Message-ID: <20181012130450.64ed4b36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Please keep the mailing list in Cc, thanks!)

On Fri, 12 Oct 2018 00:39:46 +0200, Gr?goire Delattre wrote:

> > and then in the commit log, explain that the grub.cfg file was copied
> > to TARGET_DIR in a post-image hook, i.e after the filesystem image has
> > been generated, and that in practice it worked because the
> > board/pc/grub-bios.cfg file is the same as boot/grub2/grub.cfg, which
> > *is* copied to TARGET_DIR as part of the grub2 build process.  
> 
> I fixed the comment in the v2 patch.

Thanks, I had a quick look at your v2, and it looks good to me. If no
other maintainer beats me at it, I'll try to merge it tonight.

> I've changed that too.
> 
> I have two questions regarding the coding style of shell scripts in buildroot in
> general:
> 1) Should we use 2/4 spaces, tab ?

Good question, we have not standardized very well our shell scripts in
general right now. Carlos Santos has started an effort to standardize
our init scripts (see series at
http://patchwork.ozlabs.org/project/buildroot/list/?series=69419), I
think we should use the same indentation.

> 2) ${MY_VAR} vs "$MY_VAR" ?

Here as well, we don't have a very strict rule. My own personal rule is
that I use $i for simple variable names, and I switch to ${foo_bar}
when the variable name becomes more complex. But again, that's just my
own personal taste. I believe Yann uses ${foo} all the time for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
