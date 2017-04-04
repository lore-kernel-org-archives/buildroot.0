From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Apr 2017 23:34:46 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
	BR2_GENIMAGE_CFG_FILES
In-Reply-To: <2ce8812c-d95e-bd4a-9cde-f02ab8e3ca60@mind.be> (Arnout
 Vandecappelle's message of "Mon, 3 Apr 2017 11:35:24 +0200")
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <20170401155116.66464885@free-electrons.com>
 <8760ilvozx.fsf@dell.be.48ers.dk>
 <2ce8812c-d95e-bd4a-9cde-f02ab8e3ca60@mind.be>
Message-ID: <87wpazuaa1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >> What do the others think?
 >> 
 >> > I agree that the new option doesn't seem really useful.
 >> 
 >> I'm not sure. One of the problems with genimage is that it calls a
 >> number of external utilities depending on the content of
 >> genimage.cfg, and it isn't directly clear what host packages you need to
 >> enable to ensure it works. If we add explicit BR2_GENIMAGE_FAT / CPIO /
 >> EXT2 / ISO / JFFS2 / UBI / .. options selecting the needed host packages
 >> then that would solve that issue.

 >  So, how would you do that? To know which host packages to select, we need to
 > parse the genimage.cfg file. This is not possible from Kconfig....

I would simply leave it to the user to select the correct sub
options. The point is just that explicit sub options are clearer than
having to reverse engineer genimage to figure out what programs it
executes (and then figure out what host packages provide them).


 >  A long time ago (back in the days we still had ct-ng support), someone posted a
 > huge hack to Kconfig to allow it to call an external program while constructing
 > the Kconfig model. Something like that might work, but it's really a huge change
 > to Kconfig semantics.

Argh, lets not go there!

-- 
Bye, Peter Korsgaard
