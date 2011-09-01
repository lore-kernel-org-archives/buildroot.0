From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Sep 2011 10:08:00 +0200
Subject: [Buildroot] add pam to busybox
In-Reply-To: <32325731.post@talk.nabble.com>
References: <32325731.post@talk.nabble.com>
Message-ID: <20110901100800.357eb581@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 28 Aug 2011 22:34:09 -0700 (PDT),
brro1 <rotembr@gmail.com> a ?crit :

> hi all
> i tryed to add pam tp busybox. 
> i make pam with build=i386-linux --host=arm-none-linux-gnueabi  and enable
> pam at busybox config file
> when i build the busybox i see this error
> 
> LINK    busybox_unstripped
> 
> Trying libraries: crypt m pam pam_misc
> Failed: -Wl,--start-group -lcrypt -lm -lpam -lpam_misc -Wl,--end-group
> .....
> skipping incompatible /Linux-PAM-0.80/libpam/libpam.a when searching for
> -lpam
> /CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/./../../../arm-none-linux-gnueabi/bin/ld:
> cannot find -lpam
> skipping incompatible /Linux-PAM-0.80/libpam/libpam.so when searching for
> -lpam
> /CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/./../../../arm-none-linux-gnueabi/bin/ld:
> cannot find -lpam
> collect2: ld returned 1 exit status
> make[1]: *** [busybox_unstripped] Error 1
> make[1]: Leaving directory
> 
> how can i fixed this error?

I guess your pam is improperly configured, compiled or installed.

I would recommend to add the necessary pam packages to the Buildroot
packages and then make Busybox depend on it.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
