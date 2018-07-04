From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jul 2018 21:14:47 +0200
Subject: [Buildroot] Warnings with GCC 7
In-Reply-To: <7d01b0b2-a40d-4aa6-4959-091592e02a13@gmail.com>
References: <db2fe3f5-e316-0702-4887-04b0d71fa6ad@grandegger.com>
 <7d01b0b2-a40d-4aa6-4959-091592e02a13@gmail.com>
Message-ID: <20180704191447.GC2595@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain. Wolfgang, All,

On 2018-07-04 20:19 +0200, Romain Naour spake thusly:
> Le 04/07/2018 ? 09:01, Wolfgang Grandegger a ?crit?:
> > Hallo,
> > 
> > for my build of my "x86_64" Buildroot BSP I switched the GCC version from
> > 6 to 7. Since then I get a lot of the following warning messages:
> > 
> > Warning: host file "./lib/gcc/x86_64-buildroot-linux-gnu/7.3.0/plugin/include/gensupport.h" is touched by more than one package: [u'host-gcc-initial', u'host-gcc-final']
> > 
> > Is it something serious? Am I doing something wrong?
> > I use Buildroot version 2018.02.3.
> 
> You are not doing something wrong.
> 
> First of all, it's not a gcc warning.
> This warning mean that gensupport.h file is provided by two Buildroot packages
> (host-gcc-initial and host-gcc-final).
> 
> You can ignore them safely for now.

And especially since this is a case where it is totally valid. We need
to find a solution to avoid that false positive.

To be noted: we previously used a hash of the file to see if files were
touched, so that situation would not ber caught. But it was pretty
costly, so we now use the timestamps, which falsely detect a file as
being modified when it is not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
