From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Sep 2010 10:29:07 +0200
Subject: [Buildroot] Prelim RTAI integration help needed
In-Reply-To: <001101cb4e61$e08b4950$a1a1dbf0$@ac.za>
References: <541305813.2396.1283840257891.JavaMail.root@her-mx1>
	<47479143.2416.1283841885076.JavaMail.root@her-mx1>
	<20100907093744.57a706bd@surf>
	<001101cb4e61$e08b4950$a1a1dbf0$@ac.za>
Message-ID: <20100907102907.3b8dbe70@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Sep 2010 09:54:02 +0200 (SAST)
"Herman Theron" <htheron@hmo.ac.za> wrote:

> I'm using the internal buildroot toolchain, standard gcc (version
> 4.3.5?) from 2010.08

Ah. Then your problems 2/ and 3/ are quite strange. I'll try to
reproduce them.

> Regarding first compiling the kernel before RTAI: is it possible to
> set the kernel as a dependency for RTAI to ensure that it is build
> before RTAI? Or is the dependencies just for packages?

You can do :

 RTAI_DEPENDENCIES = linux26

However, this will make sure than Linux gets build prior to RTAI, but
not that RTAI patches are applied to the kernel.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
