From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 09:23:34 +0100
Subject: [Buildroot] [PATCH 3/3] package/openmvtools: don't use host
 library path
In-Reply-To: <1423437730-22997-3-git-send-email-romain.naour@openwide.fr>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
 <1423437730-22997-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150214092334.6b8cc55c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon,  9 Feb 2015 00:22:10 +0100, Romain Naour wrote:

> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
> +	CUSTOM_PROCPS_LIBS="-L$(STAGING_DIR)"

Have you tried:

	CUSTOM_PROCPS_LIBS=" "

 ?

We're already using this trick in the openvmtools package for the
libdnet detection.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
