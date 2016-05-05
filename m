From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 15:47:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ca-certificates: depend on
 host-python or host-python3
In-Reply-To: <1462371474-27987-1-git-send-email-martin@barkynet.com>
References: <1462371474-27987-1-git-send-email-martin@barkynet.com>
Message-ID: <20160505154720.31d07a17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 May 2016 15:17:54 +0100, Martin Bark wrote:
> The ca-certificates Makefile directly calls python but if python3 has been
> selected then it is possible for $(HOST_DIR)/usr/bin/python to not exist
> in the PATH at the time ca-certificates is built.  This means the Makefile
> will use python installed on the build host. If the build hosts python is
> less than python 2.7 then the build will fail.
> 
> ca-certificates will build using host-python3. Fix the issue by depending
> on host-python3 if python3 is being used otherwise depend on host-python.
> 
> This fixes:
>  http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
>  http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
>  http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/
> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2
>  - Depend on host-python or host-python3 instead of directly calling
>    $(HOST_DIR)/usr/bin/python2 (Suggested by Arnout Vandecappelle)
>  - Added comments to ca-certificates.mk (Suggested by Arnout Vandecappelle)
> ---
>  package/ca-certificates/ca-certificates.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

As suggested by Arnout, I've rewritten the commit log to make it
clearer why we need to depend on host-python or host-python3. Then I've
applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
