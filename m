From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 13:18:29 +0200
Subject: [Buildroot] [PATCHv3] [autobuild] etc: add SysV-init startup
 script and sample config file
In-Reply-To: <1448809362-6340-1-git-send-email-yann.morin.1998@free.fr>
References: <1448809362-6340-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160703131829.1ed4afc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Nov 2015 16:02:42 +0100, Yann E. MORIN wrote:
> This startup script (and its companion configuration file in
> /etc/default/) allows one to easily start/stop an autobuilder.
> 
> An autobuilder can be run either on the current system, or in
> a chroot (preferred). Running in a chrrot is done by setting
> the AUTOBUILD_CHROOT variable in the configuration file. If
> that variable is not set, then hte autobuilder does not enter
> a chroot.
> 
> It is expected that the buildroot-test tree be already present
> somewhere (for example, as a git checkout).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v2 -> v3:
>   - allow not entering in a chroot  (Thomas)
>   - always require an existing buildroot-test tree  (Thomas)
> ---
>  etc/default/buildroot-autobuild |  16 ++++
>  etc/init.d/buildroot-autobuild  | 171 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 187 insertions(+)
>  create mode 100644 etc/default/buildroot-autobuild
>  create mode 100755 etc/init.d/buildroot-autobuild

Applied to buildroot-test, and I've changed my autobuilder instance to
use it. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
