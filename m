From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 19:50:56 +0200
Subject: [Buildroot] [PATCH 3/4] ebtables: fix passing CFLAGS to
 configure
In-Reply-To: <1399865226-7054-4-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
 <1399865226-7054-4-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140512195056.1a216171@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Mon, 12 May 2014 07:27:05 +0400, Max Filippov wrote:
> EBTABLES_K64U32 is a string passed directly to the configure script,
> '+=' operator doesn't have any special meaningi inside it, so
> CFLAGS+=-DKERNEL_64_USERSPACE_32 is passed to shell, overwriting previous
> CFLAGS value.
> 
> Replace CFLAGS+="-DKERNEL_64_USERSPACE_32" with -DKERNEL_64_USERSPACE_32
> and pass CFLAGS="$(TARGET_CFLAGS) $(EBTABLES_K64U32)".
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/ebtables/ebtables.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
