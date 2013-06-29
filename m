From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 28 Jun 2013 18:49:03 -0700
Subject: [Buildroot] how does buildroot avoid requireing root?
In-Reply-To: <1372466836.28302.157.camel@localhost>
References: <1372466836.28302.157.camel@localhost>
Message-ID: <CALo-6+htLdUcBYWZxPyjjWTd9fVR7u0STqpR1B3AJMSY9n3fxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Its done with the "fakeroot" scripts. Google that and you can see how root
filesystem builders like buildroot work that piece of magic.

It became impractical to build root file systems for embedded targets a few
years ago when folks started using shared servers that had no root access,
amongst other reasons.

Charles
On Jun 28, 2013 5:58 PM, "John Stile" <john@stilen.com> wrote:

> I am confused about how buildroot creates busybox.
>
> There are notes that one must ensure that busybox setuid root.
>
> Performing this operation must be performed as root:
>    chown 0.0 /bin/busybox; chmod 4755 /bin/busybox
>
> Yet when I use buildroot I never become root.
>
> How does buildroot accomplish this?
>
> In output/build/busybox-1.18.5 I see applets/install.sh calls:
>   install -m 755 busybox $prefix/bin/busybox || exit 1
>
> but I don't see how this becomes setuid?
>
> On my embedded system, I see:
> -rwsr-xr-x    1 root     root        605876 Jun 28  2013 /bin/busybox*
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130628/ff9485dd/attachment.html>
