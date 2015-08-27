From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Aug 2015 20:35:01 +0200
Subject: [Buildroot] [PATCH 1/1] Fix elf2flt build
In-Reply-To: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
References: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
Message-ID: <20150827203501.00528bd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Douglas,

On Thu, 27 Aug 2015 18:47:17 +0200, Douglas RAILLARD wrote:
> Add -ldl to fix elf2flt build, because libbfd
> uses dlopen and friends for plugin loading
> 
> Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>

Thanks for this patch. Great to see that there is some interest in
noMMU architecture. Which architecture are you working on?

I'm not able to reproduce the problem: here host-elf2flt builds fine.
However the build of an ARM Cortex-M3 toolchain fails during the uClibc
build (which takes place *after* host-elf2flt is built).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
