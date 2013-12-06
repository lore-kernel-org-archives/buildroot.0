From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 15:24:05 +0100
Subject: [Buildroot] [PATCH v2] manual: do not generate .pyc files
In-Reply-To: <1386286917-5277-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 6 Dec 2013 00:41:57 +0100")
References: <1386286917-5277-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fvq6cb22.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Python saves a pre-compiled support/scripts/kconfiglib.pyc file
 > side-to-side with the corresponding .py file.

 > This does not work if the Buildroot source tree is read-only (but
 > this is not an error for Python, which keep going OK).

 > But this may cause  issues for out-of-tree builds in case the same
 > Buildroot source tree is shared by many builds.

 > Also, 'make clean' currently does not clean this file, and out-of-tree
 > builds can remove it either, at the risk of causing issues for other
 > out-of-tree builds running at the same time.

 > Just tell Python not to generate .pyc files:
 >   - call the script via python, don't use the sha-bang
 >   - thus, make the script non-executable, and remove the sha-bang

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > ---
 > Changes v1->v2:
 >   - fix typo in commit log  (Samuel)

Committed, thanks.

-- 
Bye, Peter Korsgaard
