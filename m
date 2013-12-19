From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Dec 2013 21:32:34 +0100
Subject: [Buildroot] [PATCH v10 7/8] package: enable jobserver for
	recursive make
In-Reply-To: <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Wed, 18 Dec 2013 11:36:46 +0100")
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87ob4cmvj1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
 > commands to enable jobserver for the sub-make.

 > Without the '+' prefix GNU make does not detect the sub-make so it
 > disable the jobserver for the sub-make.

 > From GNU make documentation:
 > Using the MAKE variable has the same effect as using a ?+? character
 > at the beginning of the recipe line.  This special feature is only
 > enabled if the MAKE variable appears directly in the recipe: it does
 > not apply if the MAKE variable is referenced through expansion of
 > another variable. In the latter case you must use the ?+? token to get
 > these special effects.

Wouldn't it make more sense to add the '+' to MAKE / MAKE1?

-- 
Bye, Peter Korsgaard
