From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Mar 2017 23:14:51 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
In-Reply-To: <20170319222409.205633ad@gmx.net>
References: <20170315210828.3784-1-ps.report@gmx.net>
 <20170318141428.0c4b6d36@free-electrons.com>
 <20170319222409.205633ad@gmx.net>
Message-ID: <20170319221451.GD3734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-03-19 22:24 +0100, Peter Seiderer spake thusly:
> On Sat, 18 Mar 2017 14:14:28 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> > On Wed, 15 Mar 2017 22:08:28 +0100, Peter Seiderer wrote:
> > > - rebase 0001-Adjust-for-buildroot-build.patch
> > > - delete 0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
> > >   (all changes are incorporated into wiringpi-2.44)
> > > - remove useless hash file (git download)
> > 
> > Git downloads now generate reproducible tarballs, so we in fact want to
> > add hashes for them as well. However, it is true that the hash is not
> > checked currently. This has been on the TODO-list for a while.
> 
> Mhhh, tried several times, every time I get a different checksum:
> 
> 	$ sha256sum dl/wiringpi-2.44.tar.gz 
> 5324ed452b7adfb77d049ea49dfe8878605c6198cb5c706ae2b285a70fb9d096  dl/wiringpi-2.44.tar.gz
> 
> 	$ sha256sum dl/wiringpi-2.44.tar.gz 
> 65e6b3a916b940eec085222a28a5859b09e79e0020de2f2b07563d910426180c  dl/wiringpi-2.44.tar.gz

Weird. I tried several times in a row here, too, and I always get the
same hash (from a clean tree):

    $ make defconfig
    $ make wiringpi-source
    $ sha256sum dl/wiringpi-2.44.tar.gz
    464c98ed54f5c0ad6611e270be3491c4598a32b7e86b208255862a301c564955  dl/wiringpi-2.44.tar.gz
    $ rm -rf dl/ output/
    $ make wiringpi-source
    $ sha256sum dl/wiringpi-2.44.tar.gz
    464c98ed54f5c0ad6611e270be3491c4598a32b7e86b208255862a301c564955  dl/wiringpi-2.44.tar.gz

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
