From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 30 May 2019 16:43:22 -0700
Subject: [Buildroot] [PATCH] package/dosfstools: introduce sanitation
 step during install
In-Reply-To: <87tvdb1tba.fsf@dell.be.48ers.dk>
References: <20190529182716.12080-1-mmayer@broadcom.com>
 <931fdea6-0e1b-0074-1b14-df0c6a29f899@mind.be>
 <CAGt4E5uynqGo1Th2PB8Wq3-JKSYbcR+Drc3AuarUPKPivmeYJw@mail.gmail.com>
 <87tvdb1tba.fsf@dell.be.48ers.dk>
Message-ID: <CAGt4E5vEsXtbyfyP+SJxHEYwLm09=uEYjsrCQqL80zb8dHphEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 May 2019 at 15:16, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:
>
> Hi,
>
>  >> However, I'm wondering... dosfstools only installs things in /sbin,
>  >> /usr/share/man and /usr/share/doc. The latter two get deleted in
>  >> target-finalize. Wouldn't it be a lot easier then to manually install the
>  >> programs we need to sbin, instead of installing everything and removing what is
>  >> not needed?
>
>  > I had that first, actually. But then I was thinking that would
>  > duplicate the install logic (or at least a part of it) in the package
>  > makefile. It is unlikely, but it could lead to some unexpected
>  > dependencies between upstream tar-ball and Buildroot makefile after an
>  > update of dosfstools. But maybe that isn't a big problem or there
>  > wouldn't be any more of a dependency than with the approach above.
>
>  > I'm open to either approach. Does anybody have any thoughts one way or another?
>
> Manually installing the specific binaries we want seems like the
> simplest / clearest option to me.
>
> Care to send a patch doing that? Thanks!

Done.

Regards,
-Markus

> --
> Bye, Peter Korsgaard
