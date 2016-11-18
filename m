From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:49:33 +0100
Subject: [Buildroot] [PATCH v2 10/15] reproducible: enable fakedate
In-Reply-To: <1479460224-6119-11-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-11-git-send-email-jezz@sysmic.org>
Message-ID: <20161118124933.68b64d53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:19 +0100, J?r?me Pouiller wrote:

> +ifeq ($(BR2_REPRODUCIBLE),y)
> +TOOLCHAIN_DEPENDENCIES += host-fakedate
> +endif

Unfortunately, this means that fakedate is only installed at the end of
the toolchain build process. So the entire toolchain is built without
fakedate installed.

Is it because we assume that the toolchain build process is safe (i.e
it doesn't call "date") ?

Perhaps it should be added in DEPENDENCIES_HOST_PREREQ instead ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
