From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 19:50:39 +0200
Subject: [Buildroot] [PATCH 2/4] libcgroup: fix passing CFLAGS/LDFLAGS
 to configure
In-Reply-To: <1399865226-7054-3-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
 <1399865226-7054-3-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140512195039.467deb85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Mon, 12 May 2014 07:27:04 +0400, Max Filippov wrote:
> LIBCGROUP_CONF_ENV is a string used to pass environment variables to the
> confgiure script, '+=' operator doesn't have any special meaning inside
> it, so CFLAGS+=... is passed to shell, overwriting previous CFLAGS
> value. Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/libcgroup/libcgroup.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
