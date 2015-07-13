From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 12:20:51 +0300
Subject: [Buildroot] [PATCH 1/2 v4] core/skeleton: drop /etc/securetty
In-Reply-To: <51509ea07660728b4f5aa519d67b6577bd4c9dd4.1436778228.git.yann.morin.1998@free.fr>
References: <cover.1436778228.git.yann.morin.1998@free.fr>
 <51509ea07660728b4f5aa519d67b6577bd4c9dd4.1436778228.git.yann.morin.1998@free.fr>
Message-ID: <20150713092051.GK2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 13, 2015 at 11:05:35AM +0200, Yann E. MORIN wrote:
> securetty is supposed to restrict the terminals root is allowed to
> login from. As it happens, login from busybox (w/ securetty support)
> is actually enforcing use of securetty, while login from util-linux
> is completely ignoring securetty altogether.
> 
> Remove securetty from our skeleton altogether and stop worrying about
> it.

But CONFIG_FEATURE_SECURETTY=y is still there in current 
package/busybox/busybox.config. Shouldn't we disable it first?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
