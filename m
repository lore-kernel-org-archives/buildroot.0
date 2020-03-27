From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 00:06:39 +0100
Subject: [Buildroot] [PATCH] boot/barebox-aux: exclude git downloads
 from hash check
In-Reply-To: <20200319215657.5419-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 19 Mar 2020 22:56:57 +0100")
References: <20200319215657.5419-1-yann.morin.1998@free.fr>
Message-ID: <87lfnle6tc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When barebox, and thus barebox-aux, are downloaded from a git tree, then
 > barebox-aux download fails because a hash check is attempted on the
 > downloaded archive:

 >     Could not fetch special ref 'v2020.03.0'; assuming it is not special.
 >     ERROR: No hash found for barebox-aux-v2020.03.0.tar.gz

 > This is because we only exclude from the check the archive of the bare
 > barebox:

 >     BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)

 > However, the default name of an archive is based on the package name,
 > which for barebox-aux is not 'barebox'.

 > Since barebox-aux really uses the exact same source as the bare barebox,
 > it should also share the archive name.

 > This has two direct consequences and advantages:

 >   - the hash check is completely avoided for the barebox-aux archive;

 >   - the barebox-aux archive is not downloaded as it is already
 >     downloaded for barebox.

 > Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Note: that last claim about the download being done only once requires
 > that a previous patch be applied first (with typoes fixed):
 >     https://patchwork.ozlabs.org/patch/1258482/

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
