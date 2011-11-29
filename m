From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Tue, 29 Nov 2011 15:43:12 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
Message-ID: <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The message I get is "Starting EtherCAT master devel modprobe: module
ec_master not found in modules.d ep  failed" and I think the problem is with
module dependencies.

On the Linux PC, in /lib/modules/<source> there is an 'ethercat'
subdirectory.  On the Linux built for the board, there is not.  This is
probably the problem.

Now when installing on Linux PC, the instructions mention doing:

make modules_install install
depmod


and so perhaps I need to do the 'depmod' in Buildroot somehow?
