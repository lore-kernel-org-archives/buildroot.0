From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 10 Jan 2014 12:01:22 +0100
Subject: [Buildroot] [PATCH v11 2/8] package: add toolchain dependency
 to every target package
In-Reply-To: <1389348368-2509-3-git-send-email-fabio.porcedda@gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
 <1389348368-2509-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHXCMM+=hgEKtMQ2Bodb4K+n4=Mxzv0P06w0-8Gu4fXr02fixg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, all,


2014/1/10 Fabio Porcedda <fabio.porcedda@gmail.com>

> This commit makes the dependency from the target toolchain explicit.
> This way we can buid from command line a package that use
> innger-generic-package right after the configuration phase, example:
>
s/innger-generic-package/inner-generic-package/
(just nitpicking ;-))


>         make clean <package-name>
>
> Also remove TARGETS_ALL because the only purpose was to add toolchain
> dependency so it's superseded by this commit.
>
> To prevent circular dependency add the new variable
> <pkgname>_ADD_TOOLCHAIN_DEPENDENCY to avoid adding the toolchain
> dependency for toolchain packages.
>
> This is also a step forward supporting top-level parallel make.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140110/8386bd22/attachment.html>
