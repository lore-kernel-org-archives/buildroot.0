From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:52:48 +0200
Subject: [Buildroot] [PATCH] libiio: do not install systemd service file,
 no longer available
In-Reply-To: <1472244542-14604-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472244542-14604-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160828155248.39c926f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 22:49:02 +0200, Thomas Petazzoni wrote:
> Since the bump to libiio 0.7, the systemd service file that used to be
> in debian/iiod.service no longer exists. The entire debian/ directory
> has been removed from the upstream project:
> 
>   https://github.com/analogdevicesinc/libiio/commit/5d49f58982b0c15545bc70724304fbc580e6523c
> 
> Due to this, the installation of this service file fails, and causes
> build failures. To address this, we simply remove the installation of
> the systemd service file.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ce2fc81466abd9619aa104c96234d1455de3480d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libiio/libiio.mk | 7 -------
>  1 file changed, 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
