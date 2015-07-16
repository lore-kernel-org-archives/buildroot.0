From: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>
Date: Thu, 16 Jul 2015 23:27:24 +0200
Subject: [Buildroot] [PATCHv2] transmission: improve systemd support
In-Reply-To: <CAGduivy48ijCY6MxObh2KNJjEii8R9s89T5f7mVWOMB_-shE6w@mail.gmail.com>
References: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
 <1436881866-2168-1-git-send-email-aurelien@chabot.fr>
 <CAGduivy48ijCY6MxObh2KNJjEii8R9s89T5f7mVWOMB_-shE6w@mail.gmail.com>
Message-ID: <CAJup9chhK-zNzDyB0HvO4eWRm3T_u5-zMs70BcoeDbRMXm+wZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 14, 2015 at 4:05 PM, Maxime Hadjinlian <
maxime.hadjinlian@gmail.com> wrote:

> Have you tested with a read-only file system ? Since
> /var/lib/transmission is not a tmpfs, I don't know if transmission
> will be very happy about that.
>

From what I try, transmission doesn't crash or stop if it cannot write it's
configuration. That's why I remove the tmpfs. Moreover the tmpfs stuff was
only added for systemd, and if we choose to do that we should do the same
for sysvinit.

I just saw a well that with systemd the folder /var/lib/transmission is not
created, so I should have kept the line creating the folder.
BTW, is it really the prefer solution to user sysuser.d instead of the
buildroot user target ? Isn't this cause also problem on read only fs,
because ets/passwd will not be writable ?

Aur?lien
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150716/c2794fc3/attachment-0001.html>
