From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 23:11:41 +0100
Subject: [Buildroot] [PATCH] chrony: fix build with musl
In-Reply-To: <464b10815ee2e59be56aef7c79d5569ecde913f5.1510659474.git.baruch@tkos.co.il>
References: <464b10815ee2e59be56aef7c79d5569ecde913f5.1510659474.git.baruch@tkos.co.il>
Message-ID: <20171115231141.4dfc7b97@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 13:37:54 +0200, Baruch Siach wrote:
> The SCM_TIMESTAMPING_PKTINFO macro is missing from the socket.h header
> that musl libc provides as of version 1.1.16 that we currently use in
> Buildroot. Patch the code to add this macro locally until we update
> musl.
> 
> Fixes:
> http://autobuild.buildroot.net/results/aab/aab3210d6d0c60fb07415d9bbdb09f2d4091446c/
> http://autobuild.buildroot.net/results/fc8/fc8440db025f51c176240ca127bc68a367add21c/
> 
> Cc: Nathan Lynch <ntl@pobox.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../chrony/0001-ntp-fix-build-with-musl-libc.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/chrony/0001-ntp-fix-build-with-musl-libc.patch

Applied to master, thanks. Is the problem fixed in upstream musl? If
not, did you report the problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
