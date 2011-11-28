From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2011 16:11:24 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
 <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111128161124.0f95d0d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 09:07:54 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel

This looks like a directory name and not a file. You have two choices
for building from local sources :

 * The 'file' method, where ETHERCAT_SITE needs to be a tarball location

 * The 'local' method, where ETHERCAT_SITE needs to be a directory

But since ETHERCAT is available online, you really should be doing
something like :

ETHERCAT_SITE = http://somesite.com/sometarball.tar.gz

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
