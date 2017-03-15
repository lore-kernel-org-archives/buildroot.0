From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 15 Mar 2017 21:44:00 +0200
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <744747071.14828951.1489604108907.JavaMail.zimbra@datacom.ind.br>
References: <1489417019.20145.214.camel@linux.intel.com>
 <1489420484.20145.218.camel@linux.intel.com>
 <544671010.14659188.1489539751977.JavaMail.zimbra@datacom.ind.br>
 <1489590657.19767.1.camel@linux.intel.com>
 <372249453.14780914.1489593932103.JavaMail.zimbra@datacom.ind.br>
 <1489598613.19767.6.camel@linux.intel.com>
 <744747071.14828951.1489604108907.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1489607040.19767.9.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-03-15 at 15:55 -0300, Carlos Santos wrote:
> > From: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: "buildroot" <buildroot@busybox.net>
> > Sent: Wednesday, March 15, 2017 2:23:33 PM
> > Subject: Re: [Buildroot] cmake is not building anymore
> > On Wed, 2017-03-15 at 13:05 -0300, Carlos Santos wrote:

> > > > $ git clean -xdf
> > > > # I suppose you agree this is more stronger than make clean
> > > > 
> > > > $ make defconfig
> > > > $ make
> > > > 
> > > > --- 8< --- 8< ---
> > > > 
> > > > [ 65%] Linking C static library libcmcurl.a
> > > > 
> > > > In file included from .../output/build/host-cmake-
> > > > 3.6.3/Utilities/cmlibarchive/libarchive/archive_write_set_format
> > > > _zip
> > > > .c:5
> > > > 2:0:
> > > > .../output/build/host-cmake-
> > > > 3.6.3/Utilities/cmlibarchive/libarchive/archive_cryptor_private.
> > > > h:10
> > > > 7:17
> > > > : error: field ?ctx? has incomplete type
> > > > ??EVP_CIPHER_CTX ctx;
> > > > ?????????????????^~~
> > > > --- 8< --- 8< ---
> > > > 
> > > > 100% reproducible
> > > 
> > > If you use "make BR2_JLEVEL=1" the compilation will stop at the
> > > first
> > > error and it will be easier to identify the cause.
> > 
> > This is *first* error.
> > 
> > > ?I guess you don't have the openssl-dev package installed on the
> > > host
> > > machine neither built host-openssl in buildroot, since
> > > EVP_CIPHER_CTX
> > > is defined in openssl/ossl_typ.h.
> > 
> > It is installed.
> > 
> > $ dpkg -l \*ssl-dev

> > ii??libssl-dev:amd64???????1.1.0e-1?????????amd64????????????Secure
> > Sockets Layer toolkit - development files

> Ouch! Does it build using host-openssl, instead?

At least I don't see any folder like that in output/.

$ ls -1d output/build/*ssl*
ls: cannot access 'output/build/*ssl*': No such file or directory

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
