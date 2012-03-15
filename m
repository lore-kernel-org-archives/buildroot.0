From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 08:10:46 +0100
Subject: [Buildroot] [PATCH] Downloadsite DHCP changed
In-Reply-To: <1331783706-15520-1-git-send-email-markus.kaindl@stusta.mhn.de>
References: <1331783706-15520-1-git-send-email-markus.kaindl@stusta.mhn.de>
Message-ID: <20120315081046.5e88ba0a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

Excellent! You are almost there with your Git patch. You need to fix
two final things:

 * The short description of the patch should rather describe what the
   patch does rather than the reason why it does. Something like
   "dhcp: update HTTP site location" or similar. But that's just a
   matter of taste.

 * Our commit log must include a Markus Kaindl
   <markus.kaindl@stusta.mhn.de> line. So basically, your commit log
   should look like:

=====================================================================
dhcp: update HTTP site location

Signed-off-by: Markus Kaindl <markus.kaindl@stusta.mhn.de>
=====================================================================

And then your patch will be perfect.

I am sorry to be annoying about this, but those are the rules we all
follow in the Buildroot community, and I think it is a good idea to
explain them to new contributors.

Thanks for your work and persistence!

Thomas

Le Thu, 15 Mar 2012 04:55:06 +0100,
Markus Kaindl <markus.kaindl@stusta.mhn.de> a ?crit :

> ---
>  package/dhcp/dhcp.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 10bdc2e..9ec27d3 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -5,7 +5,7 @@
>  #############################################################
>  
>  DHCP_VERSION  = 4.1-ESV-R4
> -DHCP_SITE     = http://ftp.isc.org/isc/dhcp
> +DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_CONF_ENV = ac_cv_file__dev_random=yes
>  DHCP_CONF_OPT = \
>  	--localstatedir=/var/lib/dhcp \



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
