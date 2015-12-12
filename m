From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 16:59:57 +0100
Subject: [Buildroot] [PATCH] python-m2crypto: different fix for the
 OpenSSL problem
In-Reply-To: <1449651316-31595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1449651316-31595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151212165957.5aec7ec2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Dec 2015 09:55:16 +0100, Thomas Petazzoni wrote:
> m2crypto provides a --openssl option to specify the location of the
> OpenSSL library, when not installed in /usr. However, this option does
> not apply to the standard "build" command normally called by the
> python-package infrastructure, but only to the "build_ext" command.
> 
> This already required to override the default python-package build
> commands for this package. Moreover, this the last bump to version
> 0.22.5, things got even more complicated since calling just
> "build_ext" does not work, and additional quirks are needed.
> 
> This commit proposes to get away with this by relying on the default
> python-package behavior, and simply hardcoding the OpenSSL location by
> patching the setup.py script in a post-patch hook.
> 
> This issue has also been reported upstream at
> https://gitlab.com/m2crypto/m2crypto/issues/89.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python-m2crypto/python-m2crypto.mk | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
