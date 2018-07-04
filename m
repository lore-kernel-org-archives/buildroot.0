From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 4 Jul 2018 20:19:30 +0200
Subject: [Buildroot] Warnings with GCC 7
In-Reply-To: <db2fe3f5-e316-0702-4887-04b0d71fa6ad@grandegger.com>
References: <db2fe3f5-e316-0702-4887-04b0d71fa6ad@grandegger.com>
Message-ID: <7d01b0b2-a40d-4aa6-4959-091592e02a13@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wolfgang,

Le 04/07/2018 ? 09:01, Wolfgang Grandegger a ?crit?:
> Hallo,
> 
> for my build of my "x86_64" Buildroot BSP I switched the GCC version from
> 6 to 7. Since then I get a lot of the following warning messages:
> 
> Warning: host file "./lib/gcc/x86_64-buildroot-linux-gnu/7.3.0/plugin/include/gensupport.h" is touched by more than one package: [u'host-gcc-initial', u'host-gcc-final']
> 
> Is it something serious? Am I doing something wrong?
> I use Buildroot version 2018.02.3.

You are not doing something wrong.

First of all, it's not a gcc warning.
This warning mean that gensupport.h file is provided by two Buildroot packages
(host-gcc-initial and host-gcc-final).

You can ignore them safely for now.

Yann E. Morin is working on a new feature that detect if a file is provided by
more than one package.

Best regards,
Romain

> 
> Thanks,
> 
> Wolfgang.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
