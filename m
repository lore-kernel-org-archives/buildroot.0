From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Jan 2017 15:38:49 +0200
Subject: [Buildroot] [PATCH v3 1/1] git-crypt: new package
In-Reply-To: <20170130132702.85804-1-francesconegri@gmail.com>
References: <20170130105808.86147-1-francesconegri@gmail.com>
 <20170130132702.85804-1-francesconegri@gmail.com>
Message-ID: <20170130133849.a4ybqgk4filn5o7h@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francesco,

Looks good now except for one more comment below.

On Mon, Jan 30, 2017 at 02:27:02PM +0100, Francesco Negri wrote:
> Signed-off-by: Francesco Negri <francesconegri@gmail.com>

[snip]

> diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
> new file mode 100644
> index 000000000..3ef2bd26f
> --- /dev/null
> +++ b/package/git-crypt/git-crypt.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# git-crypt
> +#
> +################################################################################
> +
> +GIT_CRYPT_VERSION = 0.5.0
> +GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
> +GIT_CRYPT_DEPENDENCIES = git openssl
> +GIT_CRYPT_LICENSE = GPLv3
> +GIT_CRYPT_LICENSE_FILES = COPYING

Source code files include the "or any later version" language, so the license 
should be GPLv3+.

A few files (parse_options.*, fhstream.*) are under the MIT license.

The end result it:

GIT_CRYPT_LICENSE = GPLv3+, MIT
GIT_CRYPT_LICENSE_FILES = COPYING parse_options.hpp

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
