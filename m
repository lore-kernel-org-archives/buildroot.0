From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 10 Dec 2013 15:36:11 +0100
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
In-Reply-To: <874n6g6d0r.fsf@dell.be.48ers.dk>
References: <1675197757.16219192.1386680505536.JavaMail.root@openwide.fr>
 <874n6g6d0r.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LU_ia5PzN1MxVt9snUOcF5q983gR5VLy0ZDR8+qVPW9cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2013 at 2:39 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Jeremy" == Jeremy Rosen <jeremy.rosen@openwide.fr> writes:
>
> Hi,
>
>  > two remarks
>
>  > 1) the usual problem with that idea is that if the kernel is externally
>  > built, you can't do that (you don't even know if/where the config is)
>
> But that's not a problem for ktap, as it can only be used with an
> internally built kernel as is.
>
>
>  > 2) I'd rather have it works similar to other dependancies, i.e having
>  > the option removed and a comment telling me what I need to enable to
>  > have ktap available.
>
> That's not how we handle the other settings like devtmpfs, cgroups,
> EABI, initramfs, .. The kernel has LOTS of options, I don't want to see
> Buildroot configuration options for all of them.
>
>
>  > I recently had a similar problem with udev needing inotify, so the
>  > problem of the plumbing layer relying on some specific kernel feature
>  > is probably a more generic problem... maybe a config option telling
>  > kconfig where the kernel is ? That would be tricky with the way
>  > kconfig works, but that would be nice...
>
> Basically the strategy is:
>
> Do the right thing automatically if BR builds the kernel, and otherwise
> the user is on his own (we'll normally document the requirements in the
> help text, but there's no logic to detect it)
>


Slightly related to this topic is the inconsistency in the Config.in
comments about needing a kernel. Same say:
'foo needs a Linux kernel to be built'
while others say
'foo needs a Linux kernel'

The first seems to emphasize that we require a Linux kernel to be
built in buildroot, while the second one leaves it in the middle. For
packages that actually build kernel modules, like ktap, we really need
the kernel inside buildroot, right? Are there any packages that depend
on BR2_LINUX_KERNEL that do _not_ require an in-buildroot kernel?

Thanks,
Thomas
