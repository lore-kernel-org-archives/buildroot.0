From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 06:14:28 +0100
Subject: [Buildroot] [PATCH] syslog-ng: Link against librt
In-Reply-To: <1445817733-12772-1-git-send-email-judge.packham@gmail.com>
References: <1445817733-12772-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20151026061428.5929eb5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Mon, 26 Oct 2015 13:02:13 +1300, Chris Packham wrote:
> Some of the rabbit-mq tools need to link against librt, specify
> LIBS=-lrt when configuring.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a3d/a3dfdebd76d47df11a8e26a215bb88fbce8dc6f7
> http://autobuild.buildroot.net/results/7d2/7d26e8efe67bf958162a309acb20800e669543e4
> http://autobuild.buildroot.net/results/7b5/7b5370d12a2ff8937cba3a201d4edce3dcd12a6e
> http://autobuild.buildroot.net/results/bab/babbb089ce1a7750495323248f21402960fb6c80
> 
> Helped-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks. I still think a better fix would be to change
configure.ac, and submit the change upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
