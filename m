From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 15 Aug 2017 08:14:19 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
In-Reply-To: <20170814222528.1ca21238@windsurf>
References: <20170813133111.3959-1-francois.perrad@gadz.org>
 <20170814222528.1ca21238@windsurf>
Message-ID: <CAB0FRsuYHMSgoMqpkyq2ieQL54hh6EVywUTv=jBAqdgNZcZdWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-08-14 22:25 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 13 Aug 2017 15:31:11 +0200, Francois Perrad wrote:
> > `install` works even when the directory pkgconfig is not already created
> >
> > see http://autobuild.buildroot.net/results/101/
> 101c89e1d6aee942a0b1c4e4f3daf8ac2414a56c/
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> This commit log doesn't explain why you're moving things to configure
> commands. And in fact, I believe the original code in which we do the
> SED at install time was more logical. So I've kept that, and just added
> the missing "mkdir -p" first.
>
> See:
> https://git.buildroot.org/buildroot/commit/?id=
> 25a2650086ad9fe0e22e2a2c3d4e64cae396fcf1
>
>
Thomas

The issue that we try to fix, was introduced 5 days ago, by the commit
[lua: fix pkg-config file](
https://git.busybox.net/buildroot/commit/package/lua?id=8d845683e37640d33c186c0091ccce6ae3ef0777
)

My patch restore the previous install commands.
If the lua.pc must be modified with configuration data, the logical step
for this is the configure step.

Your patch is the little one which fixes the issue, but it doesn't see the
root cause.

Fran?ois


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170815/458be893/attachment.html>
