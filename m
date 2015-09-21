From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 21 Sep 2015 10:56:05 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
References: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
Message-ID: <CA+BsyQ72v3_sc7Luec6n=Ap-WWxd6JNg+X_Aha3UL4OJqZvTcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 September 2015 at 19:05, Brendan Heading <brendanheading@gmail.com> wrote:
> Fixes:
> http://autobuild.buildroot.net/results/123/123a5b3f72ba8c1a4aa1cea5b7b846a04fd4e923/
> http://autobuild.buildroot.net/results/38c/38cfa4e7249a8770b06dbd392acba79303d3f9bc/
>
> .. and others.
>
> Improve GCC's checking of stack smashing support, adding a specific case
> statement for uclibc, and removing the check done after checking the
> glibc version.
>
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> Patch V1 - this initial version only fixes 4.7.4 - wanted to check that
> we are heading the right way before I fix all the other versions.
>
> Note that I manually modified configure, rather than regenerating it from
> configure.ac.
>
> Original plan was to reverse the order of the existing __GLIBC_MINOR__ and
> uclibc check. However, the uclibc check falls through if it does not
> detect uclibc, so I figure it better to add the separate case statement.

Hi guys,

Just a quick ping to draw your attention to the above patch. Before I
add the fix to all the other supported versions of GCC I wanted to
check that you are happy with the way I'm solving the problem in
4.7.4.

Brendan
