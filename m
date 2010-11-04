From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Nov 2010 14:44:44 +0100
Subject: [Buildroot] [PATCH 04/12] autotools: introduce
 $(PKG_NAME)_AUTORECONF_ENV/$(PKG_NAME)_AUTORECONF_OPT variables
In-Reply-To: <1288839031-24277-5-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-5-git-send-email-llandwerlin@gmail.com>
Message-ID: <20101104144444.40cec726@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Nov 2010 03:50:23 +0100
llandwerlin at gmail.com wrote:

> Rather than defining the AUTORECONF variable containing the path to
> the autoreconf tool + all its arguments, we split the variable in two.
> There is now :
>       - AUTORECONF which contains the path to the autoreconf tool,
>       - $(PKG_NAME)_AUTORECONF_OPT which contains the autoreconf arguments,
> 
>       - and we add $(PKG_NAME)_AUTORECONF_ENV which contains the autoreconf
>         environment variables.
> 
> This allow us to define a specific setup to run autoreconf for both
> target and host as well as per package if needed.

Ok on the principle, but see comment below.

> +      <li><code>LIBFOO_AUTORECONF_OPT</code> to specify additional
> +      options passed to the <i>autoreconf</i> program
> +      if <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>

Seems to be a duplication of :

> +      <li><code>LIBFOO_AUTORECONF_OPT</code>, to specify options
>        passed to the <i>autoreconf</i> program if
> -      <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
> +      <code>LIBFOO_AUTORECONF=YES</code>. By default, <code>-f -i -I
> +      "$(ACLOCAL_DIR)"</code>.</li>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
