From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2017 19:07:29 +1100
Subject: [Buildroot] [PATCH] nodejs: unbreak 0.10.x host build
In-Reply-To: <20170122210551.9704-1-peter@korsgaard.com>
References: <20170122210551.9704-1-peter@korsgaard.com>
Message-ID: <20170123190729.74057d6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 22:05:51 +0100, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/833/8334631b54fdfd43d38ca00f42e4d5a98e3a70c4/
> http://autobuild.buildroot.net/results/9c0/9c08e0b745fab671123facb4a46f60eec5afd718/
> 
> Commit 24d90db52a74 (package/nodejs: disable icu support for host build)
> added --with-intl=none to host configure flags to fix an issue related to
> icu.  The 0.10.x version unfortunately doesn't understand this configure
> flag and errors out when provided, breaking the build:
> 
> configure: error: no such option: --with-intl
> 
> The 0.10.x version doesn't seem to have this icu issue (E.G. no autobuilder
> issues before this commit and unable to reproduce locally), so fix it by
> only passing --with-intl=none for the 6.9.x version.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nodejs/nodejs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
