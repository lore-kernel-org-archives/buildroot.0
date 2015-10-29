From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Oct 2015 19:17:52 +0100
Subject: [Buildroot] [PATCH] fs/ext2: add options for extra space and
 extra inodes
In-Reply-To: <CAFGQKxcNOhG6TnWALz5BPqePSZFhchWQpwcVmbzCV10DTqPWqg@mail.gmail.com>
References: <1446073576-20337-1-git-send-email-yann.morin.1998@free.fr>
 <CAFGQKxcNOhG6TnWALz5BPqePSZFhchWQpwcVmbzCV10DTqPWqg@mail.gmail.com>
Message-ID: <20151029181752.GA3600@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-10-29 10:45 +0000, Martin Bark spake thusly:
> On 28 October 2015 at 23:06, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Add two options to the ext2 filesystem, one to add extra free space, one
> > to add extra free inodes.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  fs/ext2/Config.in       | 20 ++++++++++++++++++--
> >  fs/ext2/ext2.mk         |  2 ++
> >  package/mke2img/mke2img |  8 +++++++-
> >  3 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> > index 5b1cd0c..fb06cdd 100644
> > --- a/fs/ext2/Config.in
> > +++ b/fs/ext2/Config.in
> > @@ -45,13 +45,29 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
> >         string "filesystem label"
> >
> >  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> > -       int "size in blocks (leave at 0 for auto calculation)"
> > +       int "exact size in blocks (leave at 0 for auto calculation)"
> >         default 0
> >
> >  config BR2_TARGET_ROOTFS_EXT2_INODES
> > -       int "inodes (leave at 0 for auto calculation)"
> > +       int "exact number of inodes (leave at 0 for auto calculation)"
> >         default 0
> >
> > +config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
> > +       int "extra size in blocks" if BR2_TARGET_ROOTFS_EXT2_BLOCKS = 0
> > +       default 0
> > +       help
> > +         Enter here the nmuber of extra blocks of free space you
> 
> should be number not nmuber.

Damn keyboard dislexia! :-)

> > +         want on your filesystem. By default, Buildroot will not
> > +         leave much space free.
> > +
> > +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> > +       int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
> > +       default 0
> > +       help
> > +         Enter here the nmuber of extra free inodes you want on
> 
> Same again

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
