From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 17:33:38 +0100
Subject: [Buildroot] [PATCH 1/5] utils/scancpan: warn when a module is a
 perl core module
In-Reply-To: <20191222162146.1947-1-francois.perrad@gadz.org>
References: <20191222162146.1947-1-francois.perrad@gadz.org>
Message-ID: <20191222163338.GI26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2019-12-22 17:21 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This change does need to be explained in the commit log:

  - Why is it bad that we have a pacakge that is a core module?
  - Does it cause any issue? If so, which one?

Also, when you do removes package, the least is to add in Cc the people
that initially added the package, so they have a chance to chime in and
explain why they wanted to add it in the first place, and so they can
confirm that the core module does indeed work for them.

I'll mark the whole series as Changes Requested in Patchowrk. Please
respin with explanations, and Cc original packagers.

Regards,
Yann E. MORIN.

> ---
>  utils/scancpan | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index ac5fd5159..dbd8dab6d 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -611,6 +611,9 @@ sub fetch {
>      unless ($dist{$name} && !$top) {
>          say qq{fetch ${name}} unless $quiet;
>          my $result = $mcpan->release( distribution => $name );
> +        my $main_module = $result->{main_module};
> +        push @info, qq{[$name] $main_module is a core module}
> +            if $top && Module::CoreList::is_core( $main_module, undef, $] );
>          $dist{$name} = $result;
>          $license_files{$name} = {};
>          eval {
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
