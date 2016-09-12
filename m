From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:15:00 +0200
Subject: [Buildroot] [PATCH v2,1/4] apache: add customization of MPM
In-Reply-To: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160912231500.46ff2c9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 00:26:05 +0200, Fabrice Fontaine wrote:

> +ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT),y)
> +APACHE_MPM = event
> +else ifeq ($(BR2_PACKAGE_APACHE_MPM_PREFORK),y)
> +APACHE_MPM = prefork
> +else

I've changed this to:

else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)

just for the sake of consistency. And then I've applied your patch.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
