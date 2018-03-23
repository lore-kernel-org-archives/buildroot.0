From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Mar 2018 18:22:08 +0100
Subject: [Buildroot] [PATCH 2/2] fs/squashfs: enable squashfs to
 generate a verity hashtable
In-Reply-To: <CAF3==itWkWN+u97nMs+RFxq_e6qiZPKxoutQsQ0DsDgexNfy+A@mail.gmail.com>
References: <1521752805-17690-1-git-send-email-ben.whitten@gmail.com>
 <1521752805-17690-2-git-send-email-ben.whitten@gmail.com>
 <20180322213410.GD4580@scaer> <87woy368rz.fsf@dell.be.48ers.dk>
 <CAF3==itWkWN+u97nMs+RFxq_e6qiZPKxoutQsQ0DsDgexNfy+A@mail.gmail.com>
Message-ID: <20180323172208.GA7215@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, All,

On 2018-03-23 09:32 +0000, Ben Whitten spake thusly:
> On Thu, 22 Mar 2018 at 22:32 Peter Korsgaard <peter@korsgaard.com> wrote:
> > >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >  > On 2018-03-22 21:06 +0000, Ben Whitten spake thusly:
> >  >> For those times that you want to verify that your readonly filesystem
> >  >> hasn't been tampered we can generate a dm-verity hash table.
> >  >> The root hash is enclosed in .table file and must be secured else where.
> >
> > Strange, I don't seem to have received the original patch?
> I think the mailing list ate it as I was not a subscriber at the time.
> Only the CC went to Yann.

Did you subscribe now? ;-)

> >  > My position is that this should be done in a post-image script.
> > I agree!
[--SNIP--]
> Thats fair enough, here is possibly not the right place for it.
> I guess its a question of how much should be put into post processing.
> Generating this after the image means that I'd need to roll ubinize manually
> per device instead of using the settings in KConfig, which seems a bit messy.

So, you meant that ubinize can use that .table output from verifysetup
generates?

> The other patch that was eaten decoupled ubi from ubifs to allow this.

Yeah, I still need to have a look at that patch. I already have a few
comments about it, but please, repost both to the list so that everyone
can see them and understand the replies...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
