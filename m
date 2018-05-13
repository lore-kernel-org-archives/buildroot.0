From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:18:30 +0200
Subject: [Buildroot] [PATCH autobuild] autobuild-run: enforce a sane
 umask
In-Reply-To: <20180109212956.13278-1-yann.morin.1998@free.fr>
References: <20180109212956.13278-1-yann.morin.1998@free.fr>
Message-ID: <20180513231830.00f05f1a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 22:29:56 +0100, Yann E. MORIN wrote:
> When the umask of the user the autobuild-run script runs as is not what
> Buildroot expects, Buildroot will respawn another make instance with the
> expected umask.
> 
> However, in case of failure, the error message of the inner make are
> printed, followed by the error message of the outter make. And we are
> interested to catch only the errors from the inner make (the real one).
> 
> This means that we can miss the reason for the failure.
> 
> So we enforce a correct umask value from within the autobuild-run script
> itself.
> 
> Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  scripts/autobuild-run | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to buildroot-test. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
