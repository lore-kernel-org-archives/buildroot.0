From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 22:52:05 +0200
Subject: [Buildroot] [v2 3/5] package/libsemanage: add host-audit as a
 dependency.
In-Reply-To: <1468699589-14328-3-git-send-email-Aduskett@gmail.com>
References: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
 <1468699589-14328-3-git-send-email-Aduskett@gmail.com>
Message-ID: <20160716225205.2ac3c1fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 16:06:27 -0400, Adam Duskett wrote:
> refpolicy requires host-libsemanage.  host-libsemanage will fail
> to compile without host-audit.  This adds host-audit as a requirement
> for host-libsemanage.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes:

I've indeed reproduce the host-libsemanage build issue. This build
issue is in fact an excellent illustration what I hate to have host
package that are not used by any other package in Buildroot: it has
been broken since ages, and nobody noticed.

So, I've applied your patch, which fixed the build problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
