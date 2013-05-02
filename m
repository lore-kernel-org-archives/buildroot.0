From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 17:20:08 +0200
Subject: [Buildroot] [PATCH] iw: bump to version 3.10
In-Reply-To: <1367504638-21071-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367504638-21071-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130502172008.73087748@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  2 May 2013 11:23:58 -0300, Gustavo Zacarias wrote:

> +IW_MAKE_OPT = CC=$(TARGET_CC) LD=$(TARGET_LD) LDFLAGS=$(TARGET_LDFLAGS)

Missing quotes, will break when ccache is enabled. You should probably
be using $(TARGET_CONFIGURE_OPTS) instead.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
