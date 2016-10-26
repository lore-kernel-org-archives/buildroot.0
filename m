From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:34:56 +0200
Subject: [Buildroot] [PATCH 1/1] perl: update config.{sub,
 guess} using autotools hook
In-Reply-To: <1477430469-17537-1-git-send-email-nunes.erico@gmail.com>
References: <1477430469-17537-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161026223456.3a074e6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 23:21:09 +0200, Erico Nunes wrote:
> perl may fail to build on newer host architectures such as aarch64 due
> to its inability to guess the host architecture to build 'miniperl',
> which is built during the process. An error message looks like this:
> 
>   Configuring build-time miniperl for unknown
>   ERROR: No $target defined (?!)
>   ERROR: configure --mode=buildmini failed
> 
> This happens because the config.sub and config.guess files from perl are
> not modified and may become outdated.
> These files are normally updated automatically by a Buildroot hook for
> autotools packages, to avoid problems like these.
> Although perl uses the config.sub and config.guess files, it is not a
> strict autotools package, so it is not defined as an "autotools-package"
> in Buildroot and so it doesn't inherit the hook.
> This commit makes perl borrow the hook from the autotools infrastructure
> so that it can build on newer build architectures.
> This has been tested by building it on an aarch64 host machine.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/perl/perl.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master after fixing the commit title, as suggested by
Fran?ois.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
