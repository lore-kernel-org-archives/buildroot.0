From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 12:03:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/gettext-tiny: Fix cyclic
 dependency with iconv
In-Reply-To: <1554818104-7594-1-git-send-email-email@gmail.com>
References: <1554818104-7594-1-git-send-email-email@gmail.com>
Message-ID: <20190410120328.712969a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Apr 2019 16:55:04 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> From: Vadim Kochan <vadim4j@gmail.com>
> 
> target's libiconv is added into host dependency which makes cyclic
> dependency, anyway this dependency is not needed because of assumption
> that iconv should be provided by the host.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/gettext-tiny/gettext-tiny.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master after significantly reworking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
