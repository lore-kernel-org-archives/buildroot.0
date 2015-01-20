From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 17:41:08 +0100
Subject: [Buildroot] [PATCH] infozip: fix compilation with
 LARGE_FILE_SUPPORT
In-Reply-To: <1421748962-838-1-git-send-email-richard.genoud@gmail.com>
References: <1421748962-838-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20150120174108.5a6ecd37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Tue, 20 Jan 2015 11:16:02 +0100, Richard Genoud wrote:

> +INFOZIP_CFLAGS = -I. -DUNIX
> +
> +ifeq ($(BR2_LARGEFILE),y)
> +INFOZIP_CFLAGS += -DLARGE_FILE_SUPPORT
> +endif

Things are not really clear: the INSTALL file from infozip says:

    This flag should be set automatically on Unix, Win32, and some
    other ports.  Setting NO_LARGE_FILE_SUPPORT turns this flag off.

So according to this, it should not be necessary to set this flag
explicitly. However, after a quick look at the unix/configure script, I
haven't seen any logic doing this. Can you confirm?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
