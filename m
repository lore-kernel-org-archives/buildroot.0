From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Oct 2014 15:39:27 +0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.7p1
In-Reply-To: <1412680305-28778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412680305-28778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141007123927.GD8276@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Oct 07, 2014 at 08:11:45AM -0300, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssh/openssh.hash | 2 ++
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/openssh/openssh.hash
> 
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> new file mode 100644
> index 0000000..0b57d48
> --- /dev/null
> +++ b/package/openssh/openssh.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507	openssh-6.7p1.tar.gz

Why not use the (base64 encoded) hash values from 
http://www.openssh.com/txt/release-6.7? The output of

	echo svg5Tq6Fjau9732sELma7ADJVGJ1PoA0LlMLu29yVQc= |base64 -d |hd

matches your calculated SHA256 AFAICS.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
