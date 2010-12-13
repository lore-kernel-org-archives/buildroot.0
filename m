From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 Dec 2010 18:13:09 -0500
Subject: [Buildroot] [PATCH] toolchain: speed up sysroot lib copying
In-Reply-To: <1292278985.12588.14.camel@coalu.atr>
References: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
	<1292278985.12588.14.camel@coalu.atr>
Message-ID: <201012131813.10612.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 17:23:05 Lionel Landwerlin wrote:
> Le dimanche 12 d?cembre 2010 ? 11:25 -0500, Mike Frysinger a ?crit :
> >  	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
> > 
> > -		find -L . -path "./lib/$${LIB}.*"     -o \
> > +		find -L \
> > +			  ./lib/ ./usr/lib/ 
./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/ \
> > +			  -maxdepth 1 \
> > +			  -path "./lib/$${LIB}.*"     -o \
> > 
> >  			  -path "./usr/lib/$${LIB}.*" -o \
> >  			  -path 
"./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
> >  		
> >  		)` ; \
> 
> Aren't we missing the locales files here ?
> 
> Like this one :
> 
> /usr/share/locale/fr/LC_MESSAGES/libc.mo

the point of this is to copy just library files.  the full sysroot copy 
happens elsewhere.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/01d4f89a/attachment-0001.pgp>
