From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:35:28 +0200
Subject: [Buildroot] [PATCH v2,1/8] libselinux: bump to version 2.8
In-Reply-To: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
References: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010213528.4805f9e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 21 Sep 2018 22:50:06 +0200, Fabrice Fontaine wrote:

> - Use DESTDIR=$(HOST_DIR) instead of PREFIX=$(HOST_DIR) to install host
>   variant

Why do you do this ? Setting prefix to $(HOST_DIR) is the right thing
to do for host packages, at least in the normal semantic of prefix and
destdir, as defined by the autotools. I think Marcus patched the
SELinux build system to restore a semantic of PREFIX and DESTDIR that
matched the one of the autotools, but you're now going backward with
doing DESTDIR=$(HOST_DIR).

If the semantic of DESTDIR and PREFIX is standard, then:

 - Target packages should use PREFIX=/usr DESTDIR=$(TARGET_DIR)

 - Host packages should use PREFIX=$(HOST_DIR) and no DESTDIR at all

Of course, this question applies to all SELinux packages in this series.

> - Remove libselinux.so symbolic link for host variant (not needed)

Is this removal really related to the bump ? Why is it unneeded ?
Because the new 2.8 version creates this symlink properly at
installation time ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
