From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 00:36:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] docs/manual: Add section about
 contributing to release branches
In-Reply-To: <20200908220525.26283-1-brandon.maier@rockwellcollins.com>
References: <20200908220525.26283-1-brandon.maier@rockwellcollins.com>
Message-ID: <20200908223653.GM14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

On 2020-09-08 17:05 -0500, Brandon Maier spake thusly:
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

Applied to master, with the following changes:

  - s/release branch/maintenance branch/
  - extend the master-then-backport section
  - slight eye-candy on the rest

Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v2:
> - Forgot to save before commiting, mention to base branch of release
>   branch, add example
> 
>  docs/manual/contribute.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 11d8811b44..85d7111735 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -371,6 +371,22 @@ in the following cases:
>  * whenever you feel it will help presenting your work, your choices,
>    the review process, etc.
>  
> +==== Patches for release branches
> +
> +When fixing bugs on a release branch, bugs should be fixed on the master
> +branch first. Then the release branch maintainer can backport the fixes
> +to the correct release branches. But some bugs may apply only to a
> +specific release, for example because it is using an older version of a
> +package. In that case, patches should be based off the release branch,
> +and the patch's subject prefix must include the release branch name (for
> +example "[PATCH 2020.02.x]"). This can be done with the +git
> +format-patch+ flag +--subject-prefix+.
> +
> +---------------------
> +$ git format-patch --subject-prefix "PATCH 2020.02.x" \
> +    -M -s -o outgoing origin/2020.02.x
> +---------------------
> +
>  ==== Patch revision changelog
>  
>  When improvements are requested, the new revision of each commit
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
