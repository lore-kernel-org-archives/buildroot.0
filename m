From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Feb 2014 21:24:31 +0100
Subject: [Buildroot] [PATCH v7 3/4] systemd: bump to v207.
In-Reply-To: <1391779295-19140-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAAXf6LX639vOb6KvOCRTncMfryx019L=8+4VM6U_8DfeNybPWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 7, 2014 at 2:21 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> This patch bumps systemd to v207 but also declares it as a provider for the
> udev virtual package.
>
> Starting with systemd 183, udev has been merged into
> systemd. The udev daemon is now installed as /lib/systemd/systemd-udevd.
> This means that /dev management using udev is only available if systemd
> is chosen as init system.
>
> When configuring systemd, the following options are available:
>
> - activation of systemd-journal-gatewayd, to access the journal via
>   HTTP.
> - activation of extra features like journal compression and sealing.
>
> Support for uClibc has also been removed because:
>
> - upstream has no interest in supporting uClibc.
> - using a shrinked libc brings no advantage, given the size of all the
>   programs included in Systemd. So using glibc does not matter.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
