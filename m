From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 25 Oct 2019 17:17:39 -0300
Subject: [Buildroot] [PATCH 1/1] busybox: write commented login line in
 /etc/inittab when getty disabled
In-Reply-To: <CANQCQpaW=qssNfSbnLmHiR-edzfUhMmuqTA857wm5C8LfLzX1A@mail.gmail.com>
References: <20191001130948.17935-1-mailist@logilin.fr>
 <CANQCQpaW=qssNfSbnLmHiR-edzfUhMmuqTA857wm5C8LfLzX1A@mail.gmail.com>
Message-ID: <CAJ4jsaew2Cg16mm5o7iwQg=iUsh4-=2P4fovTn-eeTz84N=vuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2019 at 5:02 PM Matthew Weber <matthew.weber@collins.com> wrote:
>
> Stephen,
>
> On Tue, Oct 1, 2019 at 8:49 AM Stephen Bos <mailist@logilin.fr> wrote:
> >
> > From: Stephen Bos <stephen.bos@hagergroup.com>
> >
> > When the "Run a getty" option is disabled, busybox doesn't remove the
> > /etc/inittab line from previous builds. With this patch, the line is
> > correctly commented out.
> >
> > Signed-off-by: Stephen Bos <stephen.bos@hagergroup.com>
> > Co-authored-by: Stephen Bos <stephen.bos@hagergroup.com>
> > Co-authored-by: Christophe Blaess <christophe.blaess@logilin.fr>
>
> 1) Setup a basic busybox build and verified console was setup with
> getty after a full build
> 2) Unchecked the getty and verified it was commended out in inittab
> after a rebuild
> 3) Enabled getty and changed tty used, rebuilt and verified tty string updated
> 4) Disabled getty  and verified it was commended out after a rebuild
>
> Tested-by Matt Weber <matthew.weber@rockwellcollins.com>

I like the idea but a corresponding change should be made to sysvinit.

-- 
Carlos Santos <unixmania@gmail.com>
