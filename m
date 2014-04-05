From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 14:42:55 +0200
Subject: [Buildroot] host-binutils broken?
In-Reply-To: <533FF599.70104@bergerie>
References: <533EED51.9090204@freescale.com>
 <CAMo8BfJhxpqBFmFeADF97cKbANtzNFYy2_L=wrMjLn8zUtinyw@mail.gmail.com>
 <loom.20140404T230545-334@post.gmane.org>
 <CAMo8BfKN8NAsfS1aM31TzjUvfJ1EFRQTZVnxH4U2M0BN0XWq1A@mail.gmail.com>
 <533FF599.70104@bergerie>
Message-ID: <20140405144255.7c60ff32@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent,

On Sat, 05 Apr 2014 14:22:49 +0200, Vincent wrote:

> Thanks for re-trying. You are lucky that it works for you :)
> 
>  > What's your makeinfo version?
> 
> This is:
> 
>    makeinfo (GNU texinfo) 5.2
> 
> ...on debian testing, from package texinfo 5.2.0.dfsg.1-2.
> 
> Does this call for a host-texinfo / host-makeinfo package?

We already have, and in some situations, binutils depends on it:

ifeq ($(BINUTILS_FROM_GIT),y)
BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
HOST_BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
endif

I believe what's happening is that the patches added by Max are making
certain files newer, which triggers a rebuild of the documentation in
binutils, which normally doesn't happen with release tarballs.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
