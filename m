From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Aug 2015 21:21:57 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
 is set
In-Reply-To: <20150819210830.6c52ebed@free-electrons.com>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr>
 <20150819210830.6c52ebed@free-electrons.com>
Message-ID: <20150819192157.GC13372@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-19 21:08 +0200, Thomas Petazzoni spake thusly:
> On Wed, 19 Aug 2015 21:05:34 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > Now, there are two questions:
> > 
> >   - will we need to _check_ for any arbitrary kernel option to be set,
> >     and offer packages a simple mean to do so?
> > 
> >   - will we need to _force_ (on or off) any other kernel option, and
> >     offer packages a simple mean to do so?
> 
> We already do your second item.

No, we are not allowing any random package to set kernel options.

We do have infra for packages to tweak their *own* options, not those
of other packages (and history has proved it was not doable, I should
know, I tried and failed miserably with the lzo stuff).

> In general, I'd like to keep the handling of the kernel configuration
> to be as minimal as possible. Otherwise, we'll quickly enter a
> situation where we need to enable different kernel options depending on
> the kernel version. It can quickly become a real nightmare. Buildroot
> has always been about the user knowing what (s)he is doing, including
> in terms of making sure that the kernel configuration matches what is
> done in userspace.

I do fully agree with you on this position. Tweaking the kernel options
is a real hornet's nest...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
