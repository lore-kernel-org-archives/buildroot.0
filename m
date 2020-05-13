From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 21:58:40 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: introduce spi linux
 tools
In-Reply-To: <87r1vn6840.fsf@tarshish>
References: <20200513150324.330435-1-eugen.hristev@microchip.com>
 <87tv0j6etz.fsf@tarshish>
 <c577cbdf-b84a-4af8-8d55-f2759e13c137@microchip.com>
 <87r1vn6840.fsf@tarshish>
Message-ID: <20200513195840.GZ12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-05-13 20:46 +0300, Baruch Siach spake thusly:
> Hi Eugen,
> 
> On Wed, May 13 2020, Eugen.Hristev at microchip.com wrote:
> > On 13.05.2020 18:21, Baruch Siach wrote:
> >> On Wed, May 13 2020, Eugen Hristev wrote:
> >>> Add new linux tools package : spi. This is present in the Linux Kernel since
> >>> 4.5.
> >>> It now includes spidev_test and spidev_fdx tools.
> >> We have a package for spidev_test already. Consider adding spidev_fdx to
> >> that package instead.
> > While I understand your point, you should also consider that all linux 
> > tools have a specific way to build in buildroot, and this I think should 
> > be consistent.
> Agreed.
> > And spi tools would be not just spidev_test and might include future 
> > applications, which may or may not have their place in the same spot as 
> > spidev_test .
> In that case I think you should remove the spidev_test package.

Yes, I like it that we can drop spidev_test.

But do it multi-step:

  - intropduce spidev as a linux-tool
  - drop the standalone spidev_test

Do not forget to add legacy handling for it, though; see Config.in.legacy.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
