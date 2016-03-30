From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 21:06:52 +0200
Subject: [Buildroot] [PATCH] tcl: rework logic for databases support
In-Reply-To: <56FC22FF.5020900@mind.be>
References: <1459351282-16091-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160330173503.2e710605@free-electrons.com>
 <56FBF32C.7070802@imgtec.com> <56FC22FF.5020900@mind.be>
Message-ID: <20160330210652.4bf25f61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 21:03:27 +0200, Arnout Vandecappelle wrote:

> > That was my first approach and I didn't look nicer to me, so I changed
> > it :P Anyway, if you prefer that way, I'll do it that way, no problem.
> 
>   Like you, Vincent, I also prefer TCL_DEPENDENCIES to be repeated.
> 
> - You don't need to move your eyes to see which variable is affected.
> - When adding/removing a dependency, you don't have to worry about the backslashes.
> 
> 
>   I do prefer in this case that all assignments, including the first one, have +=

Matter of taste, I guess. But if I follow your thought, then we should
do:

LIBGTK3_CONF_OPTS += --disable-glibtest
LIBGTK3_CONF_OPTS += --enable-explicit-deps=no
LIBGTK3_CONF_OPTS += --enable-gtk2-dependency
LIBGTK3_CONF_OPTS += --disable-introspection

I think this is really verbose, but again a matter of taste.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
