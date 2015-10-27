From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 07:29:54 +0100
Subject: [Buildroot] [PATCH 1/1] libcap: depend on host-attr for the host
In-Reply-To: <20151026142725.GA13801@megas.khq.kitware.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1445722754-3477-2-git-send-email-mathstuf@gmail.com>
 <20151026095827.2679c61f@free-electrons.com>
 <20151026142725.GA13801@megas.khq.kitware.com>
Message-ID: <20151027072954.0b27c319@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben,

On Mon, 26 Oct 2015 10:27:25 -0400, Ben Boeckel wrote:

> > If that is correct, then I think your proposed change is not the right
> > solution, because it is just a workaround for the specific situation,
> > on your distribution, where ls gets linked against an acl that has attr
> > support. A similar problem can appear with other binaries/libraries,
> > and we don't want to clutter our host package dependencies to solve
> > such problems IMO.
> > 
> > Instead, I believe we should look at removing $(HOST_DIR)/usr/lib from
> > LD_LIBRARY_PATH, i.e do something like:
> <snip>
> 
> This sounds like a much better solution.

Does this mean you will send a patch for it, after doing some testing ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
