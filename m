From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Sep 2012 16:15:09 +0200
Subject: [Buildroot] Python running very slow with buildroot 2012.05
In-Reply-To: <1346940241.6846.YahooMailNeo@web110707.mail.gq1.yahoo.com>
References: <1346940241.6846.YahooMailNeo@web110707.mail.gq1.yahoo.com>
Message-ID: <20120906161509.2f5fc914@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 6 Sep 2012 07:04:01 -0700 (PDT),
Vimal Menon <vimalmenon@yahoo.com> a ?crit :

> I happened to download and install buildroot (default 2012.05), while
> checking the compiled image, I saw that python runs very slow. for eg:
> 
> On a standard linux, Python 2.7.2 complied with glibc
> 
> #time python -c "print 'hello world'" 
> 
> hello world
> 
> real??? 0m0.077s
> user??? 0m0.068s
> sys???? 0m0.009s
> 
> and the same command ran on the same machine with the buildroot
> compiled image (not via qemu, but with the image booted through
> grub), python takes a lot more time
> 
> #time python -c "print 'hello world'" 
> 
> hello world
> real??? 0m 0.28s
> user??? 0m 0.26s
> sys???? 0m 0.01s
> 
> Why would there be such a huge difference? What might I have done
> wrong? Has anybody of you come across such a situation?

You're not running the C library (by default, Buildroot uses uClibc),
and maybe you're not using the same optimization flags as well.

Try to build a Buildroot system based on glibc, and use the appropriate
optimization flags, maybe it will improve the situation.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
