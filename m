From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:07:23 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: enable PIC/PIE,
 RELRO and SSP by default
In-Reply-To: <20191025195456.8583-1-fontaine.fabrice@gmail.com>
References: <20191025195456.8583-1-fontaine.fabrice@gmail.com>
Message-ID: <20191026150723.2f7ffbad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 25 Oct 2019 21:54:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enhance security by enabling PIC/PIE, RELRO and SSP by default.
> 
> This could help making IoT more secure and fight againt the assumption
> that buildroot does not support binary hardening (see
> https://cyber-itl.org/2019/08/26/iot-data-writeup.html)

We briefly discussed this article at the Buildroot meeting (you should
have been there!), and one thing that came up is that the authors of
this article say that the binaries were built by Buildroot, but
considering the products that are all WiFi routers, most likely they
were in fact built by OpenWRT, not Buildroot.

Some people confuse OpenWRT with Buildroot, because OpenWRT was forked
long time ago from Buildroot, and it is still sometimes called "OpenWRT
Buildroot". However, OpenWRT is a completely separate project from
Buildroot, and therefore whatever we (Buildroot community) will change
in terms of default values for hardening features, will not change what
OpenWRT will do, and therefore will not have any effect on what most
WiFi routers are using.

Could you perhaps contact the author of the article, and ask them how
they concluded that Buildroot had been used, and whether it wasn't in
fact OpenWRT ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
