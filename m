From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 18:33:43 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
In-Reply-To: <CAKvQZ_0r6DyEt=1XZWZ5RwFYg-LaU1xvyJcYTVn0sje+696nkA@mail.gmail.com>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
 <CAKvQZ_0r6DyEt=1XZWZ5RwFYg-LaU1xvyJcYTVn0sje+696nkA@mail.gmail.com>
Message-ID: <201301031833.44543.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Willy, All,

On Thursday 03 January 2013 Willy Lambert wrote:
> 2013/1/3 Steve Calfee <stevecalfee@gmail.com>:
[--SNIP--]
> > Maybe we are talking about different things. I think there is a config
> > option in buildroot that allows you to build multiple output
> > filesystems, I believe I have created ext4 and a tar.gz as outputs. I
> > think there are also various flash file systems you can create.
> 
> I'm curious to know how you do ext4 from BR. I did not found that, and
> ASAIK, there is no documentation about outputs (and it's a real pain
> for new comers like me)

Indeed, not sure about ext4. But it's doable for ext3:
  - first create an ext2 filesystem with genext2fs
  - then add the ext3 feature with something like tune2fs -j

As for ext4, it is probably not possible, as it is really different from
an ext2/3 filesystem.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
