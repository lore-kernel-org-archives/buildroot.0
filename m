From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 02:48:20 +0200
Subject: [Buildroot] [PATCH] linux-pam: install login.pam from here
In-Reply-To: <1459211996-30192-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459211996-30192-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160329024820.5b8159fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 21:39:56 -0300, Gustavo Zacarias wrote:
> Instead of installing login.pam (/etc/pam.d/login) from util-linux
> conditionally do so unconditionally from linux-pam.
> If busybox login is pam-enabled (linux-pam package enabled) it will be
> required, otherwise it will lead to a system where login won't work, and
> if util-linux is enabled it will supercede busybox login and will be
> necesarry regardless.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-pam/linux-pam.mk              | 4 +++-
>  package/{util-linux => linux-pam}/login.pam | 0
>  package/util-linux/util-linux.mk            | 2 --
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/{util-linux => linux-pam}/login.pam (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
