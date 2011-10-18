From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 14:33:26 +0200
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
	DM365 processors
In-Reply-To: <201110181123.03836.arnout@mind.be>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
 <201110181123.03836.arnout@mind.be>
Message-ID: <201110181433.26332.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 18 October 2011 11:23:03, Arnout Vandecappelle wrote:
> On Friday 17 September 2010 19:59:45, Pierre-Luc Simard wrote:
> > Hello All,
> > 
> > I'd like some comment on the packages I've made to support TI's gstreamer 
> > plugin for the OMAP3 and DM365 processors. All packages compile using 
> > crosstool-ng and glibc, I have not yet tested them with BR's own internal 
> > toolchain and the uclibc at the moment. If anybody wants to test these 
> > package I'll provide as much assistance as I can. I've publish my working 
> > branch at http://github.com/Admetric/buildroot
> 
>  Reviving a year-old thread...
> 
>  It seems these patches were never commented upon and also weren't
> accepted.  I'm going to pick them up again.
> 
>  Although these patches still apply cleanly against the current master,
>  there is probably some duplication with the TI things that were merged
>  earlier this year.

 Looks like I spoke too soon...

 That TI stuff is an unholy mess of different libraries, usually binary-only.  The patches that Pierre-Luc posted don't work anymore because things have been moved around on the TI website.  But the worst thing of all, all packages use a binary installer that has to be executed to self-extract the source code and (binary) libraries.

 Fortunately, TI's license allows redistribution in any form.  So we are allowed to repackage the extracted source/binary code.  That would be my preferred approach: download a .tgz from the buildroot mirror instead of going through the mess of running installer binaries.

 Peter, is that an acceptable solution?


 Bottom line will be that nothing of Pierre-Luc's original patches will be left.  For sure, I will limit my work to DM365 (that's the one I need myself).  And finally, my project manager just bumped down the priority of having the gstreamer-ti plugins in our project, so I may never do it after all...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
