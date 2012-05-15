From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 May 2012 20:57:32 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
 directory
In-Reply-To: <CAAXf6LVTXd2AkAJ+F_29v+Aias2aHVGcj4noXnyWHWWdXbmFxg@mail.gmail.com>
References: <962414f85797a188de79.1333738037@beantl019720>
 <4FA44012.8040008@mind.be> <20120515202803.0016103e@skate>
 <CAAXf6LVTXd2AkAJ+F_29v+Aias2aHVGcj4noXnyWHWWdXbmFxg@mail.gmail.com>
Message-ID: <20120515205732.71d2310d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 May 2012 20:49:35 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > Euh? Why wouldn't we use CCACHE_DIR directly? What's the need of
> > renaming this environment variable here?
> 
> Because CCACHE_DIR is already used by gentargets/autotargets...

Where?

$ git grep CCACHE_DIR | cat
package/ccache/ccache.mk:define HOST_CCACHE_FIX_CCACHE_DIR
package/ccache/ccache.mk:	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
package/ccache/ccache.mk:	HOST_CCACHE_FIX_CCACHE_DIR

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
