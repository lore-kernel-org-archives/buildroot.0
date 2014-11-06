From: Michael Sumulong <msumulong@gmail.com>
Date: Thu, 6 Nov 2014 08:55:43 -0500
Subject: [Buildroot] e2progs and pkgconfig file
In-Reply-To: <20141105190419.GD2234@tarshish>
References: <CABDNR17g3JtFyPYmdioVzBg+OLDC9OQYk06BKPq2FiwDhEcuCw@mail.gmail.com>
 <20141105190419.GD2234@tarshish>
Message-ID: <CABDNR169STaRTagQBMptshXNcWAxk2LaQ7tjruv0ZibEYG-waA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 5, 2014 at 2:04 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Michael,
>
> On Wed, Nov 05, 2014 at 11:05:16AM -0500, Michael Sumulong wrote:
> > I am currently trying to get partclone to compile under buildroot which
> > uses the ext2fs libraries. However, I get an issue when partclone
> compiles
> > and its looking for a ext2fs.pc file under usr/lib/pkgconfig. Compiling
> > e2fsprogs for the target does not produce this file under
> > output/target/usr/lib/pkgconfig but if I compile the host-e2fsprogs it
> does
> > generate a ext2fs.pc file under output/host/usr/lib/pkgconfig. I'm not
> sure
> > if this is a bug or done on purpose for some reason.
>
> The ext2fs.pc file for the target e2fsprogs package should be under
> output/staging/usr/lib/pkgconfig/ like all other build facilities (headers,
> static libraries, etc.). The command
>
>         output/host/usr/bin/pkg-config --libs ext2fs
>
> gives the expected output on my system.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>

Yes, you're absolutely correct. I'm still fairly new to buildroot. I didn't
realize what the staging folder was for. Thanks, this helped fix my issue!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141106/36b2b832/attachment.html>
