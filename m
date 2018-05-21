From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 21 May 2018 10:05:12 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-25
In-Reply-To: <87zi0unjn5.fsf@dell.be.48ers.dk>
References: <20180426060013.EAB262079F@mail.bootlin.com>
 <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
 <20180430091509.3a9cdff2@windsurf>
 <cab2ab99-f53c-448f-7cdb-77456a189664@smile.fr>
 <56ce1d9d-7b2a-1cda-52e3-a01094e6713a@gmail.com>
 <CANQCQpZzeALsKx7GFMUD_jSSn+=YS9KZBoOeuf7dUR8Um1pJDQ@mail.gmail.com>
 <87zi0unjn5.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpaJZaMHUjskdyeb4tbWMtkghBtctgnm696bVsct1m=vkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, May 20, 2018 at 3:42 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
> Hi,
>
>  >> I'm waiting for the backport in the gcc-7-branch.
>  >>
>  >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
>
>  > I backed up and applied this bug's patch to 6.x as a last attempt to
>  > resolve what I was observing with libnss (the build was successful).
>  > I posted more detail in the bug report Romain referenced.  There
>  > wasn't an actual commit to track down on this issue, it feels like it
>  > was a backport introducing a design flaw and this patch just prevents
>  > a infinite runaway of the optimization step.
>
>  > It does look like they have now decided to not backport this to 7.x,
>  > so unsure what you guys think about applying it to buildroot.
>
> Hmm, I don't really feel confident adding patches that upstream find too
> scary. What is the alternative? Does this only affect libnss on
> Microblaze?
>

Correct, only libnss on Microblaze.  Romain had suggested adding a GCC
bug for it instead.  (ie  like BR2_TOOLCHAIN_HAS_GCC_BUG_64735)

Matt
