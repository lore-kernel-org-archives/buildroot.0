From: daggs <daggs@gmx.com>
Date: Sat, 25 Nov 2017 21:42:32 +0100
Subject: [Buildroot] [RPC] package/libtirpc: fix compilation error
In-Reply-To: <1f3d5149-c8a4-d77f-340b-b64a2f66f350@mind.be>
References: <20171125135438.22385-1-daggs@gmx.com>
 <1f3d5149-c8a4-d77f-340b-b64a2f66f350@mind.be>
Message-ID: <trinity-416dde36-a8aa-45ad-a348-0598740b8962-1511642552340@3c-app-mailcom-bs09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Arnout,

> Sent: Saturday, November 25, 2017 at 7:00 PM
> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Dagg Stompler" <daggs@gmx.com>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [RPC] package/libtirpc: fix compilation error
>
> 
> 
> On 25-11-17 14:54, Dagg Stompler wrote:
> > fix rpc_parse.c's compilation failure
> 
>  When sending a fix like this which is not visible in the autobuilders, make
> sure to also send a defconfig that reproduces it, as well as the build error itself.
> 
>  I took a look and I think this is about rpc_parse.c which include rpc/types.h.
> I believe the tirpc code is correct however. rpcgen is a host tool, so it makes
> sense to me that it uses the host's headers, not its own headers.
> 
>  rpc/types.h should be part of your system's libc, so how do you get a
> compilation failure?
> 

the issue is with libtirpc which isn't an host program, is it a lib used for rpc.
the patch in question is a patch added by Thomas and Yann.

to reproduce it, run make raspberrypi2_defconfig on latest git, run menuconfig and select libtirpc.

Dagg.
