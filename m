From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:27:56 +0200
Subject: [Buildroot] [PATCH 1/3] ltp-testsuite: change install prefix
In-Reply-To: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
References: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161003232756.10de67a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Oct 2016 13:50:22 +0200, Erico Nunes wrote:
> ltp-testsuite installs some of its files directly at its specified
> prefix, which by default in Buildroot is /usr for autotools packages.
> This is currently leaving scripts and its internal directories directly
> installed in /usr, such as in:
> 
>   # ls /usr
>   IDcheck.sh       lib64            runltplite.sh    share
>   Version          libexec          runtest          testcases
>   bin              runalltests.sh   sbin             testscripts
>   lib              runltp           scenario_groups  ver_linux
> 
> It also seems to be not feasible to try to install all of its testcases
> to standard locations such as /usr/bin as may contain hundreds of
> binaries and may not be able to find them all if we change their install
> locations. Therefore, it is better if ltp-testsuite installs its tree to
> its own self-contained subdirectory.
> Upstream instructions recommend that the install path be /opt/ltp,
> however it seems that installing things to /opt is not a very common
> Buildroot practice.
> The proposal then is to install it to /usr/lib/ltp-testsuite and so it
> can be run directly from there.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
> The /usr/lib/ltp-testsuite suggestion came from a brief discussion that
> I had on IRC about where would be the least bad place to install it.
> Alternatives could be /usr/share/ltp-testsuite or even /opt/ltp if we
> were to strictly follow the upstream documentation.
> It doesn't matter too much really as long as it doesn't mess /usr up
> anymore.
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
