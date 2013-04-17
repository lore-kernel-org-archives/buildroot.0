From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Apr 2013 10:17:12 +0200
Subject: [Buildroot] modifying buildroot for non- linux freertos
In-Reply-To: <516E3FDA.6040109@mind.be>
References: <516C76DC.3000607@gmail.com>
	<516E3FDA.6040109@mind.be>
Message-ID: <20130417101712.7a06227b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout,

On Wed, 17 Apr 2013 08:23:22 +0200, Arnout Vandecappelle wrote:

>   I'm afraid that the expertise on the internal buildroot toolchain build 
> process is not here anymore. Some buildroot developers understand how the 
> .mk file works, but not really why things were done in that particular way...
> 
>   But anyway, I don't think you really need buildroot for this. Buildroot 
> is meant for building packages for the target, and just builds some host 
> packages that are needed for building some of these packages. I think 
> crosstool-NG is a much better fit for your purpose. It's build system is 
> pretty complex, but I think it's still easier to understand than the 
> buildroot system. Also, crosstool-NG might be interested in adding 
> support for newlib (as an alternative to uClibc) in its core infrastructure.

Crosstool-NG already has support for newlib.

Peter, I agree with Arnout here. The main point of Buildroot is to
build a root filesystem with Linux applications and libraries, and this
is not something you could re-use on FreeRTOS.

You should therefore definitely have a look at Crosstool-NG to produce
a newlib toolchain that works for FreeRTOS.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
