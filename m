From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:14:32 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/jq: add oniguruma optional dependency
In-Reply-To: <20190320203617.27496-2-fontaine.fabrice@gmail.com>
References: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
 <20190320203617.27496-2-fontaine.fabrice@gmail.com>
Message-ID: <20190331151432.52efa3b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Mar 2019 21:36:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  # jq explicitly enables maintainer mode, which we don't need/want
> -JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
> -HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
> +JQ_CONF_OPTS += --disable-maintainer-mode
> +HOST_JQ_CONF_OPTS += --disable-maintainer-mode
> +
> +HOST_JQ_CONF_OPTS += --with-oniguruma
> +HOST_JQ_DEPENDENCIES += host-oniguruma

What decided you to add onigurama as a mandatory dependency for
host-jq ? What feature does it bring ? Do we really need it as a
mandatory dependency ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
