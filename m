From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 26 Mar 2019 12:11:58 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-23
In-Reply-To: <CAMo8BfL+BLdP8q1r6HHbfHy-=DY+EksjodW26t1A2+7O9eJMHg@mail.gmail.com>
References: <20190324070053.10948878B8@hemlock.osuosl.org>
 <CAMo8BfL-nXFNUMCgQ2Ffyakjt_0tpAexexv7KmToddRPWOa3Yg@mail.gmail.com>
 <87tvfsn2yk.fsf@tarshish>
 <CAMo8BfL+BLdP8q1r6HHbfHy-=DY+EksjodW26t1A2+7O9eJMHg@mail.gmail.com>
Message-ID: <CAMo8BfLbZsjS+ZazWj93U=7PUoC2yoZOK1mRNEkuNfM+QKh8GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 24, 2019 at 12:45 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sun, Mar 24, 2019 at 12:31 AM Baruch Siach <baruch@tkos.co.il> wrote:
> > You might want to take a look at this one as well:
> >
> >   http://autobuild.buildroot.net/?reason=libssh-0.8.7
> >
> > A number of -Werror=strict-overflow build issues were fixed in previous
> > releases (see the Buildroot commit log), but this one remains. It only
> > happens with the xtensa toolchain for some reason.

This warning is not issued with gcc-8 and later. The following commit
changed that: https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=247578
Looks like it was a generic gcc bug, given that that commit haven't changed
xtensa code generation.

-- 
Thanks.
-- Max
