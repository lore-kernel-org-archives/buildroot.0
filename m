From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 12:23:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] gmock: new package
In-Reply-To: <CAHXCMML+4JgBr1msNmu8Z4Ja0FjmR1TficJq4d5nfnPXaXTg6A@mail.gmail.com>
References: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
 <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
 <CAHXCMML+4JgBr1msNmu8Z4Ja0FjmR1TficJq4d5nfnPXaXTg6A@mail.gmail.com>
Message-ID: <20150714122329.2b58433d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, Carlos,

On Tue, 14 Jul 2015 12:09:34 +0200, Samuel Martin wrote:

> > +################################################################################
> > +#
> > +# gmock
> > +#
> > +################################################################################
> > +
> > +GMOCK_VERSION = 1.7.0
> According to [1], gmock version must be the same as the gtest's one,
> so maybe we should do:
> GMOCK_VERSION = $(GTEST_VERSION)
> (but, taking care of the *.mk inclusion to get GTEST_VERSION defined
> before including gmock.mk).

I don't think this is a good idea. gmock is included *before* gtest,
and there's not much that can be done about this.

So instead, I would recommend to just to:

# Make sure this remains the same version as the gtest one
GMOCK_VERSION = 1.7.0

and then in gtest.mk:

# Make sure this remains the same version as the gmock one
GTEST_VERSION = 1.7.0

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
