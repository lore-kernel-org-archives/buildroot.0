From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:35:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] pkg-generic: fix no-check-hash for
 inferred site method
In-Reply-To: <20180629014246.13574-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Thu, 28 Jun 2018 22:42:46 -0300")
References: <20180625014101.13177-1-ricardo.martincoski@gmail.com>
 <20180629014246.13574-1-ricardo.martincoski@gmail.com>
Message-ID: <87fu0ec3js.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently, when the site method is explicitly set to a SCM other than
 > git, the main download is correctly excluded from being hash-checked.
 > But when the site method is inferred from the site uri, the download
 > from a SCM other than git is wrongly being hash-checked.

 > Fix this by moving the code that excludes SCM methods from hash-check
 > below the code that infers the site method.

 > Currently there is no package in the tree that uses inferred site
 > method, and that is why the autobuilder didn't caught this. We had
 > packages using inferred site method in the past, the last one was
 > 'expect', but since they didn't have a hash file (for a license or
 > extra-download for example) the build didn't error out.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 > Changes v1 -> v2:
 >   - improve commit message (Luca Ceresoli);
 >   - collect Reviewed-by & Tested-by tags.
 > ---
 >  package/pkg-generic.mk | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
