From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:56:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/ntp: fix build for toolchains
 without ssp
In-Reply-To: <20170323193700.30404-1-bernd.kuhls@t-online.de>
References: <20170323193700.30404-1-bernd.kuhls@t-online.de>
Message-ID: <20170325145619.1b8a9780@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 20:37:00 +0100, Bernd Kuhls wrote:
> ntp defaults to use ssp support
> http://bk1.ntp.org/ntp-stable/sntp/harden/README
> 
> by using these flags
> http://bk1.ntp.org/ntp-stable/sntp/harden/linux
> 
> If the toolchain lacks SSP support this patch forces ntp to use an
> empty set of flags: http://bk1.ntp.org/ntp-stable/sntp/harden/default
> 
> Fixes
> http://autobuild.buildroot.net/results/1d5/1d58bd8745b22c8eb71fea4c7255d3ace69f6f7a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ntp/ntp.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

I've applied to fix the immediate build issues. However, I'm wondering
if we shouldn't use --with-locfile=default unconditionally, and let
Buildroot decide what CFLAGS are appropriate.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
