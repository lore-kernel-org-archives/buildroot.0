From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:11:37 +0200
Subject: [Buildroot] [PATCH] package/samba4: update samba4-cache.txt for
 fcntl flags check
In-Reply-To: <20210402182520.4485-1-peter@korsgaard.com>
References: <20210402182520.4485-1-peter@korsgaard.com>
Message-ID: <20210403071137.GT24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-04-02 20:25 +0200, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/a5d/a5db81fca8ec07159b69b108b742f3d060e3316a/
> 
> Checking whether fcntl supports flags to send direct I/O availability signals                   : not found
> ..
> Cross answers file /srv/storage/autobuild/run/instance-3/output-1/build/samba4-4.14.2/cache.txt is incomplete
> 
> Samba4 has added a check for fcntl F_{G,S}ETOWN_EX handling since:
> https://gitlab.com/samba-team/devel/samba/-/commit/5084a69de14f24e9d804998580eefcba773fdd5a
> 
> Which is supported by the Linux kernel since 2.6.32 in commit
> ba0a6c9f6fceed11 (fcntl: add F_[SG]ETOWN_EX), so add it to the cache file.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/samba4/samba4-cache.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
> index bd7c3654b4..75d0343dc9 100644
> --- a/package/samba4/samba4-cache.txt
> +++ b/package/samba4/samba4-cache.txt
> @@ -42,3 +42,4 @@ checking for clnt_create(): OK
>  Checking for a 64-bit host to support lmdb: NO
>  Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
>  Checking value of GNUTLS_MAC_AES_CMAC_128: 203
> +Checking whether fcntl supports flags to send direct I/O availability signals: OK
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
