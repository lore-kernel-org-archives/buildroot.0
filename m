From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Dec 2018 02:13:35 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-security: new
 package
In-Reply-To: <20181207095906.7d21323e@windsurf>
References: <1544139188-28022-1-git-send-email-james.hilliard1@gmail.com>
 <CAGm1_ktEWoZq4HLuf2jZVoLFE3JmVwKVb=_QLoX7DpQ3-YYB-A@mail.gmail.com>
 <CADvTj4p0RkurDDaBQ5J2HFTshr6zZ7zMyHYC43R34BTSfqO_TA@mail.gmail.com>
 <20181207094619.0f4bf1cd@windsurf>
 <CADvTj4qArP_W_5qb=RyYTnhRe0iyLXhR=vcAajGSx+aHUaarLQ@mail.gmail.com>
 <20181207095906.7d21323e@windsurf>
Message-ID: <CADvTj4oGSv-kXx9ECQSCKsKCm4P1AthUB2awjKOP=KmOA_7P4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 1:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Fri, 7 Dec 2018 01:48:00 -0700, James Hilliard wrote:
>
> > Ok, will try and do that in the future. I was keeping them in separate
> > branches so that they are easier to amend.
>
> You can keep them in the same branch, and still amend them very easily.
> The magic thing is "interactive rebase".
>
> Let's explain quickly how it works:
>
> $ git checkout -b foo # create a new branch to work
> add package foo1
> $ git commit -as -m "foo1: new package"
> add package foo2
> $ git commit -as -m "foo2: new package"
> add package foo3
> $ git commit -as -m "foo3: new package"
>
> No, you want to do some changes. You can do them right there in your
> code base. Let's say you fixed one thing in package foo1 and one thing
> in package foo2. Then you do:
>
> $ git add package/foo1/
> $ git commit -m "merge this with foo1"
> $ git add package/foo2/
> $ git commit -m "merge this with foo2"
>
> And now, the magic:
>
> $ git rebase -i HEAD~5
>
> It opens up a text editor. You move the line "merge this with foo1"
> right after the "foo1: new package" line, and change the "pick" word by
> "fixup". You do the same with "merge this with foo2", and exit the text
> editor. And voila.
>
> Additional tips:
>
>  - With proper commit titles, you can actually have git rebase -i
>    automatically do the fixups.
>
>  - You can also directly edit commits by changing the "pick" by an
>    "edit".
>
> I encourage you to read about "interactive rebase" in general. It's
> going to change your life of patch preparation :-)
Yeah, I've used it before, I'm just really slow at it since I don't
use it day to day for the most part.
>
> Another unrelated tip: please don't top post. Always write your replies
> *below* the text you're replying to. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
