From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 19:51:06 +0200
Subject: [Buildroot] [PATCH 4/4] sysstat: fix passing CFLAGS to make
In-Reply-To: <1399865226-7054-5-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
 <1399865226-7054-5-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140512195106.7af8dc5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Mon, 12 May 2014 07:27:06 +0400, Max Filippov wrote:
> SYSSTAT_MAKE_OPT is a string used to pass options to make, '+=' operator
> doesn't have any special meaning inside it, so CFLAGS+=... is passed to
> shell, overwriting previous CFLAGS value.
> 
> Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/sysstat/sysstat.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
