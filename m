From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2018 15:36:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Fix build on openrisc
In-Reply-To: <20180728114215.12530-1-bernd.kuhls@t-online.de>
References: <20180728114215.12530-1-bernd.kuhls@t-online.de>
Message-ID: <f707a8d1-c0b5-9384-24c5-3e813af384f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-07-18 13:42, Bernd Kuhls wrote:
> +else ifeq ($(BR2_or1k),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=or1k -DWITH_CPU=or1k

 IMO this should me merged into the big condition a few lines lower.

 In fact, I would change that big condition to turn it around and only do remove
-DWITH_ARCH in the case where adding it is wrong (presumably x86 only).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
