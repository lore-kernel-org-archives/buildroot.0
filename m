From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 18:09:25 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
Message-ID: <20180416180925.464f3435@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 10:34:31 -0300, Ricardo Martincoski wrote:

> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 33d0ae9..6a01151 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -291,6 +291,9 @@ def prepare_build(**kwargs):
>      # recursively find files under root
>      def find_files(root):
>          for r, d, f in os.walk(root):
> +            if '.git' in d:
> +                d[:] = list()

Python question: is there any advantage in doing d[:] = list() instead
of just d = list() ?

Also, do we need to actually set d to the empty list ? We're anyway
doing a continue, and skipping over to the next iteration, where a new
value of d will be returned by os.walk(). Am I missing something ?

I think I'm also missing how this will prevent from iterating in
sub-directories, like git/<something>/foo/. I guess I need to read
again how os.walk() is working exactly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
