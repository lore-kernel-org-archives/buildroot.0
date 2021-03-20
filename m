From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:24:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/elfutils: fix build with uclibc
In-Reply-To: <20210318074219.4113728-1-fontaine.fabrice@gmail.com>
References: <20210318074219.4113728-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320222418.3fbc9ee2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Mar 2021 08:42:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update first patch to fix a build failure with uclibc and elfutils in
> version 0.183.0 which errors out if obstack is not found since
> https://sourceware.org/git/?p=elfutils.git;a=commit;h=da855fc9cd415c288bfcb9de1f3d5eb329de0557
> 
> Indeed, obstack has been removed from uclibc-ng since version 1.0.21 and
> https://github.com/wbx-github/uclibc-ng/commit/0bd6bfb2b643ea2b4b1440dfd917ba752f0c0d15
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/003ae73c7b48ad6b9837fb19ca197061d20eaf6d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Add-a-enable-disable-progs-configure-option.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
