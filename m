From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Feb 2015 20:46:17 +0100
Subject: [Buildroot] [PATCH] br2-external: make it available to
	post-{build, image} scripts
In-Reply-To: <1423333701-9949-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 7 Feb 2015 19:28:21 +0100")
References: <1423333701-9949-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878ug97bee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, BR2_EXTERNAL is not always exported to sub-processes that we
 > spawn, like post-build or post-image scripts. This all depends on how
 > the user passes BR2_EXTERNAL; consider the following:

 >   - make BR2_EXTERNAL=/path/to/br2-ext
 >   - BR2_EXTERNAL=/path/to/br2-ext make

 > In the first case, it is just a make variable, not an environment
 > variable, and thus not exported, while in the second case it is an
 > environment variable and gets exported to all sub-processes make may
 > spawn.

 > Explicitly export it using EXTRA_ENV.

 > Reported-by: Julian Scheel <julian@jusst.de>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Julian Scheel <julian@jusst.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
