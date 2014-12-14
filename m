From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 14 Dec 2014 09:33:32 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing shared/static handling
In-Reply-To: <87sigjp2if.fsf@dell.be.48ers.dk>
References: <1418508052-25062-1-git-send-email-angelo.compagnucci@gmail.com>
 <87sigjp2if.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VnvmaZRiLX2Rke6_bezKUdxYCWiQoOsOvkRKg94m8L0cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

2014-12-14 0:13 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > Mono should always be compiled with --enable-static, this patch forces
>  > --enable-static also in case of shared only libraries.
>
> Why? If it is really required, then mono should depend on
> !BR2_SHARED_LIBS and show a comment to inform the user that it needs
> static library support.

Mono doesn't really uses shared libraries at all, it ships its own
glibc (eglib) and its own libmono library, It should be compiled
statically for this reason, you can find further details here:
http://www.mono-project.com/docs/compiling-mono/unsupported-advanced-compile-options/#static-vs-dynamic-mono
.

Before the new shared/static handling, --enable-static was always
passed as a configure option.

Sincerely, Angelo
