From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 17 Oct 2014 12:12:45 +0200
Subject: [Buildroot] systemctl enable
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A4987B2@AMEHLEX02.ehl.pri>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A4987B2@AMEHLEX02.ehl.pri>
Message-ID: <CAGduivz6FM3PLLMMLaNN5xCWfDdAGfkQLPvhnh4ynu1bbo8muA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hiram, all

On Fri, Oct 17, 2014 at 9:12 AM, Paassen, Hiram van
<Hiram.van.Paassen@mastervolt.com> wrote:
> Hi,
>
> We use buildroot and systemd. We used to enable services on build by
> making the relevant symlinks. However broken symlinks in our VCS are a
> bit annoying and we were risking getting out of sync between the
> [install] section in the unit file and the actual installed symlinks.
>
> So after asking around on the systemd mailing list someone from open
> embedded suggested this script:
> https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/systemd/systemd-systemctl/systemctl
>
> This works great but is still means that all our services need to
> execute this from the SERVICE_FOO_INSTALL_INIT_SYSTEMD hook.
>
> I think this can be generalized even further by adding another systemd
> hook/list so that you can do
>
> SERVICE_FOO_SYSTEMD_UNIT_FILE += $(@D)/service_foo.service
I am currently working on such an "auto" install feature. And at the
moment, it looks itself for *.service file.
But I push for having a variable, since a lot of new packages will
have init scripts in their sources.
So it's a work in progress, I will push my current branch as an RFC as
soon as it's cleaned up (should be this week end). And then we could
discuss things further.
What would be really nice, would be to have some kind of infra
structure to chose which services should be part of which targets, and
so on. But that'll be done at a later time I think.
>
> from your packages service_foo.mk
> and then it will be "enabled" automatically on install when systemd is
> installed. I expect that the SERVICE_FOO_INSTALL_INIT_SYSTEMD is mostly
> used for installing unit files and this makes it a bit easier
>
> With kind regards,
>
> Hiram
>
>
> ________________________________
>
> Power Products, LLC Email Notice
>
> This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
> This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
> If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.
>
> Thank you.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
