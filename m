From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 19:32:51 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <87bnduxe0t.fsf@dell.be.48ers.dk>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
 <55DB7994.8080509@mind.be> <87vbc3xgcq.fsf@dell.be.48ers.dk>
 <20150826170933.4501e3e8@free-electrons.com>
 <87bnduxe0t.fsf@dell.be.48ers.dk>
Message-ID: <20150826193251.02c382a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Yann,

On Wed, 26 Aug 2015 17:31:14 +0200, Peter Korsgaard wrote:

> Yeah, I should probably have been more clear. _I_ didn't notice the issue
> back when it was submitted (and you committed the patch). If I had,
> perhaps I would have commented on it.

The thing is that I'm not sure what we can do about it, or other
packages for which the source/binary is not available in a way that
allows automated downloading (either because creating an account is
needed, or because the program/library is not free). Besides wf111,
another example I gave are the different Qt5 components that are only
available to paying Qt customers.

On the one hand, having the package in the main Buildroot tree makes
things easy for people having access to those components: it's
supported by default in Buildroot.

On the other hand however, since we, maintainers and core developers of
Buildroot, may not have access to those components, it might be
problematic for long term testing and maintenance.

I'm not really sure how to solve this situation. Should we reject all
such packages and ask people to keep them in their private trees (which
limits a lot the sharing of such packages: the whole point of Buildroot
as an open-source project is to share as many package recipes as
possible). Or should we integrate them, maybe marking them in a special
way that indicates that we can't test/maintain them?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
