From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Oct 2014 15:21:58 -0300
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <87k34acu9a.fsf@dell.be.48ers.dk>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>	<87eguieaky.fsf@dell.be.48ers.dk>
 <5435748A.3090106@zacarias.com.ar> <87k34acu9a.fsf@dell.be.48ers.dk>
Message-ID: <543580C6.1090600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 03:05 PM, Peter Korsgaard wrote:

> Random is not good, so I suggest we either:
> 
> - Only do it for bash like today

That's not an option: non-usable default rootfs if there's no /bin/sh.

> - Provide an option for the user to select

It's possible, probably best in System Configuration an option that
selects the appropiate package.
I wouldn't pull in busybox though, only make the option available if
BR2_PACKAGE_BUSYBOX.
And make the symlink in target-finalize to avoid touching the packages
much (actually making them simpler).

> - Decide on a fixed priority order (E.G. busybox->dash->zsh->bash) and
>   tell people to use a post-build script if they are not happy with it

It's a pretty arbitrary decision, many people would balk at the idea of
having bash as default yet they may need it for other uses.
Regards.
