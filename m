From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Feb 2012 09:49:04 -0300
Subject: [Buildroot] build of e2fsprogs fails (2012.02-rc3)
In-Reply-To: <1330432739.2274.31.camel@sven>
References: <1330427777.2274.27.camel@sven>
 <3d41058a0f241311e2b0fe5c2e3c9d1c@zacarias.com.ar>
 <1330432739.2274.31.camel@sven>
Message-ID: <59807857ff1ce335fc4e3042f1db053b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-28 09:38, Sven Neumann wrote:

> Well, this probably used to be a default uclibc configuration three
> years ago. Since then we have updated buildroot several times and
> obviously our ubclibc configuration diverged. What would be the best 
> way
> to go back to the default uclibc configuration?
>
> Nevertheless, you should consider the patch I've sent as the
> BR2_PACKAGE_E2FSPROGS_E4DEFRAG option is currently not correctly
> handled.
>
>
> Regards,
> Sven

It's likely, since then many new packages started using ftw extensively 
so the default configuration was updated, precisely by Thomas on April 
2010.
The option is handled by removing the binary when it is disabled... 
down in E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E4DEFRAG) += 
e4defrag
However i see no harm in your patch so Acked by me in principle since 
it also fixes the bklid change.
Regards.
