From: Chih-Min Chao <cmchao@gmail.com>
Date: Mon, 14 Mar 2011 12:02:33 +0800
Subject: [Buildroot] [PATCH 2/9] alsa-utils : bump to 1.0.24.2
In-Reply-To: <87lj0i8uui.fsf@macbook.be.48ers.dk>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
	<1299831215-26466-2-git-send-email-cmchao@gmail.com>
	<87lj0i8uui.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimeoXMFvkq2FnsnfEFQXwWzH-R2fUAzmdYrUXUB@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 14, 2011 at 7:27 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Chih-Min" == Chih-Min Chao <cmchao@gmail.com> writes:
>
> ?Chih-Min> Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
> ?Chih-Min> ---
> ?Chih-Min> ?package/multimedia/alsa-utils/alsa-utils.mk | ? ?2 +-
> ?Chih-Min> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> ?Chih-Min> diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
> ?Chih-Min> index 4ab49d3..26c270b 100644
> ?Chih-Min> --- a/package/multimedia/alsa-utils/alsa-utils.mk
> ?Chih-Min> +++ b/package/multimedia/alsa-utils/alsa-utils.mk
> ?Chih-Min> @@ -3,7 +3,7 @@
> ?Chih-Min> ?# alsa-utils
> ?Chih-Min> ?#
> ?Chih-Min> ?#############################################################
> ?Chih-Min> -ALSA_UTILS_VERSION = 1.0.23
> ?Chih-Min> +ALSA_UTILS_VERSION = 1.0.24.2
>
> This breaks on uClibc where we don't have the exp10 glibc extension:
>
> volume_mapping.o: In function `get_normalized_volume':
> volume_mapping.c:(.text+0x160): undefined reference to `exp10'
> volume_mapping.c:(.text+0x19c): undefined reference to `exp10'
> volume_mapping.o: In function `set_normalized_volume':
> volume_mapping.c:(.text+0x298): undefined reference to `exp10'
> collect2: ld returned 1 exit status
> make[3]: *** [alsamixer] Error 1
>
> I guess we'll need to come up with an emulation for it.
>
> --
> Bye, Peter Korsgaard
>

replace exp10(x) with   exp(x * ln 10)

10^x = 10 ^(ln e^x) = (e^x)^ln10 = e ^ (x * ln 10)
