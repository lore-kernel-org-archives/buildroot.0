From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 28 Nov 2007 09:54:28 +0100
Subject: [Buildroot] Adding new package to BuildRoot
In-Reply-To: <b6838d3a0708170647l1ed812c5v7627a7bb58735e6f@mail.gmail.com>
References: <b6838d3a0708170647l1ed812c5v7627a7bb58735e6f@mail.gmail.com>
Message-ID: <1196240068.13652.2.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-08-17 klockan 09:47 -0400 skrev Daniel Frey:
> All,
> 
> I am attempting to add libxslt to the packages under buildroot.  It
> fails with the following errors:
> 
> /home/dmfrey/dev/embedded
> /gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-gcc -shared  .libs/attrvt.o .libs/xslt.o .libs/xsltutils.o .libs/pattern.o .libs/templates.o .libs/variables.o .libs/keys.o .libs/numbers.o .libs/extensions.o .libs/extra.o .libs/functions.o .libs/namespaces.o .libs/imports.o .libs/attributes.o .libs/documents.o .libs/preproc.o .libs/transform.o .libs/security.o  -L/usr/lib /usr/lib/libxml2.so -lm  -march=armv5te -mtune=xscale -Wl,-soname -Wl, libxslt.so.1 -o .libs/libxslt.so.1.1.21
> /usr/lib/libxml2.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
> make[3]: *** [libxslt.la] Error 1
> make[3]: Leaving directory
> `/home/dmfrey/dev/embedded/gumstix-buildroot/build_arm_nofpu/libxslt-
> 1.1.21/libxslt'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/dmfrey/dev/embedded/gumstix-buildroot/build_arm_nofpu/libxslt-1.1.21'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/dmfrey/dev/embedded/gumstix-buildroot/build_arm_nofpu/libxslt-
> 1.1.21'
> make: ***
> [/home/dmfrey/dev/embedded/gumstix-buildroot/build_arm_nofpu/libxslt-1.1.21/libxslt.so] Error 2
> 
> 
> I used the xml2 Config.in and xml2.mk as a model for setting up
> libxslt.  I am building on ubuntu feisty.  If there is any other info
> required, please let me know; I have attached my two files in the xslt
> directory under package.  I am not totally sure as to what is going on
> here, but I think it has something to do with the fact that libxml2
> was compiled for my host architecture.  When I see the ouput fly by,
> it is finding the local systems libxml2.27, versus the libxml2.29 in
> the buildroot.
> 
> Thanks for any help.
> 

libxslt is added in revision 20562.
Tested on ARM.


> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards
Ulf Samuelsson
