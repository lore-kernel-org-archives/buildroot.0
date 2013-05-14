From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 11:16:51 +0200
Subject: [Buildroot] [PATCH] linux: CONFIG_KERNEL_LZO option requires
 host-lzop
In-Reply-To: <CAHkwnC_KQ30thPqy3WA3wGpOipMfmf6rk-HY78sf=Dus8F9ExQ@mail.gmail.com>
References: <1368431920-22020-1-git-send-email-fabio.porcedda@gmail.com>
 <20130513100421.4a84d09f@skate>
 <CAHkwnC_KQ30thPqy3WA3wGpOipMfmf6rk-HY78sf=Dus8F9ExQ@mail.gmail.com>
Message-ID: <20130514111651.0c61cb24@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 14 May 2013 11:02:32 +0200, Fabio Porcedda wrote:

> I know that the best solution is to depend on the linux kernel
> configuration, but I don't know a way to do that cleanly.
> Maybe some clever idea?
> 
> Adding mandatory dependency is the simplest and always works but as
> you pointed it always builds host-lzop even when is not used.
> 
> Choosing the compression within buildroot doesn't wok when using a
> defconfig or linux-xconfig target but at least does build host-lzop
> only when is used.

It does work, as long as the compression type is enforced by Buildroot,
regardless of what was selected by linux-xconfig or the defconfig.
That's what we do today for DEVTMPFS/DEVTMPFS_MOUNT/INITRAMFS_SOURCE
for example.

However, before going ahead and implementing that, I'd like to have the
opinion of Peter and maybe others.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
