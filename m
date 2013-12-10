From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 10 Dec 2013 14:01:45 +0100 (CET)
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
In-Reply-To: <20131210125526.GA5876@ad.chargestorm.se>
Message-ID: <1675197757.16219192.1386680505536.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> > It would be good if we could automatically enable the needed kernel
> > features when ktap is enabled, similar to how we do for E.G.
> > devtmpfs.
> 
> Sure, that would be an idea.
> 
> I could take a look at that, as long as it's OK with everyone that
> enabling ktap might change the kernel config. (Though, it'll be
> pretty
> deterministic anyway)...
> 
> > But that can be done as a followup patch, so committed - Thanks.
> 

two remarks

1) the usual problem with that idea is that if the kernel is externally
built, you can't do that (you don't even know if/where the config is)

2) I'd rather have it works similar to other dependancies, i.e having
the option removed and a comment telling me what I need to enable to 
have ktap available.

I recently had a similar problem with udev needing inotify, so the 
problem of the plumbing layer relying on some specific kernel feature
is probably a more generic problem... maybe a config option telling
kconfig where the kernel is ? That would be tricky with the way 
kconfig works, but that would be nice...
