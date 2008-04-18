From: Brent Cook <bcook@bpointsys.com>
Date: Fri, 18 Apr 2008 13:12:08 -0500
Subject: [Buildroot] gcj on any platform
In-Reply-To: <a9067d050804181012h7b686733i4bcfde2cfb9f253e@mail.gmail.com>
References: <a9067d050804181012h7b686733i4bcfde2cfb9f253e@mail.gmail.com>
Message-ID: <200804181312.08925.bcook@bpointsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 April 2008 12:12:18 Azra Aiyl wrote:
> Hi,
>
> While looking through this archive I can see at least 3 persons who
> try to compile a gcj (they got no answers). I've tried the same thing
> for ppc and i386 but always get the same compile error. While googling
> i was able to collect the following statements.
>
> - libgcj needs unicode
> - uClibc does not support unicode
> - glibc supports unicode
> - glibc does not support full statical linking
>
> I conclude from this statements:
>
> - it is currently not possible no build a gcj with uclibc
> - nor is it possible to build a statically linked programm with
> glibc-gcj and let it run on a platform with uclibc
>
> If anyone here says I'm wrong then I'll try to build it on my own

As a workaround, you could include shared glibc with your libgcj app in a 
chroot environment on top of your uclibc environment. This would be about 
as resource-heavy as a statically linked executable, if memory is not a 
limiting factor.
