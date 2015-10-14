From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 14 Oct 2015 09:21:41 +0200
Subject: [Buildroot] [PATCH v2 1/8] package/dhcp: fix SysV init scripts
 option passing
In-Reply-To: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
Message-ID: <CAGduivzbpaMUfyJYWtSXnZ1SH494jVVLv7nYx3T8f62gsh6Spg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit,

On Tue, Oct 13, 2015 at 11:35 AM, Beno?t Th?baudeau <benoit@wsystem.com>
wrote:

> The SysV init scripts have configuration variables like INTERFACES whose
> contents have to be passed to the daemon. These variables are
> initialized as empty strings, but some of them are not allowed to be
> empty and there was no means of filling them apart from creating a root
> FS overlay to overwrite these scripts.
>
> This commit adds support for files under /etc/default/ to set these
> configuration variables. Such light files can now be added to the root
> FS skeleton or overlays without having to duplicate most of the SysV
> init scripts.
>
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
>
>
Thanks a lot for your work, I am afraid I am going to add to your work and
maybe be a bit of a kill joy:

What about systemd ?

There's already a service file in the dhcp package, so any changes made to
the init scripts should also be made to the .service to keep the whole
package coherent.

If you need any help/tips, do ask.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151014/d405aafd/attachment.html>
