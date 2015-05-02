From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 09:45:02 +0200
Subject: [Buildroot] [PATCH v2 2/3] php: fpm sapi: install php-fpm.conf
In-Reply-To: <1430503955-24928-3-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <1430503955-24928-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150502094502.5b8f127f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri,  1 May 2015 20:12:34 +0200, Floris Bos wrote:
> Install a custom php-fpm.conf instead of the stock one.
> 
> - Listening on /var/run/php-fpm.sock instead of TCP port so we can
>   restrict access to webserver user www-data.
> - Using ondemand pm, so PHP children are only started after a PHP
>   request, instead of kept resident all the time.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> 
> ---
> v2: limit children to 5 by default
> ---
>  package/php/php-fpm.conf | 14 ++++++++++++++
>  package/php/php.mk       |  8 ++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 package/php/php-fpm.conf

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
