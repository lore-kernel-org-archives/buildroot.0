From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:48:15 +0100
Subject: [Buildroot] [PATCH v3 1/1] pkg-cmake: fix host-cmake-package
 type
In-Reply-To: <1422044224-22598-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1422044224-22598-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20150125184815.632977e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Fri, 23 Jan 2015 14:17:04 -0600, Ryan Barnett wrote:
> When trying to compile a host-cmake-package type such as host-cdrkit,
> an error happens in regards to HOSTCC and HOSTCXX not being found.
> 
>   /bin/sh: HOSTCC: command not found
>   /bin/sh: HOSTCXX: command not found
> 
> This due to the fact that the environment is incorrectly configured by
> having the following:
> 
>   -DCMAKE_C_COMPILER=""$(HOSTCC)"" -DCMAKE_CXX_COMPILER=""$(HOSTCXX)""
> 
> This is due to having too many dollar signs. The fix is to remove the
> extra dollar sign.
> 
> Also removing the unncessary quotes since the HOSTCC/HOSTCXX will
> already contain quotes. This could cause an issue with make as double
> quotes are not interpreted by make.
> 
> Minor formatting fix too.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
