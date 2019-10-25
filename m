From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 22:04:45 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: enable PIC/PIE,
 RELRO and SSP by default
In-Reply-To: <20191025195456.8583-1-fontaine.fabrice@gmail.com>
References: <20191025195456.8583-1-fontaine.fabrice@gmail.com>
Message-ID: <20191025220446.7e21071d@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 21:54:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enhance security by enabling PIC/PIE, RELRO and SSP by default.
> 
> This could help making IoT more secure and fight againt the assumption
> that buildroot does not support binary hardening (see
> https://cyber-itl.org/2019/08/26/iot-data-writeup.html)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I'm not sure we're ready to do that. A first step would be to add some
randomization in the autobuilders to test those features (by improving
./utils/genrandconfig). This will allow us to test that enabling those
features doesn't break too many packages. Then we can discuss at
enabling it by default, even though I find that it kind of breaks the
logic that Buildroot does something minimal/basic by default.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
