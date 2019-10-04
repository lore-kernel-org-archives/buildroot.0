From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Oct 2019 14:55:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix nfs-utils_env.sh
 path
In-Reply-To: <CADvTj4qg4CffhdG8bd-tLxU7vp-K5713UF+uVO0wku92WOfFjQ@mail.gmail.com>
References: <20191003140410.45651-1-james.hilliard1@gmail.com>
 <20191004101646.5801a3ee@windsurf>
 <CADvTj4qg4CffhdG8bd-tLxU7vp-K5713UF+uVO0wku92WOfFjQ@mail.gmail.com>
Message-ID: <20191004145500.6d87de51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 4 Oct 2019 14:43:18 +0200
James Hilliard <james.hilliard1@gmail.com> wrote:

> > If I get it correctly looking at upstream commit
> > bf12e1fa9f48e8ee91a2869e69484c70595b5160, this script is only used from
> > nfs-config.service, and we are not installing nfs-config.service. So
> > what is the impact ?  
> The package itself handles nfs-config.service installation so we do use it.
> See:
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=blob;f=systemd/Makefile.am;h=03f96e93dccf814f7c8aee5cc9a78083231fefb3;hb=188354e57dd8476e66ce30d647180a106da29b88#l8

OK.

> > Also, could you indicate if this issue is applicable to 2019.02.x,
> > 2019.05.x and 2019.08.x ? I guess it depends on which version of
> > nfs-utils is currently shipped in those branches, and whether they have
> > bf12e1fa9f48e8ee91a2869e69484c70595b5160 or not.  
> It was broken by buildroot commit 06445ee36dee49555599bc9c963201bce237ab64
> so anything before that should be fine.

OK, so 2019.08.x is affected, but not 2019.05.x and 2019.02.x.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
