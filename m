From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Jun 2014 12:15:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <20140609121101.02fc9620@free-electrons.com>
References: <20140609063010.9CF93101624@stock.ovh.net>
 <20140609100709.GA3512@free.fr>
 <20140609121101.02fc9620@free-electrons.com>
Message-ID: <20140609101551.GB3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-09 12:11 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> Thanks for the analysis!
> 
> On Mon, 9 Jun 2014 12:07:09 +0200, Yann E. MORIN wrote:
> 
> > >   mips64el |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/0ee234e4557cbdf14aaa8f1a95156845c0dfe05a/
> > >        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/43c491a8875bba4b4eed13950346422d52841bf5/
> > 
> > Needs udev:
> >     checking for LIBUDEV... no
> >     configure: error: libudev-dev required for building DRI
> > 
> > Bernd, we need to revisit your libudev patch. ;-)
> 
> Shouldn't instead mesa3d depend on eudev || systemd, using
> BR2_PACKAGE_HAS_UDEV ?

That's what we should do to start with.

But in the end, having libudev would be nice, too, since quite a few
pckages need only the lib and not the full udev stuff. That's the case
for libcec and weston, for example.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
