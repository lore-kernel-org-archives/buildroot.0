From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 00:56:01 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
In-Reply-To: <50E3DA74.6080303@mind.be>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <CAJJ6jxuKWz3-que3MYwBSrLh_F2-L_XhMvE-+oUog+kL_2mobA@mail.gmail.com>
 <50E3DA74.6080303@mind.be>
Message-ID: <201301030056.01956.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Steve, All,

On Wednesday 02 January 2013 Arnout Vandecappelle wrote:
> On 12/25/12 04:52, Steve Calfee wrote:
> > On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
[--SNIP--]
> >> For now, buildroot can build a single filesystem image. This is not useable
> >> for these systems. The only possibility as of today is to configure BR to
> >> generate a tarball, and have a custom script that does the required split up
> >> of the different components.
> 
>   That's not really true, is it? Buildroot generates the ext2fs and the 
> boot loader and kernel images, you only have to create the partitions and 
> the fatfs and pull everything together into a single image.

So, you said the same as me: Buildroot (without external tools) can
not generate more than one *filesystem* image (ext2, tar, whatever).

Then, _after_ Buildroot finishes, you can do whatever you want to build
additional images. But that's not Buildroot doing it.

> >> 0) Keep as-is
> >>
> >> Buildroot can not handle all possibilities, we can't even *think* about
> >> all such possibilities. This is the easiest for buildroot, and pushes the
> >> complexity down to the users.
> >>
> > This is my favorite. There are no known situations that cannot be
> > handled by buildroot. Quit adding to the makefile. It adds
> > complexities, and only fixes the one, current users complaint. Keep
> > mechanism separate from policy. Buildroot should be a simple
> > consistent way to build a root file system. People who have weird
> > build/target desires can do that in an external script.
> 
> 
>   +1
> 
>   On the other hand, if an external package would exist that implements 
> the fully monty (your option 2), then I would have no problem with 
> integrating that package and running it automatically post-build.

The problem doing it after Buildroot finishes, is that you loose all the
_PERMISSIONS and _DEVICES variables (unless you also fakeroot the
whole process).

Well, I'm a bit out of time now, so don't hold your breath...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
