From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 24 Nov 2016 23:12:09 +0100
Subject: [Buildroot] Analysis of build results for 2016-11-23
In-Reply-To: <20161124094429.4152c19b@free-electrons.com>
References: <20161124073011.C2C1620BD5@mail.free-electrons.com>
 <20161124094429.4152c19b@free-electrons.com>
Message-ID: <1480025529.4218.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2016-11-24 at 09:44 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> > ?????????arm |???????????????????xl2tp-v1.3.6 | NOK | http://autobu
> > ild.buildroot.net/results/baea66ac57aa34c7d7bdc993544c0f010fee4a9b
> 
> Musl issue.

I had a look at this. xl2tp define a macro USE_KERNEL which adds
support for using the kernel module pppol2tp. Using this macro with
musl fails with the well-known linux header redefinitions.

As the package does not provide a linux dependency I would suggest to
uncomment this macro using sed (sed is already used to remove a CFLAG
option from the Makefile).

What do you think?

Best regards,
J?rg Krause
