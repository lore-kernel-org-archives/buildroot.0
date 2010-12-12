From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 11:15:53 +0100
Subject: [Buildroot] Problem to add DConf in buildroot
In-Reply-To: <681873.12388.qm@web111105.mail.gq1.yahoo.com>
References: <1292057462.24014.176.camel@coalu.atr>
	<681873.12388.qm@web111105.mail.gq1.yahoo.com>
Message-ID: <20101212111553.4a532842@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Dec 2010 19:37:36 -0800 (PST)
Justin Mark <oilehus@yahoo.com> wrote:

> so there's no implementation for posix_fallocate(). Since this
> function is only called once in Dconf, like this: if (posix_fallocate
> (fd, 0, 1) == 0)
> 
> maybe I can patch the Dconf file, if anyone has an idea on how to
> replace the above code, please let me know.

Just apply this patch from the DConf git repo, which removes
posix_fallocate() and uses ftruncate() instead:

http://git.gnome.org/browse/dconf/commit/?id=e3dd1d8ac6839851cb3015e89cdf39ecb2e2b081

You can add this patch in package/dconf/, and mention in the patch
comment that it is already upstreamed and therefore should be removed
when DConf version is bumped.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
