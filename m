From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 01:44:14 +0200
Subject: [Buildroot] [PATCH 2/2] apply-patches.sh: don't print anything
	when "make -s" is used
In-Reply-To: <1413994811-19452-3-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Wed, 22 Oct 2014 18:20:11 +0200")
References: <1413994811-19452-1-git-send-email-fabio.porcedda@gmail.com>
 <1413994811-19452-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87ioj96njl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > The make "-s" option is used to enable the "Silent operation" so if that
 > option is used don't print anything as far as there isn't any error.

 > Add the "-s" option to "apply-patches.sh" to enable silent operation.

 > Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
 > used so others parts can use it to silence the build as well.

Your patch actually sets it to 'y', not "YES". We also already have the
QUIET variable basically doing the same stuff, so I've changed it to use
that instead.

I see that you filter out --%, which we currently aren't doing
for QUIET. Should we?

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
