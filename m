From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 12 Feb 2020 22:44:10 +0100
Subject: [Buildroot] udisks situation
In-Reply-To: <87sgjffq29.fsf@dell.be.48ers.dk>
References: <4669dcc6-5080-22fc-702e-74f145a1a936@benettiengineering.com>
 <87sgjffq29.fsf@dell.be.48ers.dk>
Message-ID: <dc8a077b-9d32-6d42-41a1-522c51385dce@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 2/12/20 10:34 PM, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Hi All,
>   > during bump of udisks package from version 1.0.5(the last known 1.x
>   > version) to version 2.8.4 lot of heavy dependencies have been added:
>   > - gobject-introspection(upcoming from Adam Duskett[1])
>   > - libblockdev(upcoming from me) => libbytesize, volume_key(upcoming from me)
>   > - parted
>   > - polkit
>   > - sg3-utils
>   > - libxslt
>   > then it needs:
>   > - toolchain w/ glibc
>   > - nls enabled
> 
>   > Adam Duskett, while testing(and fixing) my udisks branch[2] against
>   > its gobject-introspection patchset[1], found out that currently Fedora
>   > provides both udisks[3] and udisks2[4]. udisks(1) is considered
>   > obsolete but they still offer it as a package.
> 
>   > Upstream didn't create a dedicated 1.x branch, but considering the
>   > amount of dependencies for version 2.x, maybe we could imitate Fedora
>   > and keep package "udisks" as it is(since its development stopped on
>   > version 1.0.5), and package "udisks2" that will follow upstream.
> 
>   > The meaning to keep both packages is to have different memory
>   > footprints, but most of all retro-fitting. udisks2 provides
>   > "udisksctrl" tool, while udisks(1) provides "udisks" tool that are not
>   > compatible.
> 
>   > I have already discussed about this in IRC with Thomas Petazzoni and
>   > we ended up to keep udisks2 to follow upstream, but udisks(1) seems to
>   > be still used.
> 
> I don't feel strongly about either, but long term we have to follow
> upstream.
> 
> Out of interest, why this focus on udisks? We don't have any packages
> with reverse dependencies to udisks in Buildroot?

Everything started out when I've followed this:
https://elinux.org/Buildroot#Important
Following that I've already bumped at and nfs-utils is pending after 
upstreaming all patches.
I've update it during last 6 months, but only few days ago I've realized 
that it's not followed so much by chatting in IRC :-), this is the 
reason of udisks interest(it was listed there).
Basically I was trying to find something for Buildroot.

-- 
Giulio Benetti
Benetti Engineering sas
