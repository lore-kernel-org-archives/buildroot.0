From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 09:08:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <20140611215425.GD27579@free.fr>
References: <20140609063010.9CF93101624@stock.ovh.net>
 <20140609211036.GA10459@ned>
 <20140611105653.4e25ec3c@free-electrons.com>
 <20140611210457.GA2825@ned> <20140611211303.GB27579@free.fr>
 <20140611214744.GD2825@ned> <20140611215425.GD27579@free.fr>
Message-ID: <20140612090822.1e5a9e58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 11 Jun 2014 23:54:25 +0200, Yann E. MORIN wrote:

> > Should it be provided by the systemd package or should we create a new one?
> > Are there other packages that require such wrappers?
> 
> I think if we go that route, we should just bundle it in Buildroot, and
> always install it.
> 
> After all, all this wrapper does is look for --relative in the
> arguments, and if found, emulates it; otherwise, it just calls to the
> real ln.
> 
> Sounds reasonable to me (although I did not look too closely if the
> script was entirely correct.)
> 
> But I'd like input from Thomas and Peter on that one.

Well, I'm not sure I want to include a wrapper that will wrap *all* ln
calls, just for the sake of fixing one package. I probably prefer to
patch that package only.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
