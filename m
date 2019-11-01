From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Fri, 1 Nov 2019 12:20:13 +0100
Subject: [Buildroot] [PATCH] package/openresolv: bump to version 3.9.2
In-Reply-To: <87bltw4lrp.fsf@dell.be.48ers.dk>
References: <1571124033-15304-1-git-send-email-tolvupostur@gmail.com>
 <8736fb6co8.fsf@dell.be.48ers.dk>
 <CABhNV21YvkEH5k-t7zQD2qi8uJxP6BOxJyAdPiX4i==jOcLuhg@mail.gmail.com>
 <87bltw4lrp.fsf@dell.be.48ers.dk>
Message-ID: <CABhNV21QXgdpsrzS4eUHbGuWhWL6WOR1XhxWzAQ+E34E_91tdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Fri, 1 Nov 2019 at 10:18, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Einar" == Einar J?n <tolvupostur@gmail.com> writes:
>
> Hi,
>
>  >> What does this mean exactly? I take it you refer to the '# ethX' we add
>  >> to /etc/resolv.conf so we can remove the lines once the interface is
>  >> again down.
>
>  > Exactly those, and similar lines (if any) in head/tail files.
>
> Ok, does the logic in /usr/share/udhcpc/default.script to remove name
> servers again when an interface is brought down then still work?
>

Openresolv removes the comments from /etc/resolv.conf which breaks the
logic in /usr/share/udhcpc/default.script. But openresolv takes care of
that
if you add this section to a /usr/share/udhcpc/default.script.d/whatever
  deconfig)
     [ "$METHOD" = dhcp ] && /sbin/resolvconf -f -d "$interface"
     /sbin/resolvconf -f -d "$interface.$ADDRFAM"

Best regards
Einar J?n
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191101/9e1a9d80/attachment.html>
