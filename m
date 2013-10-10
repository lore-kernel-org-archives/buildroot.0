From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:53:36 +0200
Subject: [Buildroot] legal-info: multiple licenses separator
In-Reply-To: <52564CCF.4000609@mind.be>
References: <CAAXf6LXusXB0QSG_EHOv8VpcEY+mpuUeW-pvnXtWNUrFfb_0Kg@mail.gmail.com>
 <52555A15.3030504@lucaceresoli.net>
 <CAAXf6LWnzyTKyt-b7qUxY=bJOYyaDkVMN60K9-eqRV6MC7B72g@mail.gmail.com>
 <52564CCF.4000609@mind.be>
Message-ID: <20131010095336.3ae384d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 10 Oct 2013 08:44:31 +0200, Arnout Vandecappelle wrote:

> > package/lttng-libust/lttng-libust.mk
> > -LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
> > +LTTNG_LIBUST_LICENSE = LGPLv2.1, GPLv2 (lttng-gen-tp, ust-ctl)
> 
>   I thought you wanted to avoid commas? :-)  Anyway, I disagree with your 
> cut argument: cut -d \" -f 6 should do the trick for you.

No, I don't think Thomas wanted to avoid commas, on the contrary. He
wanted to *allow* commas in the <pkg>_LICENSE variable, and to do this,
was proposing to change the CSV separator from comma to something else.

>   However, perhaps we should take a step back on the legal info ofr a 
> minute. Considering the number of corrections we have to make to it, and 
> taking into account that we never check if it's still valid after version 
> bumps, I wonder how useful our license manifest really is. In the end, 
> your legal department will still need to check the correctness of the 
> license information... Collecting the sources and the LICENSE_FILES _is_ 
> really useful, but the specified licenses are only indicative. So I 
> wouldn't spend too much time on formalizing it.

I do understand these arguments, but I continue to believe that the
license information is useful. If your legal department checks this,
and reports to you that there is a mistake, then you will send a patch
to Buildroot. If everybody does that, the licensing informations get
more and more correct and accurate. Pretty much like bugs in software
tend to progressively disappear as more and more people use the
software.

As an example, the berkeleydb bump from version 5 to 6 was done without
the appropriate license information change. But not later than one or
two days later, somebody else noticed that and the situation is in the
process of being fixed.

Also, remember that not all companies have legal departments. Many
small to medium size businesses do embedded Linux products. And for
them, having a license manifest that is 98% accurate is a lot better
than having no license manifest at all.

There may be some inaccuracies in the license informations that we
have, but generally, at least the information of whether the component
is under a non-copyleft or a copyleft license is correct, and this is
what matters most in my opinion to achieve basic license compliance.

>   Also, if we're going to formalize it more, perhaps we should consider 
> moving to a real formal specification, e.g. spdx. That may make if 
> possible in the future that a tool can at least verify the license 
> information we provide.

I do agree that having a look at SPDX is interesting. They define a
formal list of licenses (https://spdx.org/licenses/). However, I don't
know how/if they formalized how to specify which license applies to
which specific component inside a given package.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
