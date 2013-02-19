From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Feb 2013 00:47:06 +0100
Subject: [Buildroot] [PATCH 4/4] fs/ext: add support for ext2 rev0 and
	rev1
In-Reply-To: <51240D7B.7070608@mind.be>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <201302191910.33509.yann.morin.1998@free.fr> <51240D7B.7070608@mind.be>
Message-ID: <201302200047.06727.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 20 February 2013 Arnout Vandecappelle wrote:
> On 19/02/13 19:10, Yann E. MORIN wrote:
[--SNIP--]
> > Not sure. ext2 rev1 is just that: a revision 1 ext2. ext3 or ext4 rev1
> > do not mean anything, AFAIK.
>   They are partly independent - although ext4 is not possible with 
> rev0... And in practice you want rev1 for ext3 filesystems as well. 
> Actually, you always want rev1, except when you have a stupid bootloader 
> that doesn't support it.
> 
>   So what I meant is: set revision to 1, except for ext2r0.

Even ext3 is always rev1, anyway.

Anyway, I've reworked the code, and am doing some tests. On track for
being pushed by the end of the week...

[--SNIP--]
> > Also, I'll rework the code as thus:
> >
> >      ext_opts=""
> >      ext_opts_O=""
> >      if ! ext2rev0:
> >          ext_opts_O+="filetype"
> >      if ext3:
> >          ext_opts+="-j -J size=1"
> >      if ext4:
> >          ext_opts_O+="extents,uninit_bg,dir_index"
> >      if ext_opts_O != "":
> >          ext_opts+="-O ext_opts_O"
> >      tune2fs ext_opts img
> >      e2fsck img
> >
> > That is even better, I think.
> 
>   Agreed! Moving to Python is certainly better! :-)
> 
>   BTW doesn't tune2fs support -O x -O y options?

Yes, probably, that was just a quick-and-dirty pseudo code for the sake
of illustration. ;-)

Regards,
Yann E. MORIN, going to sleep in a short while...

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
