From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 May 2012 21:23:27 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
	directory
In-Reply-To: <20120515205732.71d2310d@skate>
References: <962414f85797a188de79.1333738037@beantl019720>
 <4FA44012.8040008@mind.be> <20120515202803.0016103e@skate>
 <CAAXf6LVTXd2AkAJ+F_29v+Aias2aHVGcj4noXnyWHWWdXbmFxg@mail.gmail.com>
 <20120515205732.71d2310d@skate>
Message-ID: <CAAXf6LW4iDFCRoqs-1kyjEg=jw9DvBzgriG+WucCTO_k6r3DGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2012 at 8:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 15 May 2012 20:49:35 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > Euh? Why wouldn't we use CCACHE_DIR directly? What's the need of
>> > renaming this environment variable here?
>>
>> Because CCACHE_DIR is already used by gentargets/autotargets...
>
> Where?
>
> $ git grep CCACHE_DIR | cat
> package/ccache/ccache.mk:define HOST_CCACHE_FIX_CCACHE_DIR
> package/ccache/ccache.mk: ? ? ? sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
> package/ccache/ccache.mk: ? ? ? HOST_CCACHE_FIX_CCACHE_DIR

It's not defined directly like that.
ccache is a package in its own right, using autotools.
(package/ccache/ccache.mk).

The variable CCACHE_DIR originates from the following line in
package/pkg-gentargets.mk:
$(2)_DIR        =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)

Best regards,
Thomas
