From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2015 16:50:46 +0100
Subject: [Buildroot] Buildroot LTS?
In-Reply-To: <563CC8D3.1010202@zacarias.com.ar>
References: <563336DE.4040809@2net.co.uk>
 <20151030145803.6aeb3c2d@free-electrons.com>
 <87eggb1keu.fsf@dell.be.48ers.dk>
 <563CC8D3.1010202@zacarias.com.ar>
Message-ID: <20151106165046.0fd56197@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Nov 2015 12:35:47 -0300, Gustavo Zacarias wrote:

> A bit late to the talk, but still relevant i think.
> I think this is the biggest issue, at least for me it doesn't sound too 
> interesting, i generally live with the bleeding-edge (master), and 
> recommend people to use the latest release or master.

Right, but it's very often not do-able to real-life projects/products.
I gave a Buildroot training this week for a company, and they are stuck
with Buildroot 2012.05. No BR2_EXTERNAL, no dependency graph, no legal
info, none of the goodness we've added over the last 3 years. And of
course, almost no security updates (though they fixed some of the big
ones).

> Security bumps are, in general, well tagged with i think my defacto 
> standard:
> 
> $ git log --grep="security bump"|grep Author|sort|uniq
> Author: Baruch Siach <xxx>
> Author: Bernd Kuhls <xxx>
> Author: Gustavo Zacarias <xxx>
> Author: J?rg Krause <xxx>
> Author: Peter Korsgaard <xxx>
> Author: Yann E. MORIN <xxx>
> 
> That being said it's just a first step towards LTS releases.
> Though some other security fixes might sneak-in via regular bumps 
> without being tagged or looking close enough at the release notes.

Yes, but to me very much like how current package bumps are done, those
LTS releases could simply be based on feedback/contribution. In those
LTS releases, we do not guarantee that *all* packages have been fixed
for *all* known security problems. We only releases an updated
Buildroot which has fixes for the security issues which were reported
to the Buildroot community and for which patches were submitted.

Basically, it's just to avoid having everybody duplicating the same
work, and have a central place to push the security fixes.

> With some previous experience with these things it depends very much on 
> the package and how long-term the release support window is to choose if 
> it's best to patch or bump.
> And also what would constitute grounds for a release? One security fix? 
> If it's periodic it might be too late for a security fix, hence possibly 
> some cumulative periodic release plus some way of notifying when patches 
> are applied (separate ML? rss feed? users checking the git repo?).

I don't think it's needed to have a super strict policy on this. We
could act a bit like the LTS kernel releases: release from time to
time, unless there is some kind of urgent/major security issue, in
which case you can do a release sooner.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
