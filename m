From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 17:28:04 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-infra: move the git download
	helper to a script
In-Reply-To: <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 1 Jul 2014 00:26:21 +0200")
References: <cover.1404167061.git.yann.morin.1998@free.fr>
 <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <87fvijbx17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The git download helper is getting a bit more complex. Fixing it in the
 > Makefile when it breaks (like the recent breakage with a non-existing
 > sha1-cset) proves to be challenging, to say the least.

 > Move it into a shell script in support/download/git, which will make
 > it much easier to read, maintain, fix and enhance in the future.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Reviewed-by: Samuel Martin <s.martin49@gmail.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks. I've verified that the (non-gzip'ed) tarball is identical to
what we had before, but I noticed that we no longer delete the temporary
repo in DL_DIR.

Did you do that change on purpose? I don't think we want to keep it, do
we?

-- 
Bye, Peter Korsgaard
