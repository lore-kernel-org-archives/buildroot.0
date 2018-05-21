From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 May 2018 11:58:02 +0300
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <20180521103259.09851362@windsurf>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <20180519124412.5d533cf9@windsurf>
 <20180521060756.3r5e7zspbpvxfjjn@sapphire.tkos.co.il>
 <20180521101928.74cdd62e@windsurf>
 <20180521082818.4smflx2vq7eucdpr@sapphire.tkos.co.il>
 <20180521103259.09851362@windsurf>
Message-ID: <20180521085802.j6jzko6rqzi77o6i@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 21, 2018 at 10:32:59AM +0200, Thomas Petazzoni wrote:
> On Mon, 21 May 2018 11:28:18 +0300, Baruch Siach wrote:
> 
> > > ./tirpc/rpc/rpcb_prot.x
> > > ./tirpc/rpcsvc/crypt.x
> > > ./tirpc/rpcsvc/key_prot.x  
> > 
> > The libtirpc tarball bundles these generated files. But for some reason we 
> > regenerate them from C.
> 
> Hu ? Those .x files are not the generated files. Those are the source
> files. rpcgen reads .x files and generates C code. You seem to have
> understood it backwards.

Right. But still the .h and .c file that are generated from these .x files are 
bundled with libtirpc. As far as I can see these are the files:

  src/key_prot_xdr.c
  src/rpcb_st_xdr.c
  tirpc/rpcsvc/crypt.h
  tirpc/rpc/rpcb_prot.h
  tirpc/rpc/key_prot.h

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
