From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 21:25:18 +0200
Subject: [Buildroot] [PATCH 2/2] fwup: fix static linking issues
In-Reply-To: <1471544678-12514-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471544678-12514-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471544678-12514-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160818212518.1f540c76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 23:54:38 +0530, Rahul Bedarkar wrote:
> In case of static linking, we need to link against dependencies of
> dependencies. When static libs are enabled, pkg-config seems to be
> outputting private libs implicitly without need of --static option.
> 
> Instead of manually adding libs for dependencies of libconfuse and
> libarchive, use pkg-config.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/69d/69d410e13a49b0ed34c501ba27d32df3269adb16/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

We already have some patches from Frank updating fwup:
especially https://patchwork.ozlabs.org/patch/657961/, which I believe
fixes the same issue, by using pkg-config: see commit
https://github.com/fhunleth/fwup/commit/d770b51ec097480db6d4ddeefd8e2ae21059b090
in fwup upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
