From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 09:40:28 +0100
Subject: [Buildroot] [PATCH v2] util-linux: fix static builds with uClibc
In-Reply-To: <1453904776-13016-1-git-send-email-ltrimas@synopsys.com> (Lada
 Trimasova's message of "Wed, 27 Jan 2016 17:26:16 +0300")
References: <1453904776-13016-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <87a8nj8pz7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lada" == Lada Trimasova <Lada.Trimasova@synopsys.com> writes:

 > In case of uClibc librt depends on libpthread. In particular
 > timer_create() function uses pthread_XXX(). That means in case
 > of static builds it's required to link not librt alone but
 > together with libpthread. So if checking timer_create function
 > in librt fails, it is necessary to check if timer_create function
 > successfully links with "-lpthread".

 > That issues was spotted in Buldroot autobuilder failures:
 > http://autobuild.buildroot.net/results/759/75960db671807091fe9155aee9e46a6245e32590/
 > http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/

 > 0005-build-sys-use-REALTIME_LIBS.patch is a back-port of upstream
 > https://github.com/karelzak/util-linux/commit/b97edfe731fdf3d3e92e40494b22658207ab6d3c
 > that won't apply cleanly on v2.27.1

 > 0006-buildsys-fix-static-configuration-and-building.patch was just
 > applied upstream, see https://github.com/karelzak/util-linux/commit/71a77ca1ddfdd7e0d14caad9e8a607a83d61a45c

 > Both patches must be removed on util-linux version bump.

 > Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
 > Cc: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

 > ---
 > v1 of this patch http://patchwork.ozlabs.org/patch/549236/ by Alexey Brodkin
 > changes v1->v2:
 > - fix typo in timer_create_function
 > - use libpthread only if necessary.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
