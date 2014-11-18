From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 00:04:29 +0100
Subject: [Buildroot] [PATCH next] python-certifi: add new package
In-Reply-To: <546BC6D7.5060909@mind.be>
References: <1416255614-4876-1-git-send-email-yegorslists@googlemail.com>
 <20141118230733.3bc8209f@free-electrons.com>
 <546BC6D7.5060909@mind.be>
Message-ID: <20141119000429.65c6a8c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 18 Nov 2014 23:23:19 +0100, Arnout Vandecappelle wrote:

> > We need a depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 here. I
> > know it's not very useful since Python packages can anyway only be
> > selected when either Python or Python 3 are enabled, but we have this
> > conditional for all Python packages, so we should remain consistent and
> > have it there as well.
> 
>  Well, a quick grep in next shows that we have 8 packages without this depends,
> and 14 packages with the depends.
> 
>  However, since the python packages that have recently been added by Peter do
> not have the depends, and since he told Yegor to remove the depends in
> python-webpy, I think the rule now is _not_ to have the depends.

Damn, so the guy doing most of the Python maintenance, and who did
introduce the possibility of building modules with both Python 2 and
Python 3, doesn't have a word into such decisions? Where are we
going? :-)

> > So the licensing details of this package are pretty unclear. Can you
> > dig a little bit, and see what is the actual license for this package?
> 
>  It's pretty clear to me: the certificate database itself is MPL, the python
> code around it is ISC.
> Actually, since it's only about 5 lines of code, I doubt the python code is even
> copyrightable, but let's ignore that :-)

So probably we need a more precise <pkg>_LICENSE data than just "ISC",
no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
