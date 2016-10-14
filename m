From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 11:29:36 +0200
Subject: [Buildroot] [PATCH 03/10] core: offload handling of
 BR2_EXTERNAL into the script
In-Reply-To: <7715d5d66e4d09a1d56432fcbbd8578bdade0663.1475399381.git.yann.morin.1998@free.fr>
References: <cover.1475399381.git.yann.morin.1998@free.fr>
 <7715d5d66e4d09a1d56432fcbbd8578bdade0663.1475399381.git.yann.morin.1998@free.fr>
Message-ID: <20161014112936.272bf8e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Oct 2016 11:09:52 +0200, Yann E. MORIN wrote:

> +$(shell support/scripts/br2-external \
> +	-m \
> +	-o '${BR2_EXTERNAL_FILE}' \
> +	$(BR2_EXTERNAL))

Excessive newline usage here. Also, why ${} instead of $() ?

> +BR2_EXTERNAL_ERROR =
> +include $(BR2_EXTERNAL_FILE)
> +ifneq ($(BR2_EXTERNAL_ERROR),)
> +$(error $(BR2_EXTERNAL_ERROR))
>  endif

I don't really like this BR2_EXTERNAL_ERROR variable that gets written
in the .mk file by the br2-external script if it fails, and then
re-used here. But I'm not sure I have a better proposal.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
