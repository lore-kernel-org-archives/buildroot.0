From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 19:33:53 +0200
Subject: [Buildroot] [PATCH 1/1] add daemon mode support to pulseaudio
In-Reply-To: <1367584523-8491-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1367584523-8491-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20130503193353.1672f8dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

The title of the patch should be:

	pulseaudio: add daemon mode support

i.e, always put the name of the affected package first.

On Fri,  3 May 2013 14:35:22 +0200, J?r?my Rosen wrote:
> pulseaudio documentation recommands not using the daemon mode unless you

recommends.

> are on a headless system, but since that is the common case for a
> buildroot installation, install the related user and groups

> +config BR2_PACKAGE_PULSEAUDIO_DAEMON
> +	bool "start pulseaudio as a system daemon"

	bool "start as a daemon"

should be sufficient, since the option will be indented under
pulseaudio.

> +	depends on BR2_PACKAGE_PULSEAUDIO
> +	help
> +	  PulseAudio can be started as a system daemon. This is not the
> +	  recommanded way of using PulseAudio unless you are building a

recommended.

> +	  headless system

Missing final dot. It would be good to explain how pulseaudio is
started when this option is not selected.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
