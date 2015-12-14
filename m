From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Dec 2015 22:49:30 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
In-Reply-To: <CAFGQKxe61V2J6WjQobptUS4RJucGmMXuWyAgLy+415CH4ZUT+A@mail.gmail.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
 <20151214210913.227563c9@free-electrons.com>
 <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
 <20151214214337.2933ea41@free-electrons.com>
 <20151214211045.GA4152@free.fr>
 <CAFGQKxe61V2J6WjQobptUS4RJucGmMXuWyAgLy+415CH4ZUT+A@mail.gmail.com>
Message-ID: <20151214214930.GB4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-12-14 21:31 +0000, Martin Bark spake thusly:
> On 14 December 2015 at 21:10, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2015-12-14 21:43 +0100, Thomas Petazzoni spake thusly:
> >> On Mon, 14 Dec 2015 20:24:30 +0000, Martin Bark wrote:
> >> > I'm not sure the answer to that.  What i can say is that all four are
> >> > getting maintained.  Also, according to https://github.com/nodejs/LTS
> >> > node.js 0.10.x will be maintained all the way until October 2016.
> >> >
> >> > I see two logical approaches for buildroot:
> >> >
> >> > 1) Support all four in buildroot because node.js support all four
> >> > 2) Only Support the 4.x and 5.x because they are the current LTS and
> >> > Stable releases (i.e. the ones on the front page of
> >> > https://nodejs.org)
> >> >
> >> > Personally I'd vote for 2) because it simplifies things.
> >> >
> >> > What are your thoughts?
> >>
> >> I'm fine with option (2) as well, but do we have other NodeJS users
> >> that would like to see 0.10.x and 0.12.x being kept?
> >>
> >> Is there any issue for users of 0.10.x/0.12.x to migrate to 4.2 or 5.2 ?
> >
> > We do have the various version of nodejs, because:
> >
> >   - 4.2.x needs gcc >= 4.8 and armv6+
> >   - 0.12.x needs armv6+
> >   - 0.10.x has not requirement
[--SNIP--]
> > So, I think we have a few options here:
> >
> >  1) keep all the three existing versions, add 5.2
> >  2) keep 0.10 and 0.12, replace 4.2 with 5.2
> >  3) keep 0.10, ditch 0.12, replace 4.2 with 5.2
> >  4) dith 0.10 and 0.12, replace 4.2 with 5.2
> >
> > I would lean toward either 2 or 3.
> >
> > 3 is IMHO the best solution: 5.2 is the best choice when all the
> > conditions are met; 0.10 is the fallback, maybe not the optimum in
> > case 0.12 would have fit, but since that's a fallback I don't think
> > it matters much...
> 
> Yes I like option 3) too.  This would clarify the situation so that
> buildroot supports the latest version of node.js only, except 0.10.x
> which is kept purely for armv5 support.  Then in the buildroot 2016.11
> release 0.10.x can be dropped too as it will no longer be maintained.

Most probably we'd keep it forever. If we were to ditch 0.10, we would
have no fallback. As long as it builds and still works fine, we should
just keep it.

One option would be to completely get rid of the selection choice, and
always build the best version for the curent system. I.e. for an armv5
we'd build 0.10, for gcc <4.8, we'd build 0.10. Otherwise, we'd build
5.2. Of course, we'd have to tell the user what version was being used.

Opinions?

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
