From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:27:34 +0200
Subject: [Buildroot] [PATCH] openipmi: needs NPTL support
In-Reply-To: <1470746684-6062-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470746684-6062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160810142734.253e7517@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 14:44:44 +0200, Thomas Petazzoni wrote:
> openipmi uses the pthread_condattr_setclock() function, which is only
> available with the NPTL thread implementation.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fc4084f8d1ff3fe98066c7cc051c2127bbe77ec5/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/openipmi/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
