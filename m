From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:36:18 +0100
Subject: [Buildroot] [PATCH v3] pseudo-wrapper: fix console issue
In-Reply-To: <20161123213403.GB13048@free.fr>
References: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
 <20161123182843.GA3609@free.fr>
 <20161123215745.7c307e23@free-electrons.com>
 <20161123213403.GB13048@free.fr>
Message-ID: <20161123223618.66f23b56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 22:34:03 +0100, Yann E. MORIN wrote:

> On 2016-11-23 21:57 +0100, Thomas Petazzoni spake thusly:
> > On Wed, 23 Nov 2016 19:28:43 +0100, Yann E. MORIN wrote:  
> > >   - long term, we want to definitely switch to using pseudo:
> > >     - it is actively maintained,,
> > >     - it has more features than fakeroot,
> > >     - some of those features are very interesting for us.  
> > 
> > Could you explain which additional features of pseudo are interesting
> > for us?  
> 
> pseudo can intercept and redirect acceses to /etc/paswd (and group,
> shadow, gshadow) to the ones in the target. With that, we could probably
> greatly simplify our handling of users.

Is that the "additional features that are very interesting for us"? If
it is, then I don't think it's that interesting. At least it
definitely doesn't offset the drawback of having to build host-sqlite
and host-attr.

Our handling of users is not complicated, it's very explicit, works
fine, and is actually probably better than some black magic that
intercepts accesses to /etc/passwd.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
