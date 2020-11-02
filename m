From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Nov 2020 13:11:52 -0600
Subject: [Buildroot] [2020.02.x] package/busybox: fix build with glibc
 2.31
In-Reply-To: <87blgfbms6.fsf@dell.be.48ers.dk>
References: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
 <CANQCQpZ5xzOATqBxQrJRhR159LuwFA37eYuK2keTiS=fNzutKQ@mail.gmail.com>
 <87blgfbms6.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpbraG06CzskX=9S+8sSPN-5VGoLCDBQco2fGy-dQz=mgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,


On Mon, Nov 2, 2020 at 1:09 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Peter / Thomas / Yann / Arnout,
>  > On Thu, Oct 29, 2020 at 9:04 AM Matthew Weber
>  > <matthew.weber@rockwellcollins.com> wrote:
>  >>
>  >> Peter,
>  >>
>
>  > [snip]
>
>  >> Note: I'll have additional individual patches coming for openssh and
>  >> strace as those were fixed for a similar issue but through version
>  >> bumps on master.  Is there some backstory (beyond the patchwork
>  >> submissions for master) on other attempts to bring glibc 2.31 support
>  >> to LTS?
>  >>
>
>  > Wondering about your thoughts on adding GLIBC 2.3.1 support to the
>  > 2020.02 LTS.  Technically, we believe that the patches that need
>  > cherry picked over from master are the following.  What do you guys
>  > think?  Should we pull out the individual commits within those
>  > projects(more patches in Buildroot) or are these (strace/openssh)
>  > bumps OK?
>
> But what is the reason for wanting to support glibc 2.31 in LTS? Is
> there anything important added in 2.31 or do you have an external glibc
> 2.31 based toolchain you really have to use?
>

Yeah, sorry I snipped it out from my original email. Here's the use case

The known [1,2] issue was found when using a newer external toolchain
with the following configuration and the 2020.02.7 tag.
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2020.08-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y


Ref:
[1] http://lists.busybox.net/pipermail/buildroot/2020-February/272657.html
[2] https://patchwork.ozlabs.org/project/buildroot/list/?series=165949&archive=both&state=*
