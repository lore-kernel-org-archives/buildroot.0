From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:59:22 +0200
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.7
In-Reply-To: <20200604123926.18731-1-peter@korsgaard.com>
References: <20200604123926.18731-1-peter@korsgaard.com>
Message-ID: <20200604225922.2ccd77a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 14:39:26 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2020-13254: Potential data leakage via malformed memcached keys
> 
>   In cases where a memcached backend does not perform key validation,
>   passing malformed cache keys could result in a key collision, and
>   potential data leakage.  In order to avoid this vulnerability, key
>   validation is added to the memcached cache backends.
> 
> - CVE-2020-13596: Possible XSS via admin ForeignKeyRawIdWidget
> 
>   Query parameters for the admin ForeignKeyRawIdWidget were not properly URL
>   encoded, posing an XSS attack vector.  ForeignKeyRawIdWidget now ensures
>   query parameters are correctly URL encoded.
> 
> For details, see the announcement:
> https://docs.djangoproject.com/en/dev/releases/3.0.7/
> 
> Additionally, 3.0.5..3.0.7 contains a number of non-security related
> bugfixes.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
