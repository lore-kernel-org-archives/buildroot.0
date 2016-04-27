From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:06:42 +0200
Subject: [Buildroot] [PATCH 1/1] lksctp-tools: allow building the
 library without the tools
In-Reply-To: <3c566d3c65caadb3a7c897ec56b93c0c@vanbemten.com>
References: <3c566d3c65caadb3a7c897ec56b93c0c@vanbemten.com>
Message-ID: <20160427220642.50950224@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

>  From 6ec58aa8226a212e7b1d7bd7f058f52313f3e0e8 Mon Sep 17 00:00:00
> 2001 From: Lionel Van Bemten <lionel@vanbemten.com>
> Date: Tue, 26 Apr 2016 18:43:55 +0200
> Subject: [PATCH 1/1] lksctp-tools: allow building the library without 
> the tools
> 
> lksctp-tools provides three things:
>    * C language header files (netinet/sctp.h)
>    * a user-space library (libsctp)
>    * some helper utilities around SCTP (sctp_darn,
>      checksctp, sctp_status, withsctp and sctp_test)
> 
> This change makes it possible to
>    * publish the header file without building the library
>      nor the tools (for applications using only system calls)
>    * build the library without the tools (typical usecase
>      for an embedded application)
> 
> Signed-off-by: Lionel Van Bemten <lionel@vanbemten.com>

Thanks for your contribution! However, due to the fact that you sent it
with your webmail, the patch is badly line-wrapped and cannot be
applied. Could you resend it by using "git send-email" (it just
requires a standard SMTP server), which will ensure that the patch is
properly formatted?

Overall regarding the patch, I am wondering if want to go into such
granularity in the installation of this package. The library weights 5
KB, and the total size of the binaries is 84 KB. This really seems very
light, both in build time and in filesystem size consumption. This is
typically the kind of fine-tuning that we generally prefer to do in a
post-build script.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
