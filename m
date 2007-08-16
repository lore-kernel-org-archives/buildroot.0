From: Brad House <brad@mainstreetsoftworks.com>
Date: Thu, 16 Aug 2007 09:03:09 -0400
Subject: [Buildroot] Allowing hotplug and udev in the same root fs???
In-Reply-To: <1187220251.2429.2.camel@elrond.sweden.atmel.com>
References: <1187220251.2429.2.camel@elrond.sweden.atmel.com>
Message-ID: <46C44B0D.7040507@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmm, I thought udev and hotplug worked together.  Thought it
was something along the lines that hotplug would do the triggering
of driver module loading based on what new pci/usb ids showed up
on the system, since udev doesn't actually perform module loading
afaik.  Hotplug is/was also responsible for firmware loading, but
I'm not sure if that is true anymore ...

Truthfully, I can't provide much to this discussion as I haven't
really bothered to look into it for a while...

-Brad

Ulf Samuelsson wrote:
> Does it make sense to allow both Hotplug and udev?
> Is it not so that you either have hotplug (real old...) or udev?
> 
> The following then would make sense.
> 
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> Index: package/hotplug/Config.in
> ===================================================================
> --- package/hotplug/Config.in   (revision 19502)
> +++ package/hotplug/Config.in   (arbetskopia)
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOTPLUG
>         bool "hotplug"
>         default n
> +       depends on !BR2_PACKAGE_UDEV
>         help
>           Plug in new devices and use them immediately.
>  
> -------------------------------------------------------------------
> 
> Comments ?
> 
> BR
> Ulf Samuelsson
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
