From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Jan 2016 20:40:59 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <878u3l2z9f.fsf@dell.be.48ers.dk>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 <87lh7l3asr.fsf@dell.be.48ers.dk>
 <CAAXf6LUqCv04ZkCH5fKwq2_0w9hBYFYXM_Bf5t1yawG1D8yeTQ@mail.gmail.com>
 <20160119182947.GB3360@free.fr> <878u3l2z9f.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVSwy5ozhJ4cYrSDF5gXBNEkjEs9ej_L2TkLa5a4avV8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jan 19, 2016 19:35, "Peter Korsgaard" <peter@korsgaard.com> wrote:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
> >> I was not aware that glibc already depends on skeleton. Then indeed
>  >> ThomasP's reasoning is correct and the patch should be simplified. I
>  >> will investigate that further and resubmit.
>
>  > Skeleton is currently not a dependency of host-gcc-initial, so you'd
>  > have to make it so.
>
> Ahh yes, we only add it for target packages.

I did 'make clean toolchain' on x86-64 qemu defconfig but with glibc, and
at the end I noticed that skeleton was built and the symlinks were
correctly created.
So which package had the skeleton dependency? (Don't have a buildroot near
me ATM)

/Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160119/0c0999ef/attachment.html>
