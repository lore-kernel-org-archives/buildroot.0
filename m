From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Sep 2013 22:51:47 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <87d2o8h4p5.fsf@dell.be.48ers.dk>
References: <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
 <20130916172444.2573614e@skate> <87d2o8h4p5.fsf@dell.be.48ers.dk>
Message-ID: <20130916205147.GH3293@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-09-16 22:49 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Dear Peter Korsgaard,
>  Thomas> On Mon, 16 Sep 2013 09:11:49 +0200, Peter Korsgaard wrote:
> 
>  >> So a bunch of non-patch files. I guess our best option is to degrade the
>  >> "Unsupported format" check to a warning again?
> 
>  Thomas> Another way of seeing that is that using:
> 
>  Thomas> <pkg>_PATCH = some-debian-tarball
> 
>  Thomas> is not a good idea, and we should have a better way of handling this,
>  Thomas> no?
> 
> Arguably yes, but this used to work so some people might be relying on
> it - So I change it back to only warn about these files.
> 
> Nevertheless, it would be good if we could come up with a better way of
> handling these Debian patches.

What about extracting the tarballs and only applying patches if the
filename contains (or end up with) '.patch' ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
