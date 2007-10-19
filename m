From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Fri, 19 Oct 2007 13:22:14 +0200
Subject: [Buildroot] FILE_OFFSET_BITS=64 and errors [quick dirty
	solution]
In-Reply-To: <47188893.80503@asist.si>
References: <47188893.80503@asist.si>
Message-ID: <47189366.6000209@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In file ./build_powerpc/udev-114/Makefile I simply removed 
-D_FILE_OFFSET_BITS=64.

#Dirty fix to disable FILE_OFFSET_BITS=64
CFLAGS        += -g -Wall -pipe -D_GNU_SOURCE


Babarovic Ivica wrote:
> Hi!
>
> I wonder where is this var defined. I get errors complainig i don't have
> 64 bit support enabled in uclibc. Well I don't want support for 64 bits
> and I don't need support for large files.
>
> I'll attach error log.
>
>
> $ svn info
> Path: .
> URL: svn://uclibc.org/trunk/buildroot
> Repository Root: svn://uclibc.org
> Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
> Revision: 20295
> Node Kind: directory
> Schedule: normal
> Last Changed Author: ulf
> Last Changed Rev: 20294
> Last Changed Date: 2007-10-19 00:59:44 +0200 (Fri, 19 Oct 2007)
> Properties Last Updated: 2007-10-19 10:44:52 +0200 (Fri, 19 Oct 2007)
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
