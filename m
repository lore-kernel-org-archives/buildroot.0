From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:02:42 +0100
Subject: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
 hardcoded '-s'
In-Reply-To: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
References: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151219140242.588c12ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Sun, 22 Nov 2015 17:31:16 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> The Makefile.in's of some autotools packages such as yp-tools and ypbind-mt do
> not use the "install-sh" script for installing executables but instead call the
> detected BSD compatible 'install' binary directly with hardcoded '-s' parameter.
> This results in a build failure when the host 'strip' is invoked on binaries
> compiled for a different arch. The 'install-without-strip' script removes the
> '-s' parameter and execs the 'install' binary in PATH to solve this problem.
> These autotools packages can then be build under Buildroot by specifying
> <package>_CONF_ENV = INSTALL=support/scripts/install-without-strip
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  support/scripts/install-without-strip |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100755 support/scripts/install-without-strip

Following the feedback and discussion with Yann, I've marked this patch
as Changes Requested in our patch tracking system. I guess we will see
what the proper solution for the problem will be when you submit the
packages affected by the 'install -s' problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
