From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 23:37:34 +0200
Subject: [Buildroot] csky_gx6605s_defconfig add
 "BR2_TOOLCHAIN_EXTERNAL=y"
In-Reply-To: <8130d244-31a8-a5df-9bc9-ecb2d53280c9@mind.be>
References: <tencent_2664A2093675DB6268415CDB@qq.com>
 <8130d244-31a8-a5df-9bc9-ecb2d53280c9@mind.be>
Message-ID: <d9edd887-f1bc-0b0b-9d1a-a84b6d372706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sorry, I accidentally pressed send.

On 02/08/2019 23:26, Arnout Vandecappelle wrote:
>  Hi Liu,
> 
>  Thank you for this patch.
> 
> On 20/06/2019 11:56, ??? wrote:
>> hi?
>> ???????? ? buildroot source: git clone git://git.buildroot.net/buildroot
>> ?????????
>> all BR2_TOOLCHAIN_EXTERNAL_* items depend on BR2_TOOLCHAIN_EXTERNAL=y

 You need to add a Signed-off-by line for yourself.  This is a short way for you
to assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

>> diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
>> index d0a2aad..22e9e0c 100644
>> --- a/configs/csky_gx6605s_defconfig
>> +++ b/configs/csky_gx6605s_defconfig
>> @@ -1,5 +1,6 @@
>> ?BR2_csky=y
>> ?BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
>> +BR2_TOOLCHAIN_EXTERNAL=y

 This is unfortunately not enough to fix the issue, since the external toolchain
can no longer be selected due to the conditions. Thomas is sending a patch to
fix that.

 In addition, Guo has sent a patch that moves this defconfig to an internal
defconfig (like we do for all our other defconfigs) instead of an external one.

 Therefore, I've marked this patch as Superseded in patchwork.


 Regards,
 Arnout

>> ?BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> ?BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
>> ?BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
