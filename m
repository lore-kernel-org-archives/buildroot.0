From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 11:05:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with gcc 4.8
In-Reply-To: <20200411213318.972221-1-fontaine.fabrice@gmail.com>
References: <20200411213318.972221-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412110553.7809e91c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 23:33:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +SOL_NETLINK is used since commit
> +87a198111af1ea67053895f7435fb99e3cdd2159 resulting in the following
> +build failure with gcc 4.8:
> +
> +src/frame-xchg.c: In function 'frame_watch_group_io_read':
> +src/frame-xchg.c:328:27: error: 'SOL_NETLINK' undeclared (first use in this function)
> +   if (cmsg->cmsg_level != SOL_NETLINK)

I don't understand a failure like this can be related to the compiler
version. Could you clarify?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
