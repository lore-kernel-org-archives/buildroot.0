From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Jul 2017 17:18:53 +0200
Subject: [Buildroot] TestIso9660GrubExternal and TestIso9660GrubInternal
	failing
In-Reply-To: <20170724091321.3bc29dcc@windsurf>
References: <20170723092643.GE2917@scaer>
 <5974e7554c7c_30a1600b705951e@ultri3.mail>
 <20170724091321.3bc29dcc@windsurf>
Message-ID: <20170724151853.GA2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-24 09:13 +0200, Thomas Petazzoni spake thusly:
> On Sun, 23 Jul 2017 15:13:41 -0300, Ricardo Martincoski wrote:
> 
> > My local computer has:
> > binutils 2.26.1
> > qemu 2.5.0
> > 
> > Using my local computer the tests TestIso9660GrubExternal and
> > TestIso9660GrubInternal always pass, in current master and also with the 3 grub
> > patches applied.
> > 
> > Using the image buildroot/base I can reproduce the problems:
> > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23825707
> > GRUB requires a working absolute objcopy; upgrade your binutils
> > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23831270
> > ==> System does not boot  
> 
> And my patches did not fix this problem ?

Not really, no.

Without your patches, the build breaks, because objdump fails, and we
catch a build failure.

With your patches, the build seems to succeed, because it does not fail.
However, the generated iso images are about 1GiB in size (instead of
less than 5MiB), and they do not boot. See the summary I've written in:
    http://lists.busybox.net/pipermail/buildroot/2017-July/198940.html

So no, your patches are not sufficient to solve the run-time test.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
