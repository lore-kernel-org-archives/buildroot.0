From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:40:17 +0100
Subject: [Buildroot] [PATCH] sdl_mixer: fix static linking issue
In-Reply-To: <20161207190900.GA18119@waldemar-brodkorb.de>
References: <20161207190900.GA18119@waldemar-brodkorb.de>
Message-ID: <20161207234017.053799e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Dec 2016 20:09:00 +0100, Waldemar Brodkorb wrote:
> LDFLAGS must be passed when creating binaries.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> while testing the berkeley db fix, this error occured afterwards, so
> no autobuilder reference.

Sounds good...

> ---
>  .../sdl_mixer/0002-add-LDFLAGS-while-linking.patch   | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
> 
> diff --git a/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
> new file mode 100644
> index 0000000..5c55a48
> --- /dev/null
> +++ b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
> @@ -0,0 +1,20 @@
> +Pass LDFLAGS while creating binaries.

... but please add more details here about *why* we're doing this.

> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
