From: Mike Sander <msander@ripnet.com>
Date: Sat, 25 Oct 2008 22:14:24 -0400
Subject: [Buildroot] portmap build error
In-Reply-To: <4900852F.4010809@ripnet.com>
References: <4900852F.4010809@ripnet.com>
Message-ID: <4903D280.60009@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following up from my earlier post.  I am still unable to build portmap.  

What I have noticed is that the earlier buildroot (april) has these symbols in arm-linux-uclibc/lib/libgcc_s.so.  They are not present in the newer buildroot.  I am trying to figure out how libgcc is built.

As far as I can tell all RPC related configurations are identical between my two buildroot trees.

Anyone have any ideas?

Thanks,

<cut earlier output>

staging_dir//usr/lib/crtn.o
portmap.o: In function `reg_service':
portmap.c:(.text+0x120): undefined reference to `svc_sendreply'
portmap.c:(.text+0x23c): undefined reference to `svc_sendreply'
portmap.c:(.text+0x404): undefined reference to `svcerr_decode'
portmap.c:(.text+0x550): undefined reference to `clntudp_create'
portmap.c:(.text+0x578): undefined reference to `authunix_create'
portmap.c:(.text+0x5e0): undefined reference to `svc_sendreply'
portmap.c:(.text+0x62c): undefined reference to `svcerr_noproc'
portmap.c:(.text+0x650): undefined reference to `xdr_void'
portmap.c:(.text+0x654): undefined reference to `xdr_pmap'
portmap.c:(.text+0x65c): undefined reference to `xdr_int'
portmap.c:(.text+0x664): undefined reference to `xdr_pmaplist'
portmap.o: In function `xdr_encap_parms':
portmap.c:(.text+0x688): undefined reference to `xdr_bytes'
portmap.o: In function `xdr_rmtcall_result':
portmap.c:(.text+0x6a0): undefined reference to `xdr_u_long'
portmap.o: In function `xdr_rmtcall_args':
portmap.c:(.text+0x6c8): undefined reference to `xdr_u_long'
portmap.c:(.text+0x6dc): undefined reference to `xdr_u_long'
portmap.c:(.text+0x6f0): undefined reference to `xdr_u_long'
portmap.o: In function `xdr_opaque_parms':
portmap.c:(.text+0x71c): undefined reference to `xdr_opaque'
portmap.o: In function `main':
portmap.c:(.text+0x914): undefined reference to `svcudp_create'
portmap.c:(.text+0x9a0): undefined reference to `svctcp_create'
portmap.c:(.text+0x9fc): undefined reference to `svc_register'
portmap.c:(.text+0xa1c): undefined reference to `svc_run'
pmap_check.o: In function `logit':
pmap_check.c:(.text+0x34): undefined reference to `getrpcbynumber'
collect2: ld returned 1 exit status
make[1]: *** [portmap] Error 1
make[1]: Leaving directory `/home/br22oct/buildroot/build_arm/portmap_5beta'
make: *** [/home/br22oct/buildroot/build_arm/portmap_5beta/portmap] Error 2
