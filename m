From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2011 16:54:22 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
 <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
 <20111128161124.0f95d0d4@skate>
 <001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111128165422.49361aed@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 09:19:29 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> My understanding from the tutorial at
> http://buildroot.uclibc.org/buildroot.html#add_packages was that
> 
> ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel
> 
> specifies the path (whether it is http or filesystem)
> 
> and
> 
> ETHERCAT_SOURCE = etherlabmaster.tar.bz2
> 
> specifies the file name.
> 
> Then I thought Buildroot would put ETHERCAT_SITE + ETHERCAT_SOURCE to come
> up with the location of the file.  This is not correct?

Woops, you're right, my bad. The manual is obvisouly correct.

You should use :

ETHERCAT_VERSION = 3.3
ETHERCAT_SITE = http://foobar.com/somewhere/
ETHERCAT_SOURCE = ethercat-$(ETHERCAT_VERSION).tar.bz2

> ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
> etherlabmaster.tar.bz2

Why are you using a local directory ? You *really* should be using a
tarball available from http or ftp so that you can later contribute
your package to Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
