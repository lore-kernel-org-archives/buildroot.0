From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:28:04 +0100
Subject: [Buildroot] [PATCH] core/pkg-infra: tweak only .la files that
 need it
In-Reply-To: <20190210213818.5232-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 10 Feb 2019 22:38:18 +0100")
References: <20190210213818.5232-1-yann.morin.1998@free.fr>
Message-ID: <871s2stmrv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when we tweak the .la files, we do so unconditionally on all
 > .la files, even those we already fixed in a previous run.

 > This has the nasty side effect that each .la file will be reported as
 > being touched by all packages that are installed after the package that
 > actually installed said .la file.

 > Since we can't easily know what files were installed by a package (that
 > is an instrumentation hook, and comes after the mangling), we use a
 > trick (like is done in libtool?): we do mangle all files, each into a
 > temporary location; if the result is identical to the input, we remove
 > the temporary, while if the result differs from the output, we move
 > the temporary to replace the input.

 > Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - drop spurious trailing semicolon on sed command line  (Thomas DS.)
 >   - use $$(find ...) instead of $(find ...), as we don't want it to be
 >     evaluated by the Makefile, but by the shell
 >   - silence the output of cmp
 >   - typoes in commit log  (Thomas DS.)

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
