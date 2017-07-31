From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:50:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/snappy: fix typo
In-Reply-To: <20170730144731.8961-1-bernd.kuhls@t-online.de>
References: <20170730144731.8961-1-bernd.kuhls@t-online.de>
Message-ID: <20170731205041.60217fc9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 16:47:30 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/snappy/snappy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks. It is worth mentioning that the pthread related
tweak is probably no longer needed: both uClibc and musl now use the
"single library" approach, so we no longer need to link libstdc++
explicitly with libpthread.

So perhaps, we could remove this workaround? Of course, this would
require verifying by checking with the problematic toolchain
configurations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
