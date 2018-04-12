From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 13:32:21 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: new package
In-Reply-To: <1523524619-25036-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523524619-25036-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180412133221.2beb022e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version, looks much better. A few more comments
below, nothing major.

On Thu, 12 Apr 2018 11:16:59 +0200, Guillaume W. Bres wrote:
> Reaver is a tool to audit networks against brute WPS pins attacks.
> 
> It is a generic autotools package, easy to build. Tests passed for the 7 default
> toolchains. 
> 
> It is mandantory to use the github.com/t6x fork that I set in reaver.mk
> at the moment because other versions/repos of this project won't cross-compile.
> Their makefiles are pretty outdated. It is the only updated and regularly maintained
> repo that I found for this project at the moment.

I think it would make sense to have this explanation before the
REAVER_SITE variable in the .mk file.

> -N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
> +N:	Guillaume W. Bres <guillaume.bressaix@gmail.com>

This change is not really related. Is it an intended change? It should
preferably be part of a separate patch.

>  F:	package/liquid-dsp/
> +F: package/reaver/

Indentation is wrong.

> diff --git a/package/reaver/Config.in b/package/reaver/Config.in
> new file mode 100644
> index 0000000..fed433b
> --- /dev/null
> +++ b/package/reaver/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_REAVER
> +	bool "reaver"
> +	select BR2_PACKAGE_LIBPCAP
> +

This empty line is not needed.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
