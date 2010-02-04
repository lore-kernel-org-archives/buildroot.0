From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 04 Feb 2010 01:01:28 +0100
Subject: [Buildroot] Copying extra libs into image using external
 toolchain
In-Reply-To: <6267.4b69f4f6.222b@getafix.xdna.net>
References: <39a5.4b68b030.ecb50@getafix.xdna.net>
	<hkaeil$bis$1@ger.gmane.org>  <6267.4b69f4f6.222b@getafix.xdna.net>
Message-ID: <1265241688.2045.48.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mercredi 03 f?vrier 2010 ? 22:13 +0000, Cameron Hutchison a ?crit :
> Grant Edwards <grant.b.edwards@gmail.com> writes:
> 
> >On 2010-02-02, Cameron Hutchison <lists@xdna.net> wrote:
> 
> >> When I build the image, this library [libstdc++] is not copied into
> >> it. The uClibc libraries are copied.
> >> What do I need to do to get this library copied into the image? 
> 
> >I wrote a shell script that does the "make" and then copies to
> >the proper locations the various libraries and include files
> >that buildroot forgets.  
> 
> Thanks for that info. I'll add an extra step to my build process. I
> guess I just wanted to make sure I wasn't missing anything built into
> buildroot since...
> 
> >> The docco talks about "Core C library from external toolchain"
> >> and "Libraries to copy from the external toolchain" options
> 
> ....but I could not find them anywhere.
> 

With external toolchains, buildroot assumes that libstdc++ is installed
in $(SYSROOT)/lib/ which isn't always the case.
For example the STLinux toolchain has its libstdc++ installed in
$(SYSROOT)/usr/lib like your toolchain.

We should rather fix the buildroot script that copies the libraries than
adding extra scripts outside of buildroot. It's in
toolchain/external-toolchain/ext-tool.mk


-- 
Lionel Landwerlin <llandwerlin@gmail.com>
