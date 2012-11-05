From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Nov 2012 07:55:50 +0100
Subject: [Buildroot] [PATCH 1/2] Add missing dependency to netatalk
In-Reply-To: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20121105075550.41dbed52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 Nov 2012 20:25:22 +0100, Maxime Hadjinlian wrote:

> -NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
> +NETATALK_DEPENDENCIES = host-pkg-config openssl berkeleydb libgcrypt libgpg-error

host-pkg-config should now be host-pkgconf.

Peter, Arnout, shouldn't we be adding a dummy 'host-pkg-config' target
in order to avoid breaking all external packages that are using
host-pkg-config? Didn't we talk about not breaking APIs? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
