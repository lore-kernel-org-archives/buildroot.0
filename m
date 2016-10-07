From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:51:30 +0200
Subject: [Buildroot] [PATCH v3 1/2] paho-mqtt-c: new package
In-Reply-To: <1475141999-19771-1-git-send-email-Pranit.Sirsat@imgtec.com>
References: <1475141999-19771-1-git-send-email-Pranit.Sirsat@imgtec.com>
Message-ID: <20161007155130.15130229@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Sep 2016 15:09:58 +0530, Pranit Tanaji Sirsat wrote:

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +PAHO_MQTT_C_DEPENDENCIES = openssl
> +PAHO_MQTT_C_CONF_OPTS = -DPAHO_WITH_SSL=TRUE
> +else
> +PAHO_MQTT_C_CONF_OPTS = -DPAHO_WITH_SSL=FALSE
> +endif

We normally use += instead of = for assignments inside conditions. So
I've changed these to use +=, and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
