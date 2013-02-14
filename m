From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 14:39:57 +0100
Subject: [Buildroot] [PATCH v3] strongswan: new package
In-Reply-To: <1360848306-4577-1-git-send-email-jezz@sysmic.org>
References: <20130212122551.46e895b6@skate>
 <1360848306-4577-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130214143957.1095407a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 14 Feb 2013 14:25:06 +0100, J?r?me Pouiller wrote:
> strongSwan is an OpenSource IPsec implementation for the
> Linux operating system. It is based on the discontinued
> FreeS/WAN project and the X.509 patch.
> 
> The focus is on:
>      - simplicity of configuration
>      - strong encryption and authentication methods
>      - powerful IPsec policies supporting large and complex VPN networks
> 
> http://www.strongswan.org/
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

It looks pretty good now, thanks!

Did you test with a minimal uClibc configuration, i.e no large file, no
IPv6, no C++, no wide char, no locales, to make sure that you don't
need to depend on specific toolchain options?

I don't remember if I asked you this question already or not. I might
at least suspect that the code may not build if IPv6 support is
disabled in the toolchain.

If you don't want to spend time building a minimal uClibc toolchain,
you can use the one at
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2012.11.1-1.tar.bz2
as an external toolchain.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
