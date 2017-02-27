From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:38:12 +0100
Subject: [Buildroot] [PATCH] vlc: workaround microblaze gcc internal
 compiler error
In-Reply-To: <20170227060725.GA27933@waldemar-brodkorb.de>
References: <20170227060725.GA27933@waldemar-brodkorb.de>
Message-ID: <20170227213812.6b5b5f77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 07:07:25 +0100, Waldemar Brodkorb wrote:
> Override gcc optimization flags with -O0.
> 
> The workaround is not required for gcc6 anymore, but
> gcc6 is disabled for microblaze, because it breaks startup 
> of the system somehow. So the bug is not reported upstream.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/a318f0838a6a602046e719103ac81965c0084d52
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/vlc/vlc.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master after tweaking the condition so that it applies only
to gcc < 6.x.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
