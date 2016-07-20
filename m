From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 20 Jul 2016 14:41:55 +0000 (UTC)
Subject: [Buildroot] Workflow question - separating the distribution
 from embedded applications
References: <CAOsp8o8U3=xT4u6y33Om125WCk+wPzn_bYbzKEBYbiV=dUqzig@mail.gmail.com>
Message-ID: <nmo2jj$mnc$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-20, Michael Habibi <mikehabibi@gmail.com> wrote:

> With buildroot, I imagine we can do the same thing since it also
> builds a root filesystem. However I am trying to understand a workflow
> where we could build the distribution's root filesystem of the
> distribution separate from our embedded applications.

We use buildroot to build the root filesystem (including the ipkg
package manager).

Application developers build applications separately and package them
as .ipk packages.

We then install each set of .ipk packages into a JFFS2 filesystem
image.  [This is don't on a development host, not on the target.]

We then distribute two images: the kermel+rootfs uImage, and the JFFS2
filesystem image containing all of the applications.  The former
rarely gets updated and is common across several products.  The latter
gets updated much more frequently and there are various different
flavors of it for different products.

-- 
Grant Edwards               grant.b.edwards        Yow! I feel partially
                                  at               hydrogenated!
                              gmail.com            
