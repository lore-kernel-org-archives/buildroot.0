From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 31 Mar 2015 21:17:33 +0200
Subject: [Buildroot] [git commit] packages: indentation cleanup
In-Reply-To: <20150331115925.66C387FA85@busybox.osuosl.org>
References: <20150331115925.66C387FA85@busybox.osuosl.org>
Message-ID: <CABbD_XC1Dqku9OV7tRnqOVO0OoNo34pAUs+4So7WPJXJOpLEdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Jerzy, all,

since this commit ccache ceased to work.
The indentation cleanup in ccache.mk seems to add some weird make error:

scythe at buildroot-vm:~/buildroot$ make clean
package/ccache/ccache.mk:70: *** missing separator.  Stop.

If I add back the tabs before the lines, it works again. If I add a '; \'
on the end of the first 4 lines, the only line 74 produces the error.
I think tab acts as a separator in makefiles.
I recommend reversing the patch on just this on file.

On Tue, Mar 31, 2015 at 1:57 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> commit:
> http://git.buildroot.net/buildroot/commit/?id=bd8c733fb4a0ca6ca1aa72f8b549d53dcd37f4ee
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> This commit doesn't touch infra packages.
>
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>

snip

>  package/ccache/ccache.mk                   |   10 +-
>

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150331/ad8ecf8e/attachment.html>
