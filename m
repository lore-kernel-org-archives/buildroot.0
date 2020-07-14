From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:51:02 +0200
Subject: [Buildroot] [PATCH] package/scons: explicitly specify host
 Python 3
In-Reply-To: <17dc14ac-1f7f-ef67-84af-e41241ffe86a@railnova.eu>
References: <20200714033927.1516172-1-hancock@sedsystems.ca>
 <20200714101510.378d1909@windsurf.home>
 <17dc14ac-1f7f-ef67-84af-e41241ffe86a@railnova.eu>
Message-ID: <20200714155102.11b379fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 15:31:09 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> > HOST_SCONS_NEEDS_HOST_PYTHON = $(if ($(BR2_PACKAGE_PYTHON),python,python3)  
> 
> AFAIK, we usually do the opposite:
> $(if $(BR2_PACKAGE_PYTHON3),python3,python)

Yes, but the idea is to reverse this progressively, and switch more and
more to "Python 3.x" is the default.

> In my very own opinion, we should now only use host-python3 everywhere, 
> unless host-python(2) is strictly required. Pragmatically speaking, in 
> the rare cases where host-python(2) is still necessary, having both 
> Pythons on the host would not be that much of an overhead (both in terms 
> of building time and disk space); and would reduce the clutter in all 
> the places where we do the fancy dance you describe above.

I'm fine with moving towards host-python3 only where possible.

> On the target side, I'm also looking forward to invert the target 
> py2/py3 logic, ie changing
> 
> $(if $(BR2_PACKAGE_PYTHON3),python3,python))
> 
> into
> 
> $(if $(BR2_PACKAGE_PYTHON),python,python3))
> 
> especially in package/pkg-python.mk.
> 
> Again, the goal is to have Python3 as default, while still allowing old 
> Python2-only programs to run where needed. I'll try to find some time 
> this week to go through the Buildroot tree and update the Python3 
> migration page (https://www.elinux.org/Buildroot:Python2Packages), as 
> there has been some change since the FOSDEM dev days. This shall help us 
> understand where Python2 is still required.

That would be great indeed!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
