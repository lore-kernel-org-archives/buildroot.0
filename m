From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:30:49 +0200
Subject: [Buildroot] [PATCH i-g-t v3 1/1] docs/manual/prerequisite.txt:
In-Reply-To: <20180618124816.4258-1-david.degrave@mind.be>
References: <20180618124816.4258-1-david.degrave@mind.be>
Message-ID: <20180626233049.34267f58@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

Why does this patch has a prefix named "i-g-t" ? Are you working on
intel-gpu-tools besides working of Buildroot ?

ALso, the commit title is not complete, it lacks a description.

On Mon, 18 Jun 2018 14:48:16 +0200, David De Grave (Essensium/Mind)
wrote:
> Add required packages to be able to build on Redhat/Debian x86_64 with
> prebuilt x86 tools.
> 
> v3:
> - Add quotes between `g++-multilib` as noticed by Baruch Siach <baruch@tkos.co.il>

The changelog should be ...

> 
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> ---

... here, so that it doesn't become part of the Git commit log once the
patch is applied.

>  docs/manual/prerequisite.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index 110fab41fd..0a2d5b6b70 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -87,3 +87,7 @@ corresponding tool on the host system:
>  * Graph generation tools:
>  ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
>  ** +python-matplotlib+ to use 'graph-build'
> +
> +* 32-bit compatibility libraries for precompiled executables:

I think we should explicit a little bit in which situations this is
needed. Maybe:

On 64-bit machines, 32-bit compatibility libraries may be needed to run
pre-built executables, such as external toolchains, or pre-built host
tools. To install such libraries, install the following packages:

> +** +glibc.i686+ and +zlib.i686+ (Redhat/Fedora)
> +** +libc6:i386+ and `g++-multilib` (Debian/Ubuntu)

However, overall, I'm not too happy with this, because we don't tell
the user exactly when such dependencies are needed. Isn't the check in
support/dependencies/dependencies.sh for the availability of 32-bit
libraries sufficient ? If it doesn't cover some cases, then it would
perhaps be better to extend support/dependencies/dependencies.sh rather
than having a fuzzy requirement in the documentation, where we don't
explicitly and clearly say in which situations such or such dependency
is necessary.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
