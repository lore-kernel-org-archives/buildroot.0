From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Aug 2013 08:39:04 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
	sub-menu
In-Reply-To: <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
 <520D5FE6.2090007@mind.be>
 <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
Message-ID: <201308160839.05082.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Friday 16 August 2013 08:30:43 Thomas De Schampheleire wrote:
> On Fri, Aug 16, 2013 at 1:10 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 15/08/13 22:28, Yann E. MORIN wrote:
> >>
> 
> >> diff --git a/arch/Config.in b/arch/Config.in
> >> index 0b5b218..640926a 100644
> >> --- a/arch/Config.in
> >> +++ b/arch/Config.in
> >> @@ -1,3 +1,5 @@
> >> +menu "Target options"
> >
> >
> >  I completely agree with the idea - especially in the xconfig, the big list
> > of architecture options is extremely annoying. However, the menu title is
> > not very clear. How about "Target architecture selection"? Or maybe
> >
> > Target CPU architecture
> >
> >   Target CPU architecture family
> >
> >   Target CPU architecture variant
> >
> 
> Well, I think the menu provides more than just the cpu architecture
> choice. It includes other things like ABI choice, binary format
> selection, and floating point strategy. The name 'target options' fits
> better for these options than anything with 'target cpu architecture'
> in it, but I'm open for other suggestions.

Ditto.

> While we're at reorganizing the top-level menu: I find the order of
> the menus odd.
[--SNIP--]
> I think Bootloaders and Kernel should come earlier in the list and
> reversed, and Host utilities should be after filesystem images.
> My proposal is thus:
> (Target options)
> Build options
> Toolchain
> System configuration
> Package selection for the target
> Kernel
> Bootloaders
> Filesystem images
> Host utilities
> Legacy config options
> 
> What is your opinion?

I would even put the kernel before the packages, and bootloaders before
kernel. Ie. I'd use the boot-time order of things:
    (Target options)
    Build options
    Toolchain
    System configuration
    Bootloaders
    Kernel
    Packages selection
    Filesystem images
    Host Utilities
    Legacy config options

Bizzarely enough, moving bootloaders before kernel seems odd... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
