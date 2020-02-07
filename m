From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Feb 2020 10:30:17 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
In-Reply-To: <87imkiyd32.fsf@dell.be.48ers.dk>
References: <20200206095421.12987-1-yegorslists@googlemail.com>
 <87imkiyd32.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_kvMR9y5FtiAUNcMDT8V4diTFNk=3KSD7twQzkXw0jm-tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Feb 7, 2020 at 10:13 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
>
>  > From: Yegor Yefremov <yegorslists@googlemail.com>
>  > Add an upstreamed patch that reorders find_package() commands.
>  > This way Python interpreter will be detected first and based on
>  > it the Python libraries can be found.
>
>  > Fixes the following CMake error:
>
>  > Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
>
> We don't seem to have any autobuilder failures in libftdi1 for almost 1
> year. Any idea why this doesn't trigger on the autobuilders?

In the version 1.4 find_package() calls were made without the REQUIRED
keyword. Hence, this error wasn't detected by the autobuilders. This
is now fixed upstream and I hope a new release will appear soon. But
meanwhile let's apply this fix.
Alternatively I could bump libftdi1 via a git instead of getting a
source tar file.

I'm preparing a libftdi1 test for Python for BR's CI. So that we could
catch such errors in the future.

Yegor
