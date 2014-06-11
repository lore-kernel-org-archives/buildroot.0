From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 11 Jun 2014 23:04:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <20140611105653.4e25ec3c@free-electrons.com>
References: <20140609063010.9CF93101624@stock.ovh.net>
 <20140609211036.GA10459@ned>
 <20140611105653.4e25ec3c@free-electrons.com>
Message-ID: <20140611210457.GA2825@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Wed, Jun 11, 2014 at 10:56:53AM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 9 Jun 2014 23:10:36 +0200, Eric Le Bihan wrote:
>
> > - We are stuck with autoreconf, as it is needed to solve the `ln --relative`
> >   issue via a patch, which will not be accepted by upstream [8].
>
> If we're stuck with autoreconf due to a patch that will not be accepted
> upstream, then I would suggest that we move away from autoreconf, and
> turn this patch into something that changes Makefile.in and configure
> directly, with a good explanation in the patch description.
>
> Hopefully, ln implementations in distributions will be upgraded, and at
> some time, we'll be able to drop the patch.
Maybe there will be a backport of coreutils for Debian Wheezy ;-)
>
> The drawback with this solution is that if we want to create/backport
> other systemd patches that require autoreconf, then we're screwed. So
> maybe carrying our copy of libgcrypt.m4 as a patch in systemd sources is
> the easiest solution here.
I think this is the more future-proof solution. I'll post a patch implementing
this.

Best regards,
ELB
