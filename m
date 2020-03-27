From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 22:48:11 +0100
Subject: [Buildroot] [PATCHv2] package/localedef: fix dependencies
In-Reply-To: <20200317211102.12842-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 17 Mar 2020 22:11:02 +0100")
References: <20200317211102.12842-1-yann.morin.1998@free.fr>
Message-ID: <87k135fp0k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > localedef needs bison to satisfy a .y.c rule to generate a parser for
 > plural forms, to ultimately generate data for the target. So we do not
 > want to depend on the host-provided bison; we want to build our own (for
 > reproducibility).

 > localedef is a host-only package, and dependencies are not inherited
 > from the target variant, so we need to make them explicit host
 > dependencies.

 > And move the assignment after all the download-related variables.

 > Reported-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - do not depend on the host provided bison

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
