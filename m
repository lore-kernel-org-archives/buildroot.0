From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 01:21:23 +0100
Subject: [Buildroot] [PATCH v7 18/18] docs/manual: document how to debug
 shell script
In-Reply-To: <1457564339-27294-19-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-19-git-send-email-s.martin49@gmail.com>
Message-ID: <56E0BE03.8070705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:58, Samuel Martin wrote:
> The method describes here is only true for scripts using the shell
> modules from support/scripts/shell/*.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> changes v6->v7:
> - new patch
> ---
>   docs/manual/debugging-buildroot.txt | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
> index f575fc4..c497284 100644
> --- a/docs/manual/debugging-buildroot.txt
> +++ b/docs/manual/debugging-buildroot.txt
> @@ -41,3 +41,18 @@ The script has access to the following variables:
>     - +BINARIES_DIR+: the place where all binary files (aka images) are
>       stored
>     - +BASE_DIR+: the base output directory
> +
> +=== Debugging shell scripts in Buildroot

  If you introduce a subsection, then everything that comes before it should 
also be moved to a subsection. E.g.

[[debugging-buildroot]]

== Debugging Buildroot

=== Running scripts before and after each build step

It is possible to instrument the steps +Buildroot+ does when building


> +
> +For shell scripts using the _shell modules_ (available in
> ++support/scripts/shell/+), there is a couple of environment variables
                                     ^^ are

  but actually, there is only one...

  Regards,
  Arnout

> +you can set to trace the scripts
> +
> +  - +SHELL_DEBUG+ adjustes the debug level, from 0 to 3 (only errors to
> +    all debug messages)
> +
> +To enable these debug outputs:
> +
> +----
> +SHELL_DEBUG=3 make
> +----
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
