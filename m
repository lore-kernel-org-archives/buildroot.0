From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 17:56:32 +0200
Subject: [Buildroot] [PATCH] infra: BR2_PREFER_STATIC_LIB now selects
 static building of packages
In-Reply-To: <1413128040-1860-1-git-send-email-abrodkin@synopsys.com>
References: <1413128040-1860-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141012175632.26e3bd89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sun, 12 Oct 2014 17:34:00 +0200, Alexey Brodkin wrote:
> With time BR2_PREFER_STATIC_LIB option meaning changed from "prefer static
> libs when possible" to "do not build dynamic libs and build statically linked
> applications".
> 
> This patch changes variable description and takes care of uClibc settings so
> it doesn't build shared libs.
> 
> Note that variable name is kept unchanged on purpose - it will be modified later
> when real "prefer static" mode will be introduced.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in                             | 14 ++++++++------
>  package/uclibc/uClibc-0.9.31.config   |  1 -
>  package/uclibc/uClibc-0.9.33.config   |  1 -
>  package/uclibc/uClibc-snapshot.config |  1 -
>  package/uclibc/uclibc.mk              | 11 +++++++++++
>  5 files changed, 19 insertions(+), 9 deletions(-)

This should definitely be two separate patches. One updating the
BR2_PREFER_STATIC_LIB description, and one making sure that uClibc
obeys to the correct semantic of BR2_PREFER_STATIC_LIB.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
