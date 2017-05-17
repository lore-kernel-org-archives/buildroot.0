From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:46:18 +0200
Subject: [Buildroot] [PATCH] fbgrab: explicitly build fbgrab target to
	workaround gzip issue
In-Reply-To: <20170517145251.9047-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 17 May 2017 16:52:51 +0200")
References: <20170517145251.9047-1-peter@korsgaard.com>
Message-ID: <874lwj43fp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #9871
 > gzip reads default command line options from the environment variable GZIP.
 > The fbgrab Makefile internally also uses a GZIP make variable to know what
 > command to use to compress the manpage. Unfortunaly make will export the
 > value of this make variable to the environment if GZIP is already present in
 > the enviroment, confusing gzip (as 'gzip' isn't a valid command line argument).

 > This can either be triggered by users having GZIP set in their environment
 > (E.G.  for custom options), or by enabling BR2_REPRODUCIBLE, where we use
 > this feature to force the -n option (to not store name/timestamp) to gzip.

 > We don't really need to compress the manpage as it isn't installed anyway,
 > so work around the issue by only building the fbgrab application.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
