From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 27 Mar 2014 00:41:53 +0100
Subject: [Buildroot] [PATCH v11] xbmc: new package
In-Reply-To: <87mwgcim34.fsf@dell.be.48ers.dk>
References: <1395875160-14253-1-git-send-email-yann.morin.1998@free.fr>
 <87mwgcim34.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivyMu4pW5ky+5RBTa+Tn36oA_SqABTMhBN=j-Fw7A3_JDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hurray !
On 27 Mar 2014 00:20, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>  > XBMC is an award-winning free and open source (GPL) software media
>  > player and entertainment hub for digital media.
>
>  > We do provide a sub-option for each major feature we support, to avoid
>  > letting the user hunt-down required libraries, since the dependency is
>  > not always obvious and straightforward.
>
>  > We also provide our own wrapper script, because the ones bundled in
>  > XBMC are not suitable to all platforms. We need such a wrapper script
>  > because XBMC exits with different exit codes, depending on how the user
>  > quit XBMC: 0 is normal exit, 64 is for halt, and 66 is for reboot. So
>  > we can't simply call the real XBMC binary from the startup script, or
>  > we would lose this information. So, we provide a wrapper script that
>  > takes appropriate action according to the above exit codes.
>
>  > When run as root from a startup script, there is no HOME set, so XBMC
>  > defaults to saving its configuration in /.xbmc (yes, at the root of the
>  > rootfs). Since this does not play well with read-only filesystems (and
>  > is inherently ugly anyway), and sicne there is no real clean way to
tell
>  > XBMC where to store its configuration, just provide a symlink to a
better
>  > place: /.xbmc -> /var/xbmc  (note: the only location _guaranteed_ to be
>  > writable is /tmp, but we want the configuration to survive a reboot.
So,
>  > /var/xbmc looks a better place than /var/run/xbmc. and the user will
>  > have to take action to ensure /var/xbmc be writable.) (note: for this
>  > reason, we do not want to set $HOME to /root either, even if it is root
>  > running XBMC.)
>
>  > Some of XBMC sub-options select libraries that depend on toolchain
options,
>  > such as IPv6. But those are already covered, being also implicit
>  > dependencies of XBMC, as XBMC can only be used on an (e)glibc toolchain
>  > anyway. When^WIf XBMC is one day buildable under uClibc/musl, this
will be
>  > time to revisit those dependencies.
>
>  > This package was originally found at :
https://github.com/huceke/buildroot-rbp
>  > By gimli <ebsi4711@gmail.com>
>
>  > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: gimli <ebsi4711@gmail.com>
>  > Cc: Martin Bark <martin@barkynet.com>
>  > ---
>  > Chamges v10 -> v11:
>
> Heh ;)
>
> Committed, thanks both!
Hurray !!

Thanks Peter !
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140327/d4bd3391/attachment.html>
