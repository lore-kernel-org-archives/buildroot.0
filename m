From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:32:10 +0100
Subject: [Buildroot] [PATCH 1/1] msmtp: fix configure with openssl/gnutls
In-Reply-To: <20181229012134.2037-1-bluemrp9@gmail.com>
References: <20181229012134.2037-1-bluemrp9@gmail.com>
Message-ID: <20181230163210.65f9f424@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 17:21:34 -0800, Ryan Coe wrote:
> Msmtp no longer uses openssl as default [1]. The configure options have
> changed from --use-ssl to --use-tls. As a note, openssl usage is discouraged
> and may be removed in the future.
> 
> [1] https://marlam.de/msmtp/news/openssl-discouraged/
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/msmtp/msmtp.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I've reworked the commit log to indicate since when msmtp has changed
this configure option: it is quite important to know for our stable/LTS
branches. Also, I've dropped the indication that openssl is no longer
the default: it is unrelated to this specific patch.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
