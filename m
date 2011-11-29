From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2011 15:36:19 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111129153619.4f080721@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 29 Nov 2011 08:28:56 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> #############################################################
> #
> # EtherCAT
> #
> #############################################################
> ETHERCAT_VERSION = 1.0
> ETHERCAT_SOURCE = etherlabmaster-1.0.tar.bz2
> ###ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
> ETHERCAT_SITE = http://127.0.0.1/home/user1/Desktop/EtherCAT4Atmel/

That will work, but you still seem to not understand how to do this
properly. I've already explained in the past e-mails. You should do 

ETHERCAT_SITE = http://www.ethercat.org/somedirectory/

And then if you really need to hack EtherCAT locally, use the source
override feature.

> Regarding how the EtherCAT build system works, how do I answer this for you?
> Are there some Makefiles that would explain it?  Some other file I can post
> that will explain it?

I'll try to look at the EtherCAT build system, but I'm quite busy at
the moment. The INSTALL file has some details, but to build within
Buildroot, probably quite a few environment variables have to be passed.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
