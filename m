From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:56:53 +0200
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <201007272333.09640.PeterHuewe@gmx.de>
References: <201007272333.09640.PeterHuewe@gmx.de>
Message-ID: <20100727235653.0d2215eb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 27 Jul 2010 23:33:09 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> I've started a new thread, since it seems not related to avr32 in
> particular.

Yep.

> I'm using the atngw100_defconfig on my 64-bit gentoo system with a
> gcc 4.1.2

I was also able to reproduce the issue.

> I've gzipped the whole build log (from a fresh git clone) and
> uploaded it to http://www.hs-augsburg.de/~phuewe/typescript2.gz
> (498K, unzipped 8,8Mb)
> 
> The contens of the host-config.cache can be found at
> http://paste.pocoo.org/show/242433/

Thanks. As I could reproduce, I've started to investigate the problem.
I've summarized my findings at
http://free-electrons.com/~thomas/pub/autoconf-issue.txt, but I don't
have a clear solution yet.

As a temporary fix, you can probably try something like :

HOST_LZO_CONF_OPT = --target=$(GNU_HOST_NAME)

in package/lzo/lzo.mk.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
