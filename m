From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:20:41 +0200
Subject: [Buildroot] [PATCH 2/3] raspberrypi: post-image.sh add new
	gpu_mem option
In-Reply-To: <20170924141207.muyixrdd2u27n7uw@gportay>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
 <20170923233007.13772-3-gael.portay@savoirfairelinux.com>
 <8c1d85a4-4390-047f-1d21-af37842a0040@mind.be>
 <20170924141207.muyixrdd2u27n7uw@gportay>
Message-ID: <71439ed0-48d7-ac9f-3cf5-33748f566fea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 16:12, Ga?l PORTAY wrote:
> In the end, what I would like to have is to give config.txt options as
> arguments to post-image.sh; that are echo'ed to the file. Because some
> options are already presents in the config.txt file, we have either to
> sed or to echo/cat.
> 
> Something arround...
> 
> 	$ post-image.sh skip-first-arg enable_uart=1 dtoverlay=pi3-miniuart-bt gpu_mem=200
> 
> and...
> 
> 	shift
> 	while [ $# -eq 0 ]; do
> 		echo "$1" >>$BINARIES_DIR/rpi-firmware/config.txt
> 		shift
> 	done
> 
> 	genimage ...
> 
> So we no longer needs to update the script each time we need to add a
> new argument that plays with the config.txt.
> 
> What do you think?

 Well, then it's probably easier to just copy a config.txt, no? Perhaps adding
options for custom config.txt to rpi-firmware?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
