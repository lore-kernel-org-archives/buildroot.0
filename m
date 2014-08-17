From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:02:47 +0200
Subject: [Buildroot] [PATCH v2] dependencies: Reject gcj in
 BR2_NEEDS_HOST_JAVA check
In-Reply-To: <1408182278-5026-1-git-send-email-bernd.kuhls@t-online.de>
References: <1408182278-5026-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140817210247.4f01527d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 16 Aug 2014 11:44:38 +0200, Bernd Kuhls wrote:
> Xbmc uses the Groovy java package to generate API code, for details see
> http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works
> 
> Groovy itself is broken when used with gcj:
> http://jira.codehaus.org/browse/GROOVY-3701
> 
> Xbmc recommends to use another java package instead, like openjdk:
> http://forum.xbmc.org/showthread.php?tid=199742
> 
> Until we come up with a host package to provide a java setup and
> in order to make autobuilder happy let?s reject gcj when we check
> for a java installation on the host.
> 
> Currently Xbmc is the only package using BR2_NEEDS_HOST_JAVA
> so changing the behaviour of dependencies.sh has no side effects.
> 
> Fixes
> http://autobuild.buildroot.net/results/213/213d7454a1dc68cfb8f4c8d9508f52ebf8e58e33/
> http://autobuild.buildroot.net/results/639/639cda872cf36c122cbd6139dd76f6b51ac1864e/
> http://autobuild.buildroot.net/results/c9e/c9eb12c95b2939c64590692a82af8d84bbd90956/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Keep check_prog_host function (Yann)

Even though I'm not entirely happy with the BR2_NEEDS_HOST_JAVA
discriminating specifically 'gcj', I've applied this patch because I
don't really have a better suggestion, and we need to apply something
like this before the release.

Note however that I'm not sure it's going to immediately fix the
autobuilder issues: build will continue to fail, only earlier, unless
the autobuilder script used by Peter is fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
