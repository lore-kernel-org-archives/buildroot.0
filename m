From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 17 Jul 2021 20:26:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: fix rpc.h install path
In-Reply-To: <CAPi7W818B2yDd4Kh1jgb98gn0gK0kORPKtFPzmdxZcc_bqQ3BA@mail.gmail.com>
References: <20210717133225.470326-1-james.hilliard1@gmail.com>
 <CAPi7W818B2yDd4Kh1jgb98gn0gK0kORPKtFPzmdxZcc_bqQ3BA@mail.gmail.com>
Message-ID: <YPMg0s/UXMS9eMy4@pevik>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

> Dear James,

> Le sam. 17 juil. 2021 ? 15:32, James Hilliard
> <james.hilliard1@gmail.com> a ?crit :

> > When libtirpc installs rpc.h with autoconf it installs it to:
> > $(HOST_DIR)/include/tirpc/rpc/rpc.h

> > As this is the expected path we need to do the same.

> > This should fix the previous attempt at fixing host-nfs-utils:
> > b991962993357092625e5b18d8203acd1e9b8b1f
> Thanks for trying to fix my mess but I think the issue is raised
> because rpc.h is not self sufficient.
> Here is an extract of
> http://autobuild.buildroot.org/results/836/83648a39e960d8f4db0e86ddb48db4b7dd9f91cf//host-nfs-utils-2.5.4/config.log:

> configure:19291: checking rpc/rpc.h usability
> configure:19291: /usr/bin/gcc -c -O2
> -I/home/buildroot/autobuild/run/instance-0/output-1/host/include
> -I/home/buildroot/autobuild/run/instance-0/output-1/host/include
> -D_GNU_SOURCE  conftest.c >&5
> In file included from conftest.c:70:0:
> /home/buildroot/autobuild/run/instance-0/output-1/host/include/rpc/rpc.h:70:61:
> fatal error: rpc/rpcb_clnt.h: No such file or directory
>  #include <rpc/rpcb_clnt.h> /* rpcbind interface functions */
>                                                              ^
> I sent a new serie here:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=253968

Yes, this was a better approach, glad it was merged thank!

Kind regards,
Petr
