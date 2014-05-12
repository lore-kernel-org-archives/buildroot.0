From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 19:50:22 +0200
Subject: [Buildroot] [PATCH 1/4] sqlcipher: fix passing CFLAGS/LDFLAGS
 to configure
In-Reply-To: <1399865226-7054-2-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
 <1399865226-7054-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140512195022.7443ed89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Mon, 12 May 2014 07:27:03 +0400, Max Filippov wrote:
> SQLCIPHER_CONF_ENV is a string used to pass environment variables to the
> confgiure script, '+=' operator doesn't have any special meaning inside
> it, so CFLAGS+=... is passed to shell, overwriting previous CFLAGS
> value. Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".
> 
> Fixes:
>   http://autobuild.buildroot.net/results/dbf/dbf947ad6442fa8e57201ffcc96871361bf39ad7/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/sqlcipher/sqlcipher.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
