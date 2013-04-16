From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 23:06:25 +0200
Subject: [Buildroot] [PATCH] support/kconfig: use kconfig-provided way
 of setting the CONFIG_ prefix
In-Reply-To: <1365943997-23601-1-git-send-email-yann.morin.1998@free.fr>
References: <1365943997-23601-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130416230625.1656d877@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Apr 2013 14:53:17 +0200, Yann E. MORIN wrote:
> It's now been a while since it has been possible to build the kconfig
> parser to understand a prefix other than CONFIG_, and even no prefix
> at all, by setting the CONFIG_ macro (#define) at biuld time.
> 
> Just use that, insted of patching, it will make it easier for us in the
> future.

I haven't tested your patch nor looked at it carefully. However, I know
there is a difference between what the kernel does and what Buildroot
does in terms of Kconfig options.

In a kernel Kconfig file, the option names are not prefixed by
'CONFIG_', but when used in Makefiles, they are.

In Buildroot, option names are prefixed with 'BR2_' in both the
Config.in files and in the Makefiles. Does your change takes this into
account?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
