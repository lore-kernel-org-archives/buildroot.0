From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 09:25:53 +0100
Subject: [Buildroot] [PATCH] fontconfig: needs host-gperf
In-Reply-To: <1488440033-18982-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1488440033-18982-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170302092553.67502cda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 13:03:53 +0530, Rahul Bedarkar wrote:
> Commit 701380c53b4d("fontconfig: add build fix for glibc 2.25") added
> a patch that touches src/fcobjs.h. Package build system detects change
> in timestamp and tries to regenerate fcobjshash.gperf which requires
> gperf tool. So this commit adds dependency on host-gperf.
> 
> Since the patch is in upstream fontconfig, we can get rid of this
> dependency once version is bumped next time.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/174/17471088b26ebc840d1922d7f2aa9e69b4b49ced
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

I've applied to master, with one little change, see below.

> +# When bumping version next time, we can get rid of dependency on host-gperf

Rather than talking about "bumping version next time", I changed this
to "When patch ... is removed, the host-gperf dependency should be
removed".

Peter: this does not need to go to the LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
