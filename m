From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Sep 2013 20:15:12 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916195846.32e98c8a@skate>
References: <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr> <20130916195846.32e98c8a@skate>
Message-ID: <20130916181512.GD3293@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-09-16 19:58 +0200, Thomas Petazzoni spake thusly:
> On Mon, 16 Sep 2013 19:08:15 +0200, Yann E. MORIN wrote:
> > Now, let's try to make things clear:
> > 
> >   - on an embedded system, the probability that there is a GPL program
> >     is rather high (eg. busybox, the Linux kernel);
> > 
> >   - lets assume Buildroot is used to build those programs;
> > 
> >   - the GPL (as applied to _those_ programs, not Buildroot) mandates
> >     that the script to control compilation and installation of those
> >     programs be made available (section of GPLv2);
> 
> Whether Buildroot is part of such scripts or not remains a slightly
> open question. That the kernel makefiles and scripts, the Busybox
> makefiles and scripts should remain part of the kernel and Busybox
> sources is clear. That the tool that is used to orchestrate the overall
> building process is part of those "script to control compilation and
> installation" is not so clear-cut from my point of view.
> 
> At least so far, I don't think I've seen many companies using
> Buildroot, on products that include GPL components, providing the
> source code for Buildroot.

I never said you *had* to provide the Buildroot tree. I said that
providing it was *easier* than trying to separately provide build
instructions for each GPL program on the device.

> >   - so the easiest way to comply with those programs' GPL is to
> >     distribute the Buildroot tree that was used to build the target
> >     filesystem, since it does contain all required recipes (aka the
> >     scripts of section 3 of the GPLv2)
> 
> Right, but it is not necessarily easy to separate within Buildroot the
> thing that you are ready to distribute (package recipes of open-source
> programs) from the package recipes of proprietary programs, your root
> filesystem overlay and so on.

But your BR2_EXTERNAL will make this really trivial:
  - do all FLOSS stuff in Buildroot tree
  - do all proprietary stuff in BR2_EXTERNAL
  - provide the Buidlroot tree to be compliant
  - keep BR2_EXTERNAL private

Et voil?! :-)

> 
> What I'm questioning is really the case where a company makes an
> embedded product, and has used Buildroot to generate a rootfs that
> includes GPL programs, is this company required to distribute Buildroot.

Short answer: no.
Long answer: no, but it is an easy path.

> > I lean toward an explanation in the manual (with proper disclaimer
> > that entice the user to seek legal counsel).
> 
> Fair enough. Care to submit a patch? :-)

I sure can help write and review such a change.

We just have to settle on what we want to put in there: BR2_EXTERNAL:
derived work or not? ;-)

But not before next week, I have to finish my presentations for KR`13
first! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
