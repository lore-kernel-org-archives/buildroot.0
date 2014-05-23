From: Tom Deblauwe <tom.deblauwe@ebo-enterprises.com>
Date: Fri, 23 May 2014 09:41:28 +0200
Subject: [Buildroot] dev-tty1 and systemd
In-Reply-To: <537DEE71.5050600@ebo-enterprises.com>
References: <537DEE71.5050600@ebo-enterprises.com>
Message-ID: <537EFBA8.3030508@ebo-enterprises.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-05-14 14:32, Tom Deblauwe wrote:
> This works and starts, however, I then get the problem that systemd can
> not open the /dev/tty1 device. It searches for dev-tty1.device. I
> suspect it has something to do with busybox keeping a hold on tty1 or
> something like that. I already tried using "console=tty3" as a kernel
> cmdline but that didn't help. The dev-tty1.service still can not get a
> hold of /dev/tty1.
>
> Anybody knows what is going on?

It seems the
/etc/systemd/system/getty.target.wants/serial-getty at tty1.service symlink
wants to have the dev-tty1.device unit, but that doesn't work.

I just don't use it and use ALT+F2 to get a text console, which just works.

Regards,
Tom,
Email Confidentiality: e-BO Enterprises<http://www.ebo-enterprises.com/> Company Registration Number BE 0470174242. This email message and any attachments are for the sole use of the intended recipient(s) and may contain information that is proprietary to e-BO Enterprises<http://www.ebo-enterprises.com/>. If you have received this message in error, please notify the sender by reply, and delete all copies of this message and any attachments. If you are the intended recipient you may use the information contained in this message and any files attached to this message only as authorized by e-BO Enterprises<http://www.ebo-enterprises.com/>. Any unauthorized use, dissemination or disclosure of this message or its attachments is strictly prohibited. The contents of this e-mail are not to be considered binding upon e-BO Enterprises<http://www.ebo-enterprises.com/>.
