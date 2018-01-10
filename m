From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 10 Jan 2018 08:18:44 -0200
Subject: [Buildroot] [PATCH v2] snort: new package
In-Reply-To: <20180110111219.10aeca4b@windsurf.lan>
References: <1515575890-29518-1-git-send-email-sergio.prado@e-labworks.com>
 <20180110111219.10aeca4b@windsurf.lan>
Message-ID: <CANu7NGujnMQn3506sng4b7-P09TZbxFDUk3o3W4uwpcfxGAz=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> That's not the right way of fixing the problem, as your patch is not
> upstreamable. The right way is to use AC_CACHE_CHECK(), so that you can
> preseed the variable value from the environment to avoid the
> AC_TRY_RUN() test, and still do the test if no value is preseeded in
> the environment.
>
> AC_CACHE_CHECK([whether ... is available], [have_inaddr_none],
>         [AC_RUN_IFELSE(......, [have_inaddr_none=yes],
[have_inaddr_none=no])])
>
> if test "x$have_inaddr_none" = "xno"; then
>  ...
> fi
>
> With this in place, you can pass have_inaddr_none=yes in
> SNORT_CONF_ENV. The configure script will skip the AC_RUN_IFELSE() test
> and assume have_inaddr_none=yes is correct.
>
> And if you do this, you can send the patch upstream.

Understood. I'll review the patch and send V3.

Best regards,

Sergio Prado
Embedded Labworks
https://e-labworks.com/en
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180110/90806497/attachment.html>
