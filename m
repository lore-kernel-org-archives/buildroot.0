From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 3 Oct 2019 09:36:42 +0300
Subject: [Buildroot] Problem openning buildroot tar after upgrading
In-Reply-To: <87eezu2w3h.fsf@dell.be.48ers.dk>
References: <CALFsTFVozBqGts4hy071EA-DO6_sy85bibig_vM2QPHTqm3xxA@mail.gmail.com>
 <87eezu2w3h.fsf@dell.be.48ers.dk>
Message-ID: <CALFsTFXMUEAgPktGUW8_9GKhq=jqT1y=vDc1f9+NeQjj5fL5ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 3, 2019, 09:15 Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:
>
>  > Hello all,
>  > Recently, I've upgraded my Buildroot version from 2018.05 to 2019.05.
>  > I build my rootfs image with tar and I encounter some problems when I
> try
>  > to open the archive on the board. During the extraction I noticed the
>  > following message:
>  > tar: warning: skipping header 'x
>  > In addition, every file with path longer than 99 chars is truncated.
>  > I digged through the history and saw Yann's commit (6d688e2132: fs/tar:
> add
>  > support for xattrs). I locally removed the --xattrs-include flag and now
>  > everything looks fine.
>
>  > This seems like a known problem with old busybox versions (
>  > http://lists.busybox.net/pipermail/busybox/2012-February/077412.html).
>
> :/
>
>  > Unfortunately, I can't upgrade my busybox version, but I still want to
> be
>  > able to open the archive. I also tried to pass --no-attrs to
>  > BR2_TARTGET_ROOTFS_TAR_OPTIONS, but it doesn't seem to work.
>
> You presumably only mistyped the option here in the email and not when you
> tried it?
>

Yeah, my bad here :)


> You could also try to force it into using gnu format (which your old
> busybox apparently supports) by passing --format=gnu
>

Actually, I tried that too (and also the other formats), but it doesn't
work...


> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191003/9fa538f8/attachment.html>
