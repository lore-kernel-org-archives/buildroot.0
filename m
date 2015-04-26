From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:40:55 +0200
Subject: [Buildroot] [PATCHv3 16/18] Makefile: add BR_BUILDING variable
In-Reply-To: <20150425211457.GU4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-17-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425202649.GS4275@free.fr> <20150425211457.GU4275@free.fr>
Message-ID: <20150426114055.47144b47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 25 Apr 2015 23:14:57 +0200, Yann E. MORIN wrote:

> I maintian my ack, but I have a deeper concern about not doing those
> checks in the first place.
> 
> So, what does it mean not to have a config/board/... name to start with?
> 
> It means the specific configuration is not complete, and that the
> package will fail to configure or build. So it does not make sense to
> accept a configuration where such config name are missing.
> 
> Furthermore, what about a package that needs the config name to decide
> what tarball to download? In that case, we can't do the check at all,
> and we must fail as soon as the config name is empty.
> 
> As such, I'd prefer we do not condition the check on whether we'r
> ebuilding or not, but that we do it always, fo all packages.
> 
> However, I can see one reason where we would still want the checks to be
> conditional: make rand*config && make source-check . And that is a
> tricky case to solve.
> 
> We could do it by always defining defaults (in the Config.in) to such
> config names; those defaults could be conditional, of course. But coming
> up with sane defaults is not easy either...
> 
> Thoughts?

I'd answer that this is a deeper discussion, into which I'd prefer to
not get into at this point. The patch series is trying to keep the
existing behavior, and I'd like to not change that for now.

Once this patch series gets merged, I'll be happy to rediscuss why we
have this special casing on 'make source' / 'make source-check' to
disable the checks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
