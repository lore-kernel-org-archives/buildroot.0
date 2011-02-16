From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Feb 2011 19:56:45 +0100
Subject: [Buildroot] problems linking when using -lSDL
In-Reply-To: <20110216183835.GA16325@buinea.com>
References: <20110216183835.GA16325@buinea.com>
Message-ID: <20110216195645.35c67e1b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Feb 2011 10:38:35 -0800
Steve Morris <morris@buinea.com> wrote:

> LDFLAGS =
> LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sys-root/lib
> LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sys-root/usr/lib
> LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sysroot/lib
> LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sysroot/usr/lib
> LDFLAGS += -L/lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/lib
> LDFLAGS += -L/lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/usr/lib

Remove all those LDFLAGS, and do :

CFLAGS += --sysroot=/lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
