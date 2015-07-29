From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:21:45 +0200
Subject: [Buildroot] [PATCH] Disable e4defrag in host-e2fsprogs
In-Reply-To: <1438195658-27948-1-git-send-email-hollis_blanchard@mentor.com>
References: <1438195658-27948-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20150729222145.48bea97d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hollis Blanchard,

On Wed, 29 Jul 2015 11:47:38 -0700, Hollis Blanchard wrote:
> e4defrag from e2fsprogs 1.42.13 encounters these build errors on RHEL5.8 hosts:
> e4defrag.c:197:2: error: #error sync_file_range not available!
> e4defrag.c:201:2: error: #error fallocate64 not available!
> 
> It's possible to fix these problems, but we don't use it on the host anyways,
> so just disable it.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Commit titles must follow the convention:

	<package>: <description>

so I changed the title of your commit to:

	e2fsprogs: disable e4defrag in host variant

and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
