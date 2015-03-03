From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 3 Mar 2015 15:03:46 +0100
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <20150303142901.5998a72c@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com>
Message-ID: <CAHkwnC94xHciiK2n8X0Gr7=PVTs_LWoqQ-bG1bg20jO1ygd0Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 3, 2015 at 2:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Tue,  3 Mar 2015 10:17:05 +0100, Fabio Porcedda wrote:
>
>> this patch set aims to improve build reproducibility by using a
>> per-package staging directory.
>> Also this feature aims to enable as default the top-level parallel make.
>
> Interesting! I must say I'm a bit worried about the implications of
> having to pass custom -I and -L flags all the time: we did arrange the
> compiler do not require those (by configuration for the internal
> toolchain case, and using the wrapper for the external toolchain case).
>
> Could you give some hints about the performance impact of those copies
> of the staging directory? Does it continue to make the top-level
> parallel build thing useful?

IMHO the per-package staging feature is useful even without taking in
consideration the top-level parallel build, the unspecified optional
dependency issue are not common, they can generate build faulres or
just binary with unexpected behavior.

> I.e can you compare in terms of build time the following cases:
>
>  * Normal non-top-level parallel build.
>  * A top-level parallel build without this PPS feature
>  * A top-level parallel build with this PPS feature

Sure

> Preferably something with a fairly deep dependency tree, i.e lots of
> small packages that depend on each other. A X.org stack + gtk2 would be
> a good example.

The most complete selection of package that i've tested is the
defconfig + allyespacakgeconfig (693 targets), i've tried to enable a
wider range of packages, defconfig + glibc + allyespackageconfig but
even without using the pps they fail to build.
So i will provide build times of the configuration defconfig +
allyespackageconfig.

If you provide a defconfig on the release 2015.02, i can try to build that.

BR
-- 
Fabio Porcedda
