From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:32:54 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/Makefile.in: expose
 CONFIG_DIR to post-build/post-image scripts
In-Reply-To: <20210504205139.1055360-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 4 May 2021 22:51:32 +0200")
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-2-thomas.petazzoni@bootlin.com>
Message-ID: <878s4pxpm1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Sometimes, post-build or post-image scripts need to reinvoke
 > Buildroot's make, for example to execute "make printvars".

 > However, so far none of the variables exposed to post-build/post-image
 > scripts allowed to do that in a way that worked for both in-tree and
 > out-of-tree builds. Indeed:

 >  * "make printvars" would work for in-tree builds, but not out of tree
 >    builds

 >  * "make -C ${O} printvars" would work for out-of-tree builds, but not
 >    in-tree builds

 > In order to solve this, this commit exposes $(CONFIG_DIR) to
 > post-build/post-image scripts, through the EXTRA_ENV variable.

 > The documentation is updated accordingly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

While this is a new feature, it is arguably something we should have
fixed a long time ago and it seems fairly low risk, so committed to
2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
