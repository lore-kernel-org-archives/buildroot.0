From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sat, 5 Aug 2017 00:30:31 +0200
Subject: [Buildroot] [PATCH 02/10] add openssl as a dependency to
 certain packages
In-Reply-To: <20170804185521.12320-3-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-3-Adamduskett@outlook.com>
Message-ID: <d3e411b7-3f6d-d938-0f4d-51c33493bce1@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On 04.08.2017 20:55, Adam Duskett wrote:
> The following packages only work with OpenSSL.  In anticipation for the next
> patch, these packages must explicitly rely on OpenSSL in thier Config.in
> files.
> 
> The reason for each package is as follows:
> 
> luvi:
>   Uses TS_RESP_CTX_set_time_cb which is removed from LibreSSL.
>   This is the only package that currently uses this API in
>   BuildRoot.
> 
> nodejs:
>   Bundles it's own OpenSSL variant, which is tightly intigrated
>   with node.  There is a ongoing effort to make the SSL library
>   agnostic.  Gentoo has provided a patch to make NodeJS work with
>   LibreSSL, but I haven't been able to test it.
> 
> python-cryptography:
>   Newer versions compile against LibreSSL, however there
>   are some issues running the latest version when
>   cross compiling.
> 
> rauc:
>    Rauc uses smc exclusively, which LibreSSL does not support.
> 
> stunnel:
>   The author of stunnel has on two occasions said he will now

'not' instead of 'now' I think.

[snip]

Best wishes,
Marcus
