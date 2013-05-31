From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 May 2013 17:25:22 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper: fix paths if
 executable was resolved by PATH
In-Reply-To: <51A5CD3F.1070100@fh-kl.de>
References: <51A5CD3F.1070100@fh-kl.de>
Message-ID: <20130531172522.330a5f6b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Ziegler,

On Wed, 29 May 2013 11:41:19 +0200, Patrick Ziegler wrote:
> If ext-toolchain-wrapper or any symbolic link to it was resolved by PATH,
> the wrapper takes the working directory to calculate the relative paths.
> 
> Now '/proc/self/exe' is used to resolve the absolute path to the toolchain
> directory if the wrapper was called neither with a relative nor an absolute
> path.
> 
> Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This should be part of 2013.05 if it's not too late, since it fixes a
real problem. My colleague Gregory (Cc'ed) was hit by the problem, and
both of us confirmed that this patch is fixing the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
