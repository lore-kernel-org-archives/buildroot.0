From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Mar 2020 08:58:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/rcw: add missing host-python
 dependency
In-Reply-To: <20200319065650.28486-1-laurent.hartanerot@gmail.com>
References: <20200319065650.28486-1-laurent.hartanerot@gmail.com>
Message-ID: <20200319085828.464525f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Mar 2020 07:56:50 +0100
Laurent Hartanerot <laurent.hartanerot@gmail.com> wrote:

> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> The rcw tool that compiles RCW sources file need host-python
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/rcw/rcw.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
> index 81e22fff93..be239a7957 100644
> --- a/package/rcw/rcw.mk
> +++ b/package/rcw/rcw.mk
> @@ -10,6 +10,8 @@ RCW_SITE_METHOD = git
>  RCW_LICENSE = BSD-3-Clause
>  RCW_LICENSE_FILES = LICENSE
>  
> +RCW_DEPENDENCIES = host-python

This should be:

HOST_RCW_DEPENDENCIES = host-python

Indeed, rcw is only available as host package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
