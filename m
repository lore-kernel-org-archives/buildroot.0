From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 29 Mar 2018 13:41:59 -0300 (BRT)
Subject: [Buildroot] [PATCH] libpciaccess: add dependency on hwdata
In-Reply-To: <87zi2r7zaa.fsf@dell.be.48ers.dk>
References: <20180128235233.26989-1-casantos@datacom.ind.br>
 <87zi2r7zaa.fsf@dell.be.48ers.dk>
Message-ID: <1751033060.982024.1522341719017.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Bernd Kuhls" <bernd.kuhls@t-online.de>
> Sent: Thursday, March 29, 2018 11:05:17 AM
> Subject: Re: [PATCH] libpciaccess: add dependency on hwdata

>>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
> 
> > libpciaccess requires /usr/share/hwdata/pci.ids (or pci.ids.gz, if
> > compiled with zlib support). That file is provided by the hwdata
> > package, so add it as a run-time dependency.
> 
> > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> Is this really a hard dependency? Looking at src/common_device_name.c,
> this seems to only be used in populate_vendor(), which just returns
> without error if the file cannot be opened.
> 
> --
> Bye, Peter Korsgaard

It is required by libvirt[1] to show device names when we use virtual
machine manager to add hardware via PCI passthrough, otherwise only
the PCI bus information (slot, port, function) is shown.

1. https://patchwork.ozlabs.org/patch/841613/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
