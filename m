From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 27 May 2015 08:33:22 -0500
Subject: [Buildroot] [PATCH 1/1] Removed Python dependency from
 python-pygame package. With the dependency,
 it was only possible to build the package with Python 2. Without the
 dependency it is now possible to also use Python 3.
In-Reply-To: <1432561909-15488-1-git-send-email-pbouda@cidles.eu>
References: <1432561909-15488-1-git-send-email-pbouda@cidles.eu>
Message-ID: <CAMQcK5Ly-s1_LVrTJRgmu-0eEbJuw7om_Kw-dNLJBN0yrEMK0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, May 25, 2015 at 8:51 AM, Peter Bouda <pbouda@cidles.eu> wrote:

The title (subject) of a commit is usually limited to less than 70
characters. The body of the commit message should also be no longer
than 70 characters as well.

If you don't mind resubmitting this patch with a title and subject as follows:

python-pygame: remove python dependency

With the dependency on BR2_PACKAGE_PYTHON it was only possible to
build the package with python2. However, python-pygame works with
python3 so enable it to be built with it.

> Signed-off-by: Peter Bouda <pbouda@cidles.eu>
> ---
>  package/python-pygame/Config.in | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
> index f72ee31..932b0f1 100644
> --- a/package/python-pygame/Config.in
> +++ b/package/python-pygame/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_PYGAME
>         bool "python-pygame"
> -       depends on BR2_PACKAGE_PYTHON
>         select BR2_PACKAGE_SDL
>         help
>           Pygame is a cross-platfrom library designed to make it easy to write

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
