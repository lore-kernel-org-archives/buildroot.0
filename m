From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 13:51:11 +0100
Subject: [Buildroot] php-cgi not executing .php-file
In-Reply-To: <4318ea066b1d4331be3d63f7f2357bad@webmail-alfa3071.alfahosting-server.de>
References: <4318ea066b1d4331be3d63f7f2357bad@webmail-alfa3071.alfahosting-server.de>
Message-ID: <20150310135111.7c67cad4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Erichsen,

On Tue, 10 Mar 2015 07:16:21 +0100, Jan Erichsen wrote:

> I am running it on an Altera DE2-115 Board using Nios II as processor. I
> used an external toolchain to build the system (toolchain-mmu/x86-linux2
> from Nios II Linux Tarball @
> ftp://ftp.altera.com/outgoing/nios2-linux/20120802/). 

Just curious, which of these toolchains are you using exactly?

> My settings in buildroot are as follow: 
> 
> [*] php
>  Extensions --->
>  [*] Session
>  [*] zlib
>  [*] JSON
>  [*] sockets
>  [*] Posix
>  Interface (CGI) --> 

I just tested this here in ARM Qemu, with the same configuration as you
for PHP, and it works just fine:

===

# php-cgi -T -f test.php 
X-Powered-By: PHP/5.5.22
Content-type: text/html

Hello from Nios II
Elapsed time: 0.021249 sec

===

Can you provide your complete Buildroot .config, so that we can try to
reproduce more precisely what's going on?

However, I don't have NIOS II hardware myself, so I won't be able to
reproduce on this specific architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
