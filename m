From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:40:45 +0200
Subject: [Buildroot] [PATCH] package/php: fix date.timezone
In-Reply-To: <1465728504-17997-1-git-send-email-yann.morin.1998@free.fr>
References: <1465728504-17997-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160612184045.665d8d12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Jun 2016 12:48:24 +0200, Yann E. MORIN wrote:
> In 5f37843a (php.ini: set date.timezone), the configured timezone was
> used as the default for PHP.
> 
> However, BR2_TARGET_LOCALTIME is a string, so is quoted, so it is never
> empty, so the check for emptynessnever matches.
> 
> Fix that by q-stripping the value before testing it. Note however that
> we do not q-strip it before storing it in the php.ini file, because it
> has to be q-stripped in there.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/php.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
