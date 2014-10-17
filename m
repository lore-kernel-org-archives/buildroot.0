From: Paassen, Hiram van <Hiram.van.Paassen@mastervolt.com>
Date: Fri, 17 Oct 2014 07:12:37 +0000
Subject: [Buildroot] systemctl enable
Message-ID: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A4987B2@AMEHLEX02.ehl.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We use buildroot and systemd. We used to enable services on build by
making the relevant symlinks. However broken symlinks in our VCS are a
bit annoying and we were risking getting out of sync between the
[install] section in the unit file and the actual installed symlinks.

So after asking around on the systemd mailing list someone from open
embedded suggested this script:
https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/systemd/systemd-systemctl/systemctl

This works great but is still means that all our services need to
execute this from the SERVICE_FOO_INSTALL_INIT_SYSTEMD hook.

I think this can be generalized even further by adding another systemd
hook/list so that you can do

SERVICE_FOO_SYSTEMD_UNIT_FILE += $(@D)/service_foo.service

from your packages service_foo.mk
and then it will be "enabled" automatically on install when systemd is
installed. I expect that the SERVICE_FOO_INSTALL_INIT_SYSTEMD is mostly
used for installing unit files and this makes it a bit easier

With kind regards,

Hiram


________________________________

Power Products, LLC Email Notice

This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.

Thank you.
