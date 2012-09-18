From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 07:55:51 +0200
Subject: [Buildroot] [PATCH] libsndfile: Add dependency on BR2_LARGEFILE
In-Reply-To: <505801FF.20207@gmail.com>
References: <505801FF.20207@gmail.com>
Message-ID: <20120918075551.5f3c294c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Mallon,

On Tue, 18 Sep 2012 15:09:19 +1000, Ryan Mallon wrote:
> libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a
> typedef alias for off_t. This is not true by default for all
> tool-chains, which leads to a runtime assert failure in binaries
> compiled against libsndfile. See:
>     
>   http://permalink.gmane.org/gmane.comp.audio.libsndfile.devel/229
>     
> Add a dependency on BR2_LARGEFILE for libsndfile, and a comment if
> BR2_LARGEFILE is not selected.
>     
> Signed-off-by: Ryan Mallon <rmallon@gmail.com>

Ok, looks better. But now you need to udpate all the reverse
dependencies of libsndfile (i.e, all packages that select
BR2_PACKAGE_LIBSNDFILE), to add the same BR2_LARGEFILE dependency. This
concerns bluez_utils, gst-plugins-bad, mpd and pulseaudio.

(Note: this problem should be simplified once we get Yann's work on
the _AVAILABLE thing merged, but in the mean time, we have to handle
those reverse dependencies manually).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
