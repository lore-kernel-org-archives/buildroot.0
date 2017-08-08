From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Aug 2017 23:00:48 +0200
Subject: [Buildroot] buildroot uClibc-ng build failure
In-Reply-To: <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
 <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
Message-ID: <20170808230048.75361077@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Aug 2017 18:52:14 +0200, Andr? Hentschel wrote:

> > Please post output of the following commands:
> > $ locale
> > $ locale -a
> > $ cat /etc/os-release  
> $ locale
> LANG=de_DE.utf8
> LANGUAGE=de_DE.utf8
> LC_CTYPE="de_DE.utf8"
> LC_NUMERIC="de_DE.utf8"
> LC_TIME="de_DE.utf8"
> LC_COLLATE="de_DE.utf8"
> LC_MONETARY="de_DE.utf8"
> LC_MESSAGES="de_DE.utf8"
> LC_PAPER="de_DE.utf8"
> LC_NAME="de_DE.utf8"
> LC_ADDRESS="de_DE.utf8"
> LC_TELEPHONE="de_DE.utf8"
> LC_MEASUREMENT="de_DE.utf8"
> LC_IDENTIFICATION="de_DE.utf8"
> LC_ALL=de_DE.utf8
> 
> $ locale -a
> C
> C.UTF-8
> de_DE.utf8
> POSIX
> 
> OS is Ubuntu 14.04.5 LTS
> Should I install the english locale?

As per the current Buildroot requirements, it shouldn't be needed. We
require one UTF-8 locale to be installed for uClibc to build its locale
data, but not specifically the en_US.UTF-8 locale or any other english
locale. If that has changed in uClibc, then we should adjust the
dependency in Buildroot accordingly, but it would be a bit annoying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
