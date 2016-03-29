From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Mar 2016 16:16:15 +0200
Subject: [Buildroot] couple autobuilder questions
In-Reply-To: <20160329160513.64592050@free-electrons.com>
References: <CAFt09wMWfXRfi-KYQUXDJL9nnYu=w3cut_XeaoRQiv3_6+uzxw@mail.gmail.com>
 <20160329160513.64592050@free-electrons.com>
Message-ID: <CAAXf6LUB_up0_OOLSC+K0dTKZ7B+7TT6g4UvOVOPJw2TxTrgJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 29, 2016 at 4:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
> I do remember handling this situation though. I did a bit of research,
> and here is what happens:
>
>  * The detection of the failure reason for the autobuild.buildroot.org
>    website is done on the Web server side, not by the autobuild-run
>    script. And the PHP logic was adjusted to take into account the
>    umask handling. See
>    https://git.busybox.net/buildroot-test/commit/?id=e82328cf02a1f0aea90c7c243e8a48dbdb6e53ab.
>
>  * The failure reason is also detected by the autobuild-run script
>    itself, but for a completely different purpose: to be able to
>    provide in build-end.log the complete build of the failing package
>    rather than just the last 500 lines. Here, the regexp is indeed
>    wrong, and doesn't account for the make[1] case. The consequence is
>    that if the autobuilder instance is running with a umask different
>    than 0022, then you will never get a full build-end.log, but just
>    the last 500 lines of the build log. I'm Cc'ing Thomas DS on this,
>    since he wrote this code.

Yes, at the time I wrote this, there was no such umask handling yet. I
based myself on the existing logic that was used in the result page.

I think there is no issue in updating the regexp in autobuild-run too,
to line up with the changes done in the mentioned commit. Patches
welcome! :)

/Thomas
