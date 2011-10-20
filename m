From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Oct 2011 14:48:52 +0200
Subject: [Buildroot] [PATCH] -lsof was unable to patch Makefile.skel due
	to bad file permissions. Adding chmod solves it. (openSUSE)
In-Reply-To: <201110201322.13259.yann.morin.1998@anciens.enib.fr>
References: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
 <201110200046.30854.arnout@mind.be>
 <201110201322.13259.yann.morin.1998@anciens.enib.fr>
Message-ID: <201110201448.53060.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thursday 20 October 2011 13:22:13, Yann E. MORIN wrote:
> > LSOF_EXTRACT_CMDS = \
> >         $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
> >               $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
> >         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -)
> 
> That would not work, because the first $(TAR) will extract actual files
> to the disk, and does not send the extracted files to the stdio, so the
> second $(TAR) will get nothing on its stdin (at best), or only get
> garbage (at worst).

 Oh, is -O not a universally accepted tar option?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
