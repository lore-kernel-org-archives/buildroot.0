From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 18:12:17 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: dependency documentation
 updates
In-Reply-To: <20191016175545.12855-1-danwalkes@trellis-logic.com>
References: <20191016175545.12855-1-danwalkes@trellis-logic.com>
Message-ID: <20191231171217.GA3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dan, All,

On 2019-10-16 11:55 -0600, Dan Walkes spake thusly:
> Update dependency documentation to detail the order-only relationship
> associated with the DEPENDENCIES variable.  See the thread at [1] for
> details.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2019-October/262685.html
> 
> Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>

Applied to master, after a slight rephrasing, and a bit of indentation
fixup. Thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-generic.txt |  8 +++++---
>  docs/manual/rebuilding-packages.txt     | 10 ++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index b402767b05..af94f5b1ec 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -358,9 +358,11 @@ not and can not work as people would expect it should:
>  * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
>    name) that are required for the current target package to
>    compile. These dependencies are guaranteed to be compiled and
> -  installed before the configuration of the current package starts. In
> -  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
> -  the current host package.
> +  installed before the configuration of the current package starts.
> +  However, modifications to configuration of these dependencies will
> +  not force a rebuild of the current package. In a similar way,
> +  +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for the current
> +  host package.
>  
>  * +LIBFOO_EXTRACT_DEPENDENCIES+ lists the dependencies (in terms of
>    package name) that are required for the current target package to be
> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index 6faa67adcb..326cd1fe82 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -65,6 +65,16 @@ can help you understand how to work with Buildroot:
>     there is no need for a full rebuild: a simple +make+ invocation
>     will take the changes into account.
>  
> + * When a +FOO_DEPENDENCIES+ package is rebuilt or removed, the package
> ++foo+ is not automatically rebuilt.  For example, if a package +bar+ is
> +listed in +FOO_DEPENDENCIES+ with +FOO_DEPENDENCIES = bar+ and the
> +configuration of the +bar+ package is changed, the configuration
> +change would not result in a rebuild of package +foo+ automatically.
> +In this scenario, you may need to either rebuild any packages in your
> +build which reference +bar+ in their +DEPENDENCIES+, or perform a
> +full rebuild to ensure any +bar+ dependent packages are
> +up to date.
> +
>  Generally speaking, when you're facing a build error and you're unsure
>  of the potential consequences of the configuration changes you've
>  made, do a full rebuild. If you get the same build error, then you are
> -- 
> 2.17.1
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
