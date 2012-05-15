From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 May 2012 21:50:14 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
 directory
In-Reply-To: <CAAXf6LW4iDFCRoqs-1kyjEg=jw9DvBzgriG+WucCTO_k6r3DGw@mail.gmail.com>
References: <962414f85797a188de79.1333738037@beantl019720>
 <4FA44012.8040008@mind.be> <20120515202803.0016103e@skate>
 <CAAXf6LVTXd2AkAJ+F_29v+Aias2aHVGcj4noXnyWHWWdXbmFxg@mail.gmail.com>
 <20120515205732.71d2310d@skate>
 <CAAXf6LW4iDFCRoqs-1kyjEg=jw9DvBzgriG+WucCTO_k6r3DGw@mail.gmail.com>
Message-ID: <20120515215014.29e93c18@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 May 2012 21:23:27 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> It's not defined directly like that.
> ccache is a package in its own right, using autotools.
> (package/ccache/ccache.mk).
> 
> The variable CCACHE_DIR originates from the following line in
> package/pkg-gentargets.mk:
> $(2)_DIR        =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)

Aaah, yes. Then yes, we need to adjust ccache source code, as suggested
by Arnout.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
