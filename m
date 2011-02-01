From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Feb 2011 22:04:16 +0100
Subject: [Buildroot] [PATCH] Add cryptsetup package
In-Reply-To: <1296580718-4746-1-git-send-email-mort@bork.org>
References: <1296580718-4746-1-git-send-email-mort@bork.org>
Message-ID: <20110201220416.5319c07a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Feb 2011 12:18:38 -0500
Martin Hicks <mort@bork.org> wrote:

> +CRYPTSETUP_INSTALL_STAGING = NO
> +CRYPTSETUP_INSTALL_TARGET = YES

Those are not needed, this is the default.

> +#CRYPTSETUP_CONF_OPT = --BLAH

Not needed (but removed by your followup patch that should be merged
here).

> +CRYPTSETUP_DEPENDENCIES = lvm2 libgcrypt popt e2fsprogs

As done by your followup patch, if you have an e2fsprogs dependency
here, you should also have the dependency in the Config.in file.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
