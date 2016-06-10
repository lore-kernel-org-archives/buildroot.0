From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 09:37:22 +0200
Subject: [Buildroot] Numerous ARC related toolchain issues
In-Reply-To: <1465543337.2942.15.camel@synopsys.com>
References: <20160609175017.0d9fae13@free-electrons.com>
 <1465543337.2942.15.camel@synopsys.com>
Message-ID: <20160610093722.714b0240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 07:23:04 +0000, Alexey Brodkin wrote:


> > http://autobuild.buildroot.net/results/d73/d732127d136bacc6bc17b742028691437df7f5f9/build-end.log
> > BFD (GNU Binutils) 2.26.51.20160308 assertion fail elf32-arc.c:1566  
> 
> This is yet another manifestation of PIE invocation on ARC.
> We'll need to disable usage of PIE in linuxpam.

Ah, OK. Shouldn't gcc be modified on ARC to either ignore the pie flag,
or alternatively bail out immediately with a clear error? At least it
would be much more easy to analyze the error than a weird assertion
failure down the road in the linker.

> That one was reported to our toolchain guys and we're looking forward
> to hearing back from them.

ACK!

> As said above we know about all of these and trying to resolve them ASAP.
> Be prepared for patches with fixes next week :)

Awesome, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
