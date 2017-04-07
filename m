From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 10:16:18 +0200
Subject: [Buildroot] [PATCH v4 1/1] syslinux: build with the target
 toolchain
In-Reply-To: <20170407100630.1861b8cc@armant.office.greenbone.net>
References: <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
 <1491473086-16647-1-git-send-email-benoit.allard@greenbone.net>
 <20170406171323.13d11cc6@free-electrons.com>
 <20170407100630.1861b8cc@armant.office.greenbone.net>
Message-ID: <20170407101618.4b32f70a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 10:06:30 +0200, Beno?t Allard wrote:

> > See the /lib/ld-musl-x86_64 interpreter? This means it has been built
> > against the musl C library, and therefore with the target toolchain.
> > 
> > What is this program useful for?  
> 
> As I understand it, this is an "installer" you should run on the target
> machine in order to install the syslinux bootloader. There should be (?)
> another one "extlinux" next to it that is suitable for installing the
> bootloader on an ext2 (4?) filesystem (that is the binary that has
> dependency on libuuid).

If this program is not useful on the host (and therefore it is expected
to have it built with the target toolchain), then we should not install
it in HOST_DIR. On my side, I am fine with a post-install hook that
simply deletes it, provided it comes with a comment that explains why.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
