From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 12:37:52 +0200
Subject: [Buildroot] [PATCH] Rename BASE_DIR to OUTPUT_DIR
In-Reply-To: <878wg6rmes.fsf@macbook.be.48ers.dk>
References: <1253700233-11103-1-git-send-email-mroth@nessie.de>
	<878wg6rmes.fsf@macbook.be.48ers.dk>
Message-ID: <200909231237.58227.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wednesday 23 September 2009 12:22:03 schrieb Peter Korsgaard:
> >>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:
>
>  Michael> To reflect the new output directory hierarchy rename the Makefile
>  Michael> variable BASE_DIR to OUTPUT_DIR.
>
>  Michael> Signed-off-by: Michael Roth <mroth@nessie.de>
>
> Hmm, this will presumably break downloads for people trying to reuse
> their existing .config? (E.G. DL_DIR gets to point to /dl).

Hmm... Yes, I think you're right.


> I agree that BASE_DIR isn't the most telling name for what it does, but
> I'm not sure it's worth the trouble.

OTOH: The introduced change to the directory hierarchy "broke" the download 
directory from '$(TOPDIR)/dl' to '$(TOPDIR)/output/dl'.

Maybe the directory hierarchy change introduced some other inconvenience so
maybe a big fat warning that some things changed in the documentation is the 
way to go?

Or, maybe a hook in 'make oldconfig' could fix that?


Michael Roth
