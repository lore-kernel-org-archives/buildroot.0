From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Nov 2014 10:10:50 +0000
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <20141122193924.34aa21ec@free-electrons.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141122193924.34aa21ec@free-electrons.com>
Message-ID: <5473042A.8020505@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 11/22/2014 06:39 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Fri, 21 Nov 2014 15:33:07 +0000, Vicente Olivert Riera wrote:
> 
>> +LIBFM_EXTRA_VERSION = 1.2.3
>> +LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
> 
> This is the exact same tarball as the one used for the libfm package:
> 
> +LIBFM_VERSION = 1.2.3
> +LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
> +LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
> 
> Why do we have two different packages? Is it because libfm full version
> needs menu-cache, and menu-cache needs libfm-extra?

Yes, that is exactly the reason. Look for instance how is done in
LinuxFromScratch:

http://www.linuxfromscratch.org/blfs/view/svn/lxde/libfm-extra.html

They build libfm-extra first, then menu-cache and then libfm. I did
exactly the same.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
