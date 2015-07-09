From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 09 Jul 2015 14:51:48 +0200
Subject: [Buildroot] [PATCH 1/7] Add package check: unit test library
In-Reply-To: <20150703183433.GD3652@free.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1435929086-21205-2-git-send-email-sylvain.raybaud@green-communications.fr>
 <20150703183433.GD3652@free.fr>
Message-ID: <559E6E64.30807@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yann, all,

On 03/07/2015 20:34, Yann E. MORIN wrote:
>> diff --git a/package/check/check.hash b/package/check/check.hash
>>> new file mode 100644 index 0000000..7d7e19b --- /dev/null +++
>>> b/package/check/check.hash @@ -0,0 +1,2 @@ +# Hash from:
>>> http://downloads.sourceforge.net/project/check/check/check-0.9.14.tar.gz
>
>>> 
Correct URL is:
> http://sourceforge.net/projects/check/files/check/0.9.14/

The hash is actually locally computed, so I guess it's just:
# Locally computed:

>>> diff --git a/package/check/check.mk b/package/check/check.mk 
>>> [..] +CHECK_INSTALL_STAGING = YES +CHECK_INSTALL_TARGET = NO
> Why don't you install on the target? check installs a shared
> library by default, so you really want to install in the target.
> 
> Otherwise, explain why you don't.
> 

Ah, right. Since check is used to build binaries specifically for
testing in my use case (galera), I thought I'd save some space by not
installing on target. But you're right, it's a bad idea and I'll
remove these lines.

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVnm5kAAoJEEkkwl4JtJ9y66QP/2eT5UYOlpYXfN/UEo405082
SZ/QDNJv4m8FKLzuBNnRE5XQVIcHiNUmLJWqNrGbjeG+VnY+fbnAkZt3uPVSUY8O
u36Gs4H+3S1E7Pj6GQ0bQwz9Z4qTvIJuLTXdswtAv77Qv4uNjk5juJKrULUl8/j+
ssoBImlHY0nQVyP8xKOPlCNcrBWy8DfKQqKNkqLTvvIsqKE8gFNOsJPog9HrL56T
XRjTTK5VpXc6MuXWhd82AGTcng5S/3OBBJYN/8lTexNRdCF9y0haSyUR2MjDtb0y
LXyTm0fieaLwHfSqSUn+F/8YFN7P9wNZaWQcIlvznWFLZvhHNxUITuI1fWbNbAKY
ftIhq3RsZr2SFSj358i9GhSg50wGtWQ4HjwyZocG1nLPm2+SM+MtF7lbVQQtVc7U
jgXX6QxCd3UcgCCcOmN/XQV8H+mf96b9H76ArsG2W/TZYxBKArPnyNFmFIqMsH8G
Irih1lYrcDqpkmFripWtcdFnPjUAxUG1U01WnwGDKrvH3KE5b/YBDHfeorHjTYDs
nD4MYFnrqfOt+rpmt4np3BIXkUuTOYbQlfsB8IKdBQZF33O6U50jA+psiGJRmgkc
Z/awGe+L35kD7F1KV7fjyG5SeBFC9I8W4b1nTrG3Ww98k6Lsp4Osc+Rs48X5793l
4YLfcTO8MmMhSrXCLg7a
=DQZa
-----END PGP SIGNATURE-----
