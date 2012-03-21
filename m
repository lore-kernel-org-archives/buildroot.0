From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Mar 2012 12:20:18 +0100
Subject: [Buildroot] [PATCH 1/1] Add FbTerm package for OMAP4
	(targetting pandaboard) Signed-off-by: JoM
	<johann.mercadier@imerir.com>
In-Reply-To: <CAPEB33zX2XuoTbJRnUoQBhn+Fr+MNP8S81KJWvWLj7mHA1cKsA@mail.gmail.com>
References: <1332281066-364-1-git-send-email-johann.mercadier@imerir.com>
 <20120321001637.6ac06f89@skate>
 <CAPEB33zX2XuoTbJRnUoQBhn+Fr+MNP8S81KJWvWLj7mHA1cKsA@mail.gmail.com>
Message-ID: <201203211220.18870.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 21 March 2012 12:06:07 MERCADIER Johann wrote:
> normally libz and libexpat are used by fbterm but the only lib
> really needed when I port fbterm was the both I kept in the .mk file. Do
> you think I need to write them also as the fact I didn't need them was part
> of my own config for which they were already installed?

 Hah, that's a tricky part.  If a package can make use of some library
but it doesn't really depend on it, then we add something like this to
the .mk file:

ifeq ($(BR2_PACKAGE_ZLIB),y)
FBTERM_DEPENDENCIES += zlib
endif

or in one line:

FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)


 Similarly for expat.


>   About the help section, Thomas is right I made a copy/paste, but from
> different sites so as to give users a good understanding of what they are
> going to install, without the need to go searching around... Maybe  it's
> not necessary as most on the informations are on the main website (
> http://code.google.com/p/fbterm/)?... Just let me know and I will correct
> this for good of all.

 Leave it as it is, but remember for your next package that the help text
doesn't have to be so long.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
