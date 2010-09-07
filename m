From: Herman Theron <htheron@hmo.ac.za>
Date: Tue, 7 Sep 2010 11:08:14 +0200 (SAST)
Subject: [Buildroot] Prelim RTAI integration help needed
In-Reply-To: <20100907102907.3b8dbe70@surf>
References: <541305813.2396.1283840257891.JavaMail.root@her-mx1>	<47479143.2416.1283841885076.JavaMail.root@her-mx1>	<20100907093744.57a706bd@surf>	<001101cb4e61$e08b4950$a1a1dbf0$@ac.za>
	<20100907102907.3b8dbe70@surf>
Message-ID: <003901cb4e6c$3dd561e0$b98025a0$@ac.za>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Please let me know if I must send you specific config files, etc to be
able to reproduce the problem.

Thanks

Herman

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of Thomas Petazzoni
Sent: 07 September 2010 10:29 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] Prelim RTAI integration help needed

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
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
