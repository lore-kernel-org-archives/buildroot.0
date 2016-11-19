From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 13:39:24 +0100
Subject: [Buildroot] [PATCH v2 14/15] python3: remove full path from .pyc
In-Reply-To: <1479460224-6119-15-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-15-git-send-email-jezz@sysmic.org>
Message-ID: <b73568be-b1ca-f527-998b-3011f0244292@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> .pyc files include path to source .py file. This patch change the way
> `pycompile.py' is launched in order to only keep part relative to $TARGET_DIR.
> 

 Same as for python.

> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/python3/python3.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 158c29c..3b2dd31 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -240,9 +240,9 @@ endif
>  
>  define PYTHON3_CREATE_PYC_FILES
>  	PYTHONPATH="$(PYTHON3_PATH)" \
> -	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
> -		support/scripts/pycompile.py \
> -		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
> +	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
> +		$(TOPDIR)/support/scripts/pycompile.py \
> +		usr/lib/python$(PYTHON3_VERSION_MAJOR)
>  endef
>  
>  ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
