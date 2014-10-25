From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:49:23 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141025124923.40739a1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 09:28:05 -0300, Gustavo Zacarias wrote:
> Don't blindly install the /etc/nsswitch.conf file, it's useless for
> toolchains that aren't (e)glibc-based and misleading.
> Make the installation conditional on a (e)glibc toolchain.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  {system/skeleton/etc => package/glibc}/nsswitch.conf |  0
>  toolchain/toolchain.mk                               | 10 ++++++++++
>  2 files changed, 10 insertions(+)
>  rename {system/skeleton/etc => package/glibc}/nsswitch.conf (100%)

Both patches applied. I've only changed 'cp' to '$(INSTALL) -D -m 0644'
and used a full destination path.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
