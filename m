From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2016 00:19:28 +0100
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <56C8F126.1040903@mind.be>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <56B67620.1040700@gmail.com>
 <20160220183731.57f5122f@free-electrons.com>
 <20160220180803.GQ3418@free.fr> <56C8F126.1040903@mind.be>
Message-ID: <20160220231928.GR3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-02-21 00:05 +0100, Arnout Vandecappelle spake thusly:
> On 02/20/16 19:08, Yann E. MORIN wrote:
[--SNIP--]
> > Well, that's not how licensing works.
> > 
> > Individual files have their own licenses, and they retain those licenses
> > even when they are combined together. So, if you have two files under
> > two licenses, like so:
> >     file-1.c    MIT
> >     file-2.c    Apache-2.0
> 
>  Actually, I think it's not really the files that carry a license. It is how you
> got it. This shows in packages that are dual licensed (i.e., with an OR), where
> it is possible that you got it under only one of those licenses (e.g. because it
> was combined with another work that puts constraints on it).

Again, IANAL, TTYL, and so on...

However, if some "other work" puts constraints on the file, then that
file still retains its own license; the rights you had under that
license are just diminished by those "constraints" of the license for
that "other work".

>  And unfortunately, it is not very clear under which license you received the
> code when you got it through a combined work. You _could_ claim that because you
> received these files as part of the erlang-rebar package, you have only received
> file-1.c under the MIT license. However, you could also claim that the
> distributors of erlang-rebar never intended to change the license of file-1.c,
> so that that individual file can still be used under the MIT license. So:
> situation is not clear IMHO.

No, it's definitely not clear, as all licensing issues! :-)

Still, I think we should not take the responisibility to do such an
in-depth licensing analysis, and that we should dtride of the safe side
by just listing all those licenses that apply (see below).

> > If the two licenses are "compatible", then you are allowed to combine
> > the two files to produce a derived work. That derived work is then
> > governed by both licenses. In effect, the most stringent license will
> > dominate, but the other will still apply.
> > 
> > Let's take two hypotetical licenses:
> > 
> >   - the Hello License, which states: If you use that file, you must say
> >     Hello to the closest Human being.
> > 
> >   - the Tea-Now License, which states: If you use that file, you must
> >     drink a tea now.
> > 
> > Those two licenses are compatible (i.e. you can say Hello and drink a
> > tea), so you can combine them. Still, you have to do both, not either.
> > 
> > So yes, we need to specify *all* the licenses that govern files used to
> > generate the output.
> > 
> > Note that the licenses list in Buildroot is to be interpreted as:
> >     The combined work generated from this package is governed by those
> >     licenses.
> 
>  I don't think we can put that strong a claim, I think it is: the combined work
> generated from this package may be governed by those licenses.
> 
>  One example where the 'may' is important is when you configured out some file,
> and that was the only file under a particular license, then that license doesn't
> apply anymore to the combined work.

I see your point. But we usually try to make that license conditional in
this case, like dtc, ffmpeg, kmod and a few others. Not saying that we
always do so, but we tend to.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
