From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 18 Oct 2011 11:22:57 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111017184718.71afc290@skate>
References: <20111017184718.71afc290@skate>
Message-ID: <CAAXf6LUbtqSCrF=yD33TiGkT7qLak6eDN76D+XUTX0z7szSqNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Oct 17, 2011 at 6:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> At ELCE, I will be talking about "Using Buildroot for real projects".
> You can see my talk summary at
> https://events.linuxfoundation.org/events/embedded-linux-conference-europe/petazzoni.
>
> The current (unfinished) status of my slides is visible at:
> ?http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
>
> The goal of the talk is to give some recommendations and best practices
> on how to use Buildroot. As I'm sure I forgot a lot of things in my
> slides above, I'd like to know what you, Buildroot developers/users,
> would have to say on the topic, so that I can improve the contents of
> this presentation.


First of all, I think it is a very interesting presentation. It should
definitely become part of the official buildroot documentation, so
that companies starting with buildroot get a better feeling about the
best practices.

Some typos and comments, in addition to the previous replies:

p2 s/intagration/integration/
p3 s/Example of systems/Examples of systems/
p3 s/Toolchain recommandations/Toolchain recommendations/
p7 s/in a .config files/in a .config file/
p7 s/starts by/starts with/
p8 s/What does it generates/What does it generate/
p11 s/CodeSoucery/CodeSourcery/
p15 s/recommandation/recommendation/
p16 s/Kernel and bootloaders changes/Kernel and bootloader changes/
p16 s/separatly/separately/
p16 close parentheses after BR2_LINUX_KERNEL_PATCH



p 11: "Buildroot builds a toolchain. This is limited to uClibc based
toolchains, and needs to build rebuilt completely at every
Buildroot rebuild."
I think this is confusing: to me it gives the impression that the
toolchain is rebuilt at every invocation of 'make'. Maybe adding the
word 'complete' as with crosstool-ng makes it more clear.

p 14: "Generate a custom toolchain, and store it pre-built next to the
Buildroot directory, or in some internal HTTP server"
It could be anywhere on the filesystem, plus doesn't buildroot support
FTP either? Moreover, patches are coming to add scp support as well.
My point is that mentioning 'http' explicitly is maybe too
restrictive.

p27: It's a pity that the dependencies don't fit completely in the
box. Maybe use MY_APP instead of MY_APPLICATION or something?

p28: "storage in configs/": I think it would be better to explicitly
mention that the file 'defconfig' should be stored in configs/

p30: Future: would you consider mentioning that support for Mercurial
repositories and 'scp' downloads for LAN-based locations is in queue?


As I side note : I read that you use /rootfs-additions/ to add
additional stuff in the root filesystem. I'm doing exactly the same
thing (called target_skeleton_extras). I feel this may be a good thing
to officialize: let the user specify an overlay to the target
skeleton. What do you think? (we may want to discuss this in a
separate topic)


Good luck with the presentation!
Thomas
