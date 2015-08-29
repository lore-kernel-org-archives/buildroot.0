From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 12:43:28 +0200
Subject: [Buildroot] [PATCH] package/setools: needs wchar
In-Reply-To: <1440843313-16263-1-git-send-email-yann.morin.1998@free.fr>
References: <1440843313-16263-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150829124328.3b8ce755@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Aug 2015 12:15:13 +0200, Yann E. MORIN wrote:
> Even though setools itself does not require wide chars, the configure
> script needs them when testing for C99 support.
> 
> Since:
>   - it is not clear whether wchar are mandatory for C99 or not,
>   - only uClibc may miss support for wide chars,
>   - using SELinux would probably involve rather big systems (i.e. glibc
>     would not be such a huge overhead),
> just make setools depend on the toolchain having widechar.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/051/051a7f72ebadd56407700c22b57e942f08eb1c09/
>     http://autobuild.buildroot.org/results/a4b/a4b2a6f1920430af43c23239de17200e70951b3b/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/setools/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
