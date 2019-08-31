From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 10:00:15 +0200
Subject: [Buildroot] [PATCHv3] core: ensure $BIANRES_DIR exist before
 post-image scripts
In-Reply-To: <20190804150707.31675-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 4 Aug 2019 17:07:07 +0200")
References: <20190804150707.31675-1-yann.morin.1998@free.fr>
Message-ID: <87woetg3xs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Brent Generous <bgenerous@impinj.com>
 > When no filesystem is enabled, the $BINARIES_DIR is not created. Yet,
 > the post-image scripts are still run. When those want to generate an
 > image in there, they may fail as the dirctory does not exist (it did
 > exist before we started applying preparatory changes for top-level
 > parallel build, so scripts got to rely on that assumption).

 > Do in target-post-image as we do in the sdk rule: create the directory
 > before calling the scripts.

 > Signed-off-by: Brent Generous <bgenerous@impinj.com>
 > [yann.morin.1998 at free.fr:
 >   - create the directory before calling the scripts
 >   - don't drop the creation in the sdk rule
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
