From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Feb 2019 23:13:37 +0100
Subject: [Buildroot] [PATCHv3 7/7] support/download/{bzr, cvs, git,
 svn}: highlight unimplemented source-check
In-Reply-To: <20190209202350.4984-7-patrickdepinguin@gmail.com>
References: <20190209202350.4984-1-patrickdepinguin@gmail.com>
 <20190209202350.4984-7-patrickdepinguin@gmail.com>
Message-ID: <20190209221337.GJ3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-02-09 21:23 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> For bzr, cvs, git and svn, there is no method of checking whether the

Acutally, for svn this is realtively trivial:

    svn ls -r ${rev} ${remote}

We have two packages in Buildroot that use svn, fis and open2300, so you
cn use them to test:

    $ svn ls -r 2892 http://svn.chezphil.org/utils/trunk
    Redirecting to URL 'https://svn.chezphil.org/utils/trunk':
    Makefile
    apexctl.cc
    [...]

Regards,
Yann E. MORIN.

> revision exists remotely, without actually cloning the repository.
> Therefore, there is no actual implementation for '-C' (checkonly) for these
> download helpers. The script will fall back to the normal download logic,
> which would effectively fail if the revision does not exist.
> 
> For completeness, mention this unimplemented feature in the usage text.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/bzr | 2 ++
>  support/download/cvs | 2 ++
>  support/download/git | 2 ++
>  support/download/svn | 2 ++
>  4 files changed, 8 insertions(+)
> 
> v3: no changes
> 
> diff --git a/support/download/bzr b/support/download/bzr
> index 5289a421cd..278d8778af 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -7,6 +7,8 @@ set -e
>  #
>  # Options:
>  #   -q          Be quiet
> +#   -C          (unimplemented) Only check that the revision exists in the
> +#               remote repository.
>  #   -o FILE     Generate archive in FILE.
>  #   -u URI      Clone from repository at URI.
>  #   -c CSET     Use changeset (or revision) CSET.
> diff --git a/support/download/cvs b/support/download/cvs
> index 9d0dc3cb3a..d9a586293a 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -7,6 +7,8 @@ set -e
>  #
>  # Options:
>  #   -q          Be quiet
> +#   -C          (unimplemented) Only check that the revision exists in the
> +#               remote repository.
>  #   -o FILE     Generate archive in FILE.
>  #   -u URI      Checkout from repository at URI.
>  #   -c REV      Use revision REV.
> diff --git a/support/download/git b/support/download/git
> index 17ca04eb98..e9c02d6712 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -7,6 +7,8 @@ set -E
>  #
>  # Options:
>  #   -q          Be quiet.
> +#   -C          (unimplemented) Only check that the revision exists in the
> +#               remote repository.
>  #   -r          Clone and archive sub-modules.
>  #   -o FILE     Generate archive in FILE.
>  #   -u URI      Clone from repository at URI.
> diff --git a/support/download/svn b/support/download/svn
> index 542b25c0a2..5fff064683 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -7,6 +7,8 @@ set -e
>  #
>  # Options:
>  #   -q          Be quiet.
> +#   -C          (unimplemented) Only check that the revision exists in the
> +#               remote repository.
>  #   -o FILE     Generate archive in FILE.
>  #   -u URI      Checkout from repository at URI.
>  #   -c REV      Use revision REV.
> -- 
> 2.19.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
