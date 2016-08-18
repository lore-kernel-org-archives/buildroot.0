From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 11:33:44 +0200
Subject: [Buildroot] [PATCH v2] support/download/git: Prioritize remote
 archive
In-Reply-To: <CAJsd3zJ_=1YhkD-LWfenYAnzG+4KmqsJ5f-wZFMCUKRbarPhjw@mail.gmail.com>
References: <1471469135-19009-1-git-send-email-kamath.ben@gmail.com>
 <20160817215301.GJ5778@free.fr>
 <CAJsd3z+5vOYFO=BAa1HQNd_=nfM1UPrmQmBxZmSgGzRy318_Ew@mail.gmail.com>
 <20160818091050.GA5930@free.fr>
 <CAJsd3zJ_=1YhkD-LWfenYAnzG+4KmqsJ5f-wZFMCUKRbarPhjw@mail.gmail.com>
Message-ID: <20160818093344.GB5930@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benjamin, All,

On 2016-08-18 02:26 -0700, Benjamin Kamath spake thusly:
> On Thu, Aug 18, 2016 at 2:10 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Benjamin, All,
> >
> > On 2016-08-17 15:17 -0700, Benjamin Kamath spake thusly:
> >> On Wed, Aug 17, 2016 at 2:53 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> > Benjmin, All,
> >> >
> >> > On 2016-08-17 14:25 -0700, Benjamin Kamath spake thusly:
> >> >> From: Benjamin Kamath <bkamath@spaceflight.com>
> >> >>
> >> >> Attempt to do a remote archive since it shortcuts us past a few steps when
> >> >> available. Additionally. if the git server has uploadArchive.allowUnreachable
> >> >> set to true, then this method can also work on arbitrary sha1s, offering a huge
> >> >> speed advantage over a full clone.
> >> >
> >> > Do you know of a publicly-accessible server that allows remote archives?
> >> >
> >> > I've tried with a github-hosted package, but githib won;t allow remote
> >> > archives, it seems...
> >> I just tried quite a few and it doesn't seem to be frequently
> >> supported. gitlab-ce does seem to have it enabled by default:
> >>
> >> git at gitlab.com:gitlab-org/gitlab-ce.git
> >
> > OK, it does work, as long as one uses the ssh protocol. It does not work
> > via http:// or git://
> >
> OK. I had not noticed that before, and as such that makes this patch
> much less useful.
> 
> > Which means we have no package in Buildroot that can use this.
> >
> > Do you have a need for that for an internal package?
> Yes, but we can create a local patch for it. On dev-branches of our
> project we frequently have internal packages that point directly at
> sha1s. I mistakenly thought more servers would support remote archive.
> I suppose we should reject this patch.

I'm OK with adding this, as long as it does not break existing
behaviour. From my little tests, it shows that it works.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
