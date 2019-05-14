From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 09:51:31 +0200
Subject: [Buildroot] [PATCH v2 2/7] boot/optee-os: install trusted
 shared libraries
In-Reply-To: <20190514073902.3775-2-etienne.carriere@linaro.org>
References: <20190514073902.3775-1-etienne.carriere@linaro.org>
 <20190514073902.3775-2-etienne.carriere@linaro.org>
Message-ID: <20190514095131.092f1b50@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Tue, 14 May 2019 09:38:57 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> +	$(if $(wildcard $(OPTEE_OS_SDK)/lib/*.ta),

OPTEE_OS_SDK is only populated if BR2_TARGET_OPTEE_OS_SDK=y, but
services/libs are installed if BR2_TARGET_OPTEE_OS_SERVICES=y.

So if BR2_TARGET_OPTEE_OS_SDK is disabled, but
BR2_TARGET_OPTEE_OS_SERVICES=y, this will not copy anything. Is this
the indented behavior ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
