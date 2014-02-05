From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 5 Feb 2014 09:30:13 +0100 (CET)
Subject: [Buildroot] [PATCH 3/3] infra: replace BUILDROOT_CONFIG
	with	BR2_CONFIG.
In-Reply-To: <1391527132-20103-3-git-send-email-arnout@mind.be>
Message-ID: <1097248087.5049435.1391589013728.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




----- Mail original -----
> To make the naming consistent (all user-visible options should be
> prefixed with BR2_).
> 
> An entry is added to Makefile.legacy to warn users who have set
> BUILDROOT_CONFIG but not BR2_CONFIG.
> 
> Still export BUILDROOT_CONFIG but pointing to some phony value, to
> make sure that scripts that still use it fail in a predictable way.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---


I tested with my script which has the following code

BR2_RASPAUDIO_PAACCESS="$( sed -r -e '/^BR2_RASPAUDIO_PAACCESS="(.*)"$/!d;'    \
                         -e 's//\1/;'                                           \
                         "${BUILDROOT_CONFIG}"                                  \
                )"


which is adapted from the mkusers script... and it failed silently.

I am not sure how to deal with the situation. I don't really see a better
way, but silently failing in a case where I copied what is done in mainline
seems a bad idea... 

Regards

Jeremy Rosne
