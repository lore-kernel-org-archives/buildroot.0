From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 28 Oct 2008 00:26:53 +0100
Subject: [Buildroot] Synchronisation of dependencies between Config.in
	and .mk files ?
In-Reply-To: <e4c675870810271533q21914df7od498b0be858600e2@mail.gmail.com>
References: <20081027175645.7e7cb096@surf>
	<200810272247.34068.markus.heidelberg@web.de>
	<e4c675870810271533q21914df7od498b0be858600e2@mail.gmail.com>
Message-ID: <200810280026.53773.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Roberto A. Foglietta, 27.10.2008:
> 2008/10/27 Markus Heidelberg <markus.heidelberg@web.de>:
> > When reading it from the Makefiles, you couldn't automatically decide whether
> > to use "select" or "depends on", because in the Makefile there is no
> > difference between them.
> 
>  Reading/including only those .mk for which packages has been selected
> and the meaning became always: 'select'
> 
>  I think the use of "depends on" in Config.in should be used ONLY when
> arch restrictions have been involved.

Definitely not. For example sdl_image depends on sdl instead of selecting it.
So you can have a hierarchical menu in Config.in and hide all the sdl_
packages unless sdl is not activated. Of course this is only possible for
packages in direct relation to each other.

>  Example: I need nfs but nfs 'depends on' rpc... the first time in the
> menuconfig I will waste minutes to understand I have to select rpc in
> order to select nfs, why? If I want a cold beer I ask for a cold beer.
> Why I have to ask "do you have the freezer pluged in", before? It is
> obvious that a freezer is needed for a cold beer but it is not obvious
> asking for a freezer when you are looking for a beer.

There are settings that probably shouldn't be selected automatically, for
example such which require a recompilation of the toolchain. In this case
there could also be a "comment NFS needs RPC" in the Config.in. But I think
that is hard to decide, there shouldn't be too much comments in menuconfig.

Markus
