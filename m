From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 May 2012 01:06:02 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: bump version to
	1.15.2, update config files
In-Reply-To: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr>
References: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201205090106.03026.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Wednesday 09 May 2012 01:01:21 Yann E. MORIN wrote:
> Update the version of crosstool-Ng used, bump to 1.15.2.
> Also, update the bundled config files to match the new version.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../crosstool-ng-001-wget-instead-of-curl.patch    |   52 -------------
>  package/crosstool-ng/crosstool-ng.mk               |    2 +-
>  .../crosstool-ng.config-eglibc                     |   70 ++++++++++++------
>  .../crosstool-ng.config-glibc                      |   75 +++++++++++++------
>  .../crosstool-ng.config-uClibc                     |   78 +++++++++++++------

Dealing with the bundled config files is a pain, yes.

Thomas convinced me to add the 'savedefconfig' to crosstool-NG, and it will
be available in the next release, so hopefully it will be easier to manage
in the future. In the meantime, we have to suffer this limitation of using
full .config files. Bah, ~220 lines changed in 3 files, that's not that bad...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
