From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 22 Apr 2017 12:44:52 +0530
Subject: [Buildroot] [PATCH v9 1/2] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
In-Reply-To: <20170421185839.17905-1-abhimanyu.v@gmail.com>
References: <20170421185839.17905-1-abhimanyu.v@gmail.com>
Message-ID: <CA+NV+V=UMv=e52VrUznw1-TMkvWk-g=-K-RdjTE51tUoKDCXng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 22, 2017 at 12:28 AM, Abhimanyu Vishwakarma
<abhimanyu.v@gmail.com> wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
>
> When called from BR2_ROOTFS_POST_IMAGE_SCRIPT, this script
> ends up with following error:
>
> Error: Missing argument
>
> This is because, extra positional argument is also passed
> along with BR2_ROOTFS_POST_SCRIPT_ARGS. genimage.sh didnt
> had support to parse positional and optional argument
> together.
>
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> ---
>  Changes v7->v8
>    - New file
>  Changes v8->v9
>    - Fix indentation
>    - Use bash basename as script name instead hardcoding
>
>  support/scripts/genimage.sh | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>

genimage.sh generated sdcard.img with Ci40 defconfig without any errors.

Tested-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Thanks,
Rahul
