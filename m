From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 21:46:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: enable back static
 build
In-Reply-To: <20190416094106.30125-1-fontaine.fabrice@gmail.com>
References: <20190416094106.30125-1-fontaine.fabrice@gmail.com>
Message-ID: <2c6d4d36-9621-e141-fc31-436d8fd3921e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2019 11:41, Fabrice Fontaine wrote:
> +# Disable plugins as some of them (like l16mono) can't be built statically
> +ifeq ($(BR2_STATIC_LIBS),y)
> +WIRESHARK_CONF_OPTS += \
> +	-DENABLE_PLUGINS=OFF \
> +	-DENABLE_STATIC=ON
> +else
> +WIRESHARK_CONF_OPTS += \
> +	-DENABLE_PLUGINS=ON \
> +	-DENABLE_STATIC=OFF

 I don't know what this option does, but is it the appropriate thing to do in
the STATIC_SHARED case?

 Regards,
 Arnout

> +endif
