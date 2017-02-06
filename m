From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:20:28 +0100
Subject: [Buildroot] Odd comment in openntpd/Config.in
In-Reply-To: <o7aan0$qvb$1@blaine.gmane.org>
References: <o7aan0$qvb$1@blaine.gmane.org>
Message-ID: <20170206192028.6b5ffae6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Feb 2017 17:10:56 +0000 (UTC), Grant Edwards wrote:
> In https://git.busybox.net/buildroot/tree/package/openntpd/Config.in:
> 
> config BR2_PACKAGE_OPENNTPD
>        bool "openntpd"
>        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>        [...]
> 
> comment "openntpd needs a toolchain w/ NPTL"
>         [...]
>         depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 
> Is the "!" in the comment is a typo?

No, what you see is correct. We want the comment to show up when the
toolchain doesn't provide NPTL so that the user knows why openntpd is
not selectable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
