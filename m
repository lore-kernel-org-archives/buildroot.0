From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 12:57:07 +0100
Subject: [Buildroot] [PATCH 1/2] Add (Freescale) elftosb host package
In-Reply-To: <4F607CD9.2080300@lucaceresoli.net>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <1331643131-31435-2-git-send-email-eric.jarrige@armadeus.org>
 <201203140105.44719.arnout@mind.be> <20120314104146.0e75b488@skate>
 <4F607CD9.2080300@lucaceresoli.net>
Message-ID: <20120314125707.65977d3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 12:11:21 +0100,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> IIRC these targets cannot in general work correctly with the Buildroot
> structure, and making them work would require a massive change, with a
> big increase in complexity.
> 
> Moreover, many packages do not implement the CLEAN and UNINSTALL targets:
> 
> $ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'|wc -l
> 111
> $ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'| \
>      xargs grep -l '_CLEAN_CMDS'|wc -l
> 51
> $ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'| \
>      xargs grep -l '_UNINSTALL_.*_CMDS'|wc -l
> 73
> 
> meaning that probably they are not so interesting to everybody out there.
> 
> As for me, I have never been relying on them. I prefer to distclean and
> rebuild when necessary. It's reliable, and not that painful with a
> reasonably recent build machine and ccache enabled.
> 
> So, my vote for dropping them.
> (Or should there be a specific thread for this topic?)

I definitely agree with you here. If they exist, then they should be
reliable. But I'm not sure it's going to be easy to make them fully
reliable. And then can be dangerous, because they are not recursive:
you can remove a given library without removing the other libraries or
applications that depend on it.

So I would also vote for dropping them. But we should then also drop it
from AUTOTARGETS/CMAKETARGETS packages.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
