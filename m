From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 16 Mar 2012 14:39:13 +0100
Subject: [Buildroot] [PATCH 4/5] Microblaze: build kernel with device
	tree
In-Reply-To: <4F623B98.1050701@relinux.de>
References: <4F5CD7C9.40505@relinux.de> <20120312231055.5ba3a3be@skate>
 <201203140025.24202.arnout@mind.be>
 <CAM+bi4s-yf0Jb1+c17Uee2iDkD995ZGMnNe3JfXxEb9fcMbiKQ@mail.gmail.com>
 <4F623B98.1050701@relinux.de>
Message-ID: <CAM+bi4sQ+nkba+HMmhJJa3aE0uLpf8HD3FdOdRYVoei4w1cLPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again

2012/3/15 Stephan Hoffmann <sho@relinux.de>

>  So, what should be the next step?
>
> I can put the patches that I have (the one fixing the toolchain download
> got lost somewhere) together, rebase them to the current HEAD and resend
> them on the weekend. I already squashed the three patches concerning
> toolchain download into one (but that removed Alvaro's entry as Author,
> which I don't like) and renamed the board directory to lower case. I can
> also add useful help texts for the architecture selection, but maybe Alvaro
> wants to do this himself.


Ok, I'm sending right now a set of three patches rebased to HEAD:
* DOWNLOAD: change $1=DIRECTORY_URL, $2=FILE_NAME to $1=FULL_FILE_URL,
$2=FILE_NAME
This one is needed to be applied before the third one, since this patch
allows downloading of files from awkward paths (such as the one from
Xilinx' git).

This patch, specifically has really nothing to do with Microblaze support
in itself. I think this can really be applied even if the other patches
aren't applied. This is in itself an improvement over existing code.


* Microblaze: added architecture support for both big endian and low endian
This one simply adds microblaze architecture with a little bit more
descriptive names. I think they are good in the sense that someone who is
developing for Microblaze will know for sure if it's using the AXI
interface or not.

* Microblaze: added external toolchain from Xilinx
Simply does what it says. This needs the first patch of the set to work.


2012/3/14 Arnout Vandecappelle <arnout@mind.be>

>  If I understand correctly, for microblaze, you *have* to use a
> simpleImage, which is a uImage with a DTB subimage.  In other words,
> unless we have some kind of DTS support in buildroot, we can't support
> microblaze.
>
>  Since nobody seems to be stepping up to add generic DTS support, that
> means microblaze is blocked.  That, I think, is stupid.  If we have
> working patches for microblaze now, why not accept them?  We can
> always add DTS support later and refactor the microblaze-specific stuff
> away.  In fact, this microblaze-specific stuff makes it easier to add
> generic DTS support, because you already get a defconfig that uses it
> and that you can use for testing.
>

I mostly agree with you. As I said, I this patches are good enough and
consistent with themselves. They allow to build a root filesystem able to
run on Microblaze. Since there is a high variety of boot methods and
boards, I think this can be applied regardless of future patches.

I do not think we should wait for a generic DTS support to accept this
patches nor this one from Stephan, which I think could also be applied.
*Stephan: Microblaze: added defconfig for Avnet S6LX9 Microboard

While we work on the DTS support, we have the temporal patch also from
Stephan
* Stephan: Microblaze: build kernel with device tree

We can work from this patch to get the generic DTS support. Maybe we should
talk a little about how we want to get it done and unlock this wanted
feature.

Kind regards,

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120316/8c77c60e/attachment.html>
