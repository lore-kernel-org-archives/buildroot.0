From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:40:35 +0100
Subject: [Buildroot] [PATCH v2 05/15] reproducibility/linux: override
 build timestamp
In-Reply-To: <1479460224-6119-6-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-6-git-send-email-jezz@sysmic.org>
Message-ID: <20161118124035.2a18431b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:14 +0100, J?r?me Pouiller wrote:

> +ifeq ($(BR2_REPRODUCIBLE),y)
> +LINUX_MAKE_ENV += \
> +	KBUILD_BUILD_VERSION=1 \
> +	KBUILD_BUILD_USER=buildroot \
> +	KBUILD_BUILD_HOST=buildroot \
> +	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"

With your "fakedate" script, do we really need this last line?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
