From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 22:22:31 +0200
Subject: [Buildroot] uClibc fails to build with stack smash protection
In-Reply-To: <20130916142501.GA13623@pc-eric>
References: <20130916142501.GA13623@pc-eric>
Message-ID: <20130918222231.78903d56@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 16 Sep 2013 16:25:02 +0200, Eric Le Bihan wrote:

> I can not build uclibc 0.9.33.2 when stack smashing protection is activated and
> GCC 4.7.x is selected. The build fails as follow:
> 
> --8<--
> [...]
>   STRIP -x -R .note -R .comment libc/libc_so.a
>   LD libuClibc-0.9.33.2.so
> libc/libc_so.a(fnmatch.os):(.text+0xe0): undefined reference to `__stack_chk_guard'
> collect2: error: ld returned 1 exit status
> -->8--

Hum, interesting, I am not reproducing the exact same problem (but I
was testing on ARM, with a slightly different defconfig). I believed
I've fixed the problem I was seeing. I've now started a build with your
defconfig, to see if I reproduce the same problem.

So, it's under investigation.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
