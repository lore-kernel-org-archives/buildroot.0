From: cir.vfi at gmail.com <cir.vfi@gmail.com>
Date: Wed, 3 Jul 2013 14:49:26 -0700 (PDT)
Subject: [Buildroot] ldconfig - unknown machine 40
In-Reply-To: <CAPNngROZPybYo4pkY3GXFgH8yONY9bXwMU7o23hmQ39J=0BN=Q@mail.gmail.com>
References: <loom.20130628T172450-675@post.gmane.org>
 <CAPNngRMnWn3gAo3ut1GmoVJmCh2yiGu=2sUFWWXkTrL4M-NR6Q@mail.gmail.com>
 <1372765788.4683.13.camel@dublxciaranr1.verifone.com>
 <CAPNngROZPybYo4pkY3GXFgH8yONY9bXwMU7o23hmQ39J=0BN=Q@mail.gmail.com>
Message-ID: <1372888166340-47834.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Milton Soares Filho wrote
> On 2 July 2013 08:49, Ciar?n Rehill &lt;

> cir.vfi@

> &gt; wrote:
>> Is it normal not to supply a cross-ldconfig with a toolchain release or
>> is there a standard policy on this?
> 
> I haven't found a cross-ldconfig within both sh4 and broadcom
> toolchains which I have available.

Same story with the cross compiler in the yum repos for Fedora
(gcc-arm-linux-gnu): no ldconfig.

Anyway, what seems to be a (dirty) workaround is to take the
"/sbin/ldconfig.real" from a Ubuntu 12.04 system and place it into the
cross-compiler bin/ directory, renaming with the toolchain tuple,
"~/CodeSourcery/Sourcery_G++/bin/arm-none-linux-gnueabi-ldconfig" in this
case.  The file can be extracted from a .rpm or .deb for the appropriate
version.
I know it's wrong, but it gets over this bump in the absence of a better
solution.  Hopefully one of the elders of the list will suggest something
more appropriate.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/ldconfig-unknown-machine-40-tp47588p47834.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
