From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 22 Nov 2016 09:02:25 +0100
Subject: [Buildroot] root passwd asked for reset every ssh login
In-Reply-To: <trinity-fb0422c9-2032-4095-bb6b-0656992b88fc-1479796384707@3capp-mailcom-bs04>
References: <trinity-fb0422c9-2032-4095-bb6b-0656992b88fc-1479796384707@3capp-mailcom-bs04>
Message-ID: <5e8a8f52-b8f3-7639-f091-5758d8b505c2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dagg,


you are using openssh in your image, right? The problem probably comes
from the system time not properly set or not kept by an RTC on your
target platform, which messes up openssh's file timestamp handling. In
my experience in such a scenario (target system without RTC), it's
easier to use dropbear as SSH server implementation, as it handles this
differently. (Assuming of course that you don't need any specific
feature of the OpenSSH implementation)


Regards,

Zoltan Gyarmati
https://zgyarmati.de

On 11/22/2016 07:33 AM, daggs wrote:
> Greetings,
>
> I've created a small image with ssh, I'm trying to ssh into the machine with root account (I've enabled root access for ssh) and I keep getting a msg that tells me the passwd has expired and that I need to replace it. after I replace it the connection is terminated and I need to reconnect.
> when I do reconnect and enter the new passwd, I'm greeted with the same passwd change msg.
> e.g. I cannot login as root to the machine via ssh.
>
> any ideas how to fix this?
>
> Thanks,
> Dagg.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161122/4975446b/attachment.asc>
