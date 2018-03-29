From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Mar 2018 19:52:02 +0200
Subject: [Buildroot] [PATCH] libpciaccess: add dependency on hwdata
In-Reply-To: <1751033060.982024.1522341719017.JavaMail.zimbra@datacom.ind.br>
References: <20180128235233.26989-1-casantos@datacom.ind.br>
 <87zi2r7zaa.fsf@dell.be.48ers.dk>
 <1751033060.982024.1522341719017.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180329175202.GA23440@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-03-29 13:41 -0300, Carlos Santos spake thusly:
> > From: "Peter Korsgaard" <peter@korsgaard.com>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: "buildroot" <buildroot@buildroot.org>, "Bernd Kuhls" <bernd.kuhls@t-online.de>
> > Sent: Thursday, March 29, 2018 11:05:17 AM
> > Subject: Re: [PATCH] libpciaccess: add dependency on hwdata
> 
> >>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
> > 
> > > libpciaccess requires /usr/share/hwdata/pci.ids (or pci.ids.gz, if
> > > compiled with zlib support). That file is provided by the hwdata
> > > package, so add it as a run-time dependency.
> > 
> > > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> > 
> > Is this really a hard dependency? Looking at src/common_device_name.c,
> > this seems to only be used in populate_vendor(), which just returns
> > without error if the file cannot be opened.
> > 
> > --
> > Bye, Peter Korsgaard
> 
> It is required by libvirt[1] to show device names when we use virtual
> machine manager to add hardware via PCI passthrough, otherwise only
> the PCI bus information (slot, port, function) is shown.

Then I would say that it is not _required_. It may be _needed_, but it
is not mandatory; it just makes it a little bit more user-friendly.

Thus, I would say that we do not want to enforce this dependency,
because it still works without it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
