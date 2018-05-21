From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 10:19:28 +0200
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <20180521060756.3r5e7zspbpvxfjjn@sapphire.tkos.co.il>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <20180519124412.5d533cf9@windsurf>
 <20180521060756.3r5e7zspbpvxfjjn@sapphire.tkos.co.il>
Message-ID: <20180521101928.74cdd62e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 09:07:56 +0300, Baruch Siach wrote:

> > Do you have an idea on how to address this ? Do we need to build
> > host-libtirpc ?  
> 
> I'll take a look.

Thanks!

> If we need host-libtirpc we would not be able to remove the rpcgen patch since 
> that would create a circular dependency.

Except if we manage to convince host-libtirpc that it should just
install the RPC headers, and not do anything that needs rpcgen.

> Why do we actually need rpcgen in libtirpc?

If I remember correctly, it's because it needs to generate the C code
matching those RPC descriptions:

./tirpc/rpc/rpcb_prot.x
./tirpc/rpcsvc/crypt.x
./tirpc/rpcsvc/key_prot.x

But it's been a very long time I did this, and libtirpc has been
updated multiple times since then.

Alternatively, one approach would be to bundle a pre-generated version
of those C files instead of having to run rpcgen. Not the nicest
solution, but that's one solution.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
