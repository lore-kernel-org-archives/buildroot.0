From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 28 Aug 2007 06:37:39 +0200
Subject: [Buildroot] Make wants to read local libraries instead
	of	buildroot libraries
In-Reply-To: <b6838d3a0708271748k6a7757b4u79c1beb62022fa6e@mail.gmail.com>
References: <b6838d3a0708271748k6a7757b4u79c1beb62022fa6e@mail.gmail.com>
Message-ID: <1188275859.4056.22.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-08-27 klockan 20:48 -0400 skrev Daniel Frey:
> All,
> 
> I have been struggling with resolving dependencies in my buildroot
> project.  For libraries that have already been pre-configured in the
> package directory, I have no issue with.  For something new, libvorbis
> (requires libogg), i have modified libogg or xml2 make files, but the
> linker still wants to look on the local filesystem version of libogg
> (usr/lib/libogg.a), instead of $(TARGET_DIR)/usr/lib, even when
> $(TARGET_DIR)/usr/lib appears ahead of /usr/lib/libogg.a.
> ($(TARGET_DIR) is expanded out).  My quess is that libogg.explicitly
> defines a file, whereas the $(TARGET_DIR) only specifies a path, but I
> could be wrong.
> 
> I guess what I am looking for is the best way to construct my
> makefiles so that they are always working out of the relative
> buildroot directories instead of looking to my local filesystem.  I am
> including my libvorbis.mk
> 
Check the STAGING_DIR   ./lib or./usr/lib for '*.la'
files which needs to be edited so that they point at
STAGING_DIR libraries instead of at system libraries

Check what is done in the makefile fragments which do
fix this problems.

> Thanks for any help.
> Dan 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson
