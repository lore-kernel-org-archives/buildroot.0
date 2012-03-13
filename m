From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Mar 2012 23:45:58 +0100
Subject: [Buildroot] [PATCHv2 1/1] vlc: New package
In-Reply-To: <20120312171515.3eadccce@gmail.com>
References: <1330923026-1917-1-git-send-email-ismael.luceno@gmail.com>
 <201203111408.28171.arnout@mind.be> <20120312171515.3eadccce@gmail.com>
Message-ID: <201203132345.59034.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 March 2012 20:15:15 Ismael Luceno wrote:
> >  Why do the normal configure commands not work?
> > 
> >  The revision.txt could be done in POST_PATCH_HOOKS.
> > 
> >  The bootstrap can be done in PRE_CONFIGURE_HOOKS.  However, isn't vlc
> > distributed with a configure script?  So the bootstrap will never be
> > executed, right?
> 
> It's for scm versions, which I use from time to time. It doesn't hurt
> to have, that's why I left it.

 It seems a bit overkill to override the configure commands for these
rare occasions.

 Anyway, if you use a n SCM (or any other) version from time to time,
it's probably better to use the _OVERRIDE_SRCDIR infrastructure.  And
then you can run the bootstrap in your local checkout.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
