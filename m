From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Nov 2019 09:15:27 +0100
Subject: [Buildroot] [PATCH v2,1/4] package/spice: disable tests
In-Reply-To: <CAPi7W82J2ehtREVFUkdMcn9rwy2pvBEmAhDzmCcCkbD3=vWGGQ@mail.gmail.com>
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
 <20191118224703.3fb65955@windsurf.home>
 <CAPi7W82J2ehtREVFUkdMcn9rwy2pvBEmAhDzmCcCkbD3=vWGGQ@mail.gmail.com>
Message-ID: <20191119091527.5e9c6806@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Nov 2019 08:47:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I've applied to next. However, your patch to upstream is not really
> > complete, or at least an additional patch is needed: when tests are
> > enabled, their configure.ac script should check if gdk-pixbuf is
> > available. And if it's not available, it should bail out, or disable
> > tests, but not allow the configure process to complete, and then have a
> > build failure when compiling.  
> You applied only the first patch of the serie

Yes, I didn't get around to applying the rest of the series.

> and you applied it on next even if it fixes a build failure on master. Was it intentional?

I was not sure if it was a build failure on master, and the autobuilder
failure linked in the commit log
(http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd)
happened on the next branch. I'll cherry-pick on master.

In such cases (i.e autobuilder failures happening on next, but issue
also present in master), it's always good to be explicit in the patch,
by adding a small note like this:

"""
balblabla

Signed-off-by: John Doe <john.doe@foobar.org>
---
The autobuilder failure linked in the commit log was for next, but the
problem also exists on master.
"""

This would really help.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
