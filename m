From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 13 Sep 2018 20:38:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-09-12
In-Reply-To: <20180913060038.91A2A203DC@mail.bootlin.com>
References: <20180913060038.91A2A203DC@mail.bootlin.com>
Message-ID: <CAB0FRsvZO7F8okh-mANVB34-Oqz9zXVm+Oxzkhc6apVM-=gySQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-09-13 8:00 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-09-12, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>      powerpc |                    botan-2.7.0 |
> http://autobuild.buildroot.net/results/8768305ac3d19ffeebcb9cbf7b2d4c
> 2a3925ed5e
>          arm |                    botan-2.7.0 |
> http://autobuild.buildroot.net/results/534da42b329383c3659c1facaca062
> 0260aae05b
>      powerpc |                    botan-2.7.0 |
> http://autobuild.buildroot.net/results/c0768d8272371b873170cd1e03082f
> 7af51ada20
>      powerpc |       perl-crypt-blowfish-2.14 |
> http://autobuild.buildroot.net/results/23d4be733c8807b4f5b967e9faa4fb
> 75f6e8c35b
>     mips64el | perl-crypt-openssl-random-0.15 |
> http://autobuild.buildroot.net/results/d27d83941de7611681e1d14b1920a6
> 0a61f63337
>      sparc64 | perl-crypt-openssl-random-0.15 |
> http://autobuild.buildroot.net/results/6ac330770de8a4f68668e7cf52d465
> d8f2827adf
>         i586 | perl-crypt-openssl-random-0.15 |
> http://autobuild.buildroot.net/results/0a34554d05cd242f5a7e8e5f40e22e
> a5be43c925
>     mips64el |           perl-net-ssleay-1.85 |
> http://autobuild.buildroot.net/results/8934f2c203f8b61519dba94188985f
> 1a9261de9a
>
>
You must revert my 2 last commits about pkg-perl.mk
https://git.busybox.net/buildroot/commit/?id=e58e19a9ec1dc1a6900063c43aa9d32b6578ecf8
https://git.busybox.net/buildroot/commit/?id=ae94fff1c5695b4efcab0aed69212476be85fb52

When PERL_INC is set in the configure step with a path to STAGING_DIR,
the generated Makefile (used by the build step) contains in fact a PERL_INC
with a path to HOST_DIR.

Fran?ois


> --
> http://autobuild.buildroot.net
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180913/0cf14f8e/attachment.html>
