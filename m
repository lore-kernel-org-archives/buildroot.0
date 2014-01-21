From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 21 Jan 2014 18:36:58 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <1390290077263-60414.post@n4.nabble.com>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
 <20140117154452.GC10730@pc-eric>
 <1390290077263-60414.post@n4.nabble.com>
Message-ID: <20140121173657.GA11605@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Mon, Jan 20, 2014 at 11:41:17PM -0800, sambuff wrote:
> > Adding a new package for python-gobject 2.28 is pretty straightforward. I
> >did it in my repo:
> https://github.com/elebihan/buildroot/commit/4107b0e4549aa4a234496c840361528381f57edf.
>
> Thanks for the link but I've failed to build it though.
>
> I've tried your new package with br-2013.11but the build fails because of
> "missing python headers"

D'Oh! I forgot to add 'python' after 'host-python' in
package/python-gobject/python-gobject.mk.

I reworked the package and added proper support for PyGtk. Development now
takes place in https://github.com/elebihan/buildroot/tree/pygtk-support/.
The complete stack has been added:

- python-pygobject (formerly python-gobject).
- python-xpyb.
- python-pycairo.
- python-pygtk.

Two demo boards (elebihan_demo_pygtk*) are available.
This is still WIP.

Thanks for your feedback.

Best regards,
ELB.
