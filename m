From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 00:05:29 +0100
Subject: [Buildroot] [PATCH] erlang: disable for sparc
In-Reply-To: <20151206151004.GA23217@waldemar-brodkorb.de>
References: <20151206151004.GA23217@waldemar-brodkorb.de>
Message-ID: <20160307000529.3d7567e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sun, 6 Dec 2015 16:10:04 +0100, Waldemar Brodkorb wrote:
> Required atomic operations not available for sparc.
> Fixes autobuild failures:
> http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
> http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/erlang/Config.in |    2 ++
>  1 file changed, 2 insertions(+)

Now that we have proper options to describe atomic intrinsics
dependencies, this patch is no longer the correct solution to solve
this problem. Also, there are some patches from Frank pending around
erlang, touching atomic support. However, I haven't checked if they
fixed the sparc issue specifically.

Frank?

In any case, I've marked this particular patch as Rejected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
