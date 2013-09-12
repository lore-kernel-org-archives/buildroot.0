From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Sep 2013 00:12:56 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <52323A54.7020808@mind.be>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
Message-ID: <20130912221256.GE3362@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-09-13 00:04 +0200, Arnout Vandecappelle spake thusly:
> On 12/09/13 20:33, Thomas Petazzoni wrote:
> >Dear ANDY KENNEDY,
> >
> >On Thu, 12 Sep 2013 18:25:40 +0000, ANDY KENNEDY wrote:
> >
> >>This sounds much like the way Linux does things for the IP related
> >>drivers.  Is that the intent we are going for (personally, I think this
> >>is a GREAT idea, as it allows companies to have IP related widgets in
> >>BuildRoot without the fear of being REQUIRED to push back their secret
> >>sauce)?
> >>
> >>If that is what you intend, you have my vote!
> >
> >I am not sure what you mean by "IP related drivers". Do you mean
> >proprietary drivers?
> >
> >It is true that the BR2_EXTERNAL thing raises a licensing question:
> >should the BR2_EXTERNAL contents also be released under GPLv2, like the
> >rest of Buildroot? Do we really want the root filesystem overlays and
> >other highly project-specific contents be released under GPLv2 ?
> 
>  You can never be sure unless a judge makes a ruling, 

Agreed: only a judge can decide.

So: IANAL, and so on...

> but the GPL is pretty
> clear on this:
> 
> "If identifiable sections of that work are not derived from the Program,
> and can be reasonably considered independent and separate works in
> themselves, then this License, and its terms, do not apply to those
> sections when you distribute them as separate works."
> 
>  i.e. you can distribute the source of buildroot itself separately from your
> external directory.

Yes, but I believe BR2_EXTERNAL *is* a derived work of Buildroot, so as
such should be licensed under a license compatible with Buildroot's.

>  As long as your external stuff merely aggregates with the GPL'd stuff under
> buildroot, there shouldn't be an issue.

But that's not aggregation in my opinion, since it does leverage all or
parts of the Buildroot infrastrucutre, and was clearly written with this
intent, and as such can not be considered mere aggregation.

Of course, all this only applies _if and when_ BR2_EXTERNAL gets
distributed to a third party.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
