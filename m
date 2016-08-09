From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:50:16 +0200
Subject: [Buildroot] [PATCH] dante: fix build on some PowerPC platforms
In-Reply-To: <1470657776-9629-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470657776-9629-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809155016.678cce14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 14:02:56 +0200, Thomas Petazzoni wrote:
> The dante configure script has some logic to remove the -g flag from
> CFLAGS, but this logic is flawed and also removed -g in
> -mfloat-gprs=double, turning it into the invalid -mfloatprs=double,
> causing a build failure.
> 
> This commit adds a patch that gets rid of this -g removal logic, since
> it is in fact unnecessary.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/313370bf05efe7fd87c281a97ecb6e06531a87ed/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0002-compiler.m4-do-not-remove-g-flag.patch    | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/dante/0002-compiler.m4-do-not-remove-g-flag.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
