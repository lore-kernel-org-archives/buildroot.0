From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 07:02:50 +0200
Subject: [Buildroot] [PATCH] libsndfile: select BR2_LARGEFILE
In-Reply-To: <5057A716.4070702@gmail.com>
References: <5057A716.4070702@gmail.com>
Message-ID: <20120918070250.0be14563@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Mallon,

On Tue, 18 Sep 2012 08:41:26 +1000, Ryan Mallon wrote:
> libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a

>  config BR2_PACKAGE_LIBSNDFILE
>         bool "libsndfile"
> +       select BR2_LARGEFILE
>         help
>           Libsndfile is a C library for reading and writing files containing
>           sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)

No, you shouldn't select BR2_LARGEFILE. You should depend on it. See
package/cdrkit/Config.in for an example. Don't forget to also add the
comment when BR2_LARGEFILE is not available.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
