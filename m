From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jul 2015 23:19:16 +0200
Subject: [Buildroot] [PATCH 1/2] fs/iso9660: fix hybrid image support
In-Reply-To: <20150730170352.0331b2c4@free-electrons.com>
References: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
 <20150730165052.1eea5a29@free-electrons.com>
 <CAOccFZCnm3yrooc7uwiAphQz9SEzFtmMkUwCyv3z6EY_OknRSg@mail.gmail.com>
 <20150730170352.0331b2c4@free-electrons.com>
Message-ID: <20150730211916.GC3744@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-30 17:03 +0200, Thomas Petazzoni spake thusly:
> On Thu, 30 Jul 2015 16:56:34 +0200, No? Rubinstein wrote:
> > On Thu, Jul 30, 2015 at 4:50 PM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> > > Can you resubmit with the && thing ? It is not needed: make will
> > > abort automatically if genisoimage fails.
> > 
> > The issue is syntactic: ROOTFS_ISO9660_CMD is used in this line in common.mk:
> > 
> >     echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
> > 
> > Therefore it can not contain any newline. This would be fixed by using
> > the file function in GNU make
> > <https://www.gnu.org/software/make/manual/html_node/File-Function.html>
> > but it would not work with GNU make 3.81.
> 
> Hum then maybe in the end my _POST_GEN_HOOKS idea is better?

Yes, that would make it symetrical with the existing _PRE_GEN hooks.

No?, would you care to implement this post-gen hooks and resubmit using
that, please?

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
