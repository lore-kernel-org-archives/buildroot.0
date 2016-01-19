From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Jan 2016 17:01:21 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <87lh7l3asr.fsf@dell.be.48ers.dk>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 <87lh7l3asr.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUqCv04ZkCH5fKwq2_0w9hBYFYXM_Bf5t1yawG1D8yeTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 19, 2016 at 3:26 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>>> In earlier versions of the patch, I stated that the symlink creation
>  >> needs to happen before gcc-initial is built. This is the reason we are
>  >> hooking into gcc-initial. This was also effectively the case before
>  >> the skeleton package was introduced.
>
>  > Small correction, the statement is:
>  > +# The creation of lib32/lib64 symlinks into target and staging directories
>  > +# needs to be done before the C library is installed.
>
> And that's already the case, right? E.G. all packages depend on
> skeleton, including the glibc/uclibc/musl packages.

Ok, so that is the missing part of the puzzle.

On 2015.05, where skeleton was not yet a package, and so the situation
upon which the original patch was based, the symlinks were made in the
.root target. To allow for this new symlink behavior, it had to be
moved, but it had to be before the C library. The toolchain target was
too late, gcc-initial was voted the 'best' place at the time.

I was not aware that glibc already depends on skeleton. Then indeed
ThomasP's reasoning is correct and the patch should be simplified. I
will investigate that further and resubmit.

Thanks for the feedback,
Thomas
