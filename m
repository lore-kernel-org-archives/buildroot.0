From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 8 Feb 2019 00:40:25 +0100
Subject: [Buildroot] [PATCH 08/19] support/check-uniq-files: decode as
 many strings as possible
In-Reply-To: <fcf8eccf9d275bd95c7e61099722c1a3b22a6da9.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <fcf8eccf9d275bd95c7e61099722c1a3b22a6da9.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <11fc1785-c180-a8fc-7a90-46d487218b7c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/01/2019 23:05, Yann E. MORIN wrote:
> +# If possible, try to decode the binary string s with the user's locale.
> +# If s contains characters that can't be decoded with that locale, return
> +# the representation (in the user's locale) of the un-decoded string.
> +def str_decode(s):
> +    try:
> +        return s.decode()
> +    except UnicodeDecodeError:
> +        return repr(s)

 I think s.decode(errors='replace') is exactly what we want: it prints the
question mark character for things that can't be represented, just like ls does.

 Regards,
 Arnout
