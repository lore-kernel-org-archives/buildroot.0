From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 18 May 2020 13:00:38 +0200
Subject: [Buildroot] [PATCH 1/1] Check if two spaces between fields in
 hash file
In-Reply-To: <qagxdWV55NSsOiPMpXTP3jHIEfqwaUmTL_EAlKzZD1EUoCg_dqyTA6GpJVG705r_Wavn8HP2hZEDvT5FbSBRTHBU1rKtIhb6WZejUcKSwSE=@protonmail.com>
References: <qagxdWV55NSsOiPMpXTP3jHIEfqwaUmTL_EAlKzZD1EUoCg_dqyTA6GpJVG705r_Wavn8HP2hZEDvT5FbSBRTHBU1rKtIhb6WZejUcKSwSE=@protonmail.com>
Message-ID: <CAEyMn7aBZO0pbfOxLH0zDkp7k5G_+969c27px9YrPN7OFYqYLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair and all,

Am Mo., 18. Mai 2020 um 09:39 Uhr schrieb Yair Ben-Avraham <
yairba@protonmail.com>:

> Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
> ---
>  utils/checkpackagelib/lib_hash.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/utils/checkpackagelib/lib_hash.py
> b/utils/checkpackagelib/lib_hash.py
> index 3e381119a5..064d8cb37f 100644
> --- a/utils/checkpackagelib/lib_hash.py
> +++ b/utils/checkpackagelib/lib_hash.py
> @@ -27,6 +27,11 @@ class HashNumberOfFields(_CheckFunction):
>                      .format(self.filename, lineno, self.url_to_manual),
>                      text]
>
> +        if (2 != text.rpartition('  ')[0].count(' ') or
> +            2 != text.partition('  ')[-1].count(' ')):
> +            return ["{}:{} expected two spaces between fields"
> +                    .format(self.filename, lineno), text]
> +
>
>  class HashType(_CheckFunction):
>      len_of_hash = {"md5": 32, "sha1": 40, "sha224": 56, "sha256": 64,
>
>
There is already a similar patch available:
https://patchwork.ozlabs.org/project/buildroot/patch/20200205212211.29720-1-heiko.thiery at gmail.com/


-- 
Heiko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200518/e706026d/attachment.html>
