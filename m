From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 11:03:43 +0200
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <68fc2553-681c-2d7c-8b32-e425073964b6@free.fr>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf> <20180824070203.GK9365@scaer>
 <68fc2553-681c-2d7c-8b32-e425073964b6@free.fr>
Message-ID: <20180828110343.457a2279@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 18:31:53 +0200, Julien Boibessot wrote:

> > Matthew, Julien, could you have a look at what is causing those on your
> > autobuilders?  
> 
> I already signaled this problem on BR IRC chan. ;-)
> When occurring, my autobuilder is stuck with a "conftest" process
> consuming 100% of the CPU, indefinitely.
> 
> When building host-libsodium alone, all is fine.
> 
> When it fails with 100% CPU usage I can only kill the process and don't
> see what is happening. I would say this problem is quite recent (3
> months ?).
> 
> What can I do to look further ?

conftest is the typical name of the programs built and run
by ./configure scripts to check/detect whatever they are told to check.
It would be useful to see the contents of the config.log file of
host-libsodium when the problem occurs, to see which particular test is
failing.

Also, is it something you can reproduce with br-reproduce-build
(https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build),
using the hash of a build that timed out for you ? Maybe building
host-libsodium alone doesn't exhibit the problem, and it only appears
when a certain set of dependencies has been built prior to
host-libsodium.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
