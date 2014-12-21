From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 20:03:55 +0100
Subject: [Buildroot] [PATCH] libtool: fix help2man related failure
In-Reply-To: <1419183251-26734-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419183251-26734-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141221200355.61cf87c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 21 Dec 2014 14:34:11 -0300, Gustavo Zacarias wrote:
> Libtool sometimes requires help2man to build manpages, but since we
> don't use/need them and want to avoid pulling in and/or building
> dependencies for that we just disable it. Fixes:
> http://autobuild.buildroot.net/results/bfb/bfb9e298196d877b623580f882b6fe74b30bec9b/
> 
> Also add host-m4 as dependency, it's not strictly required but silences
> many build warnings.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I was initially a bit worried by the new host-m4 dependency, but since
host-autoconf already depends on host-m4, in most situations, we build
both host-autoconf and host-libtool, so we're fine.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
