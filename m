From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 21:08:44 +1300
Subject: [Buildroot] [V4 1/1] python-mutagen: new package
In-Reply-To: <20170125162610.24101-1-aduskett@codeblue.com>
References: <20170125162610.24101-1-aduskett@codeblue.com>
Message-ID: <20170126210844.719a364b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 11:26:10 -0500, Adam Duskett wrote:
> +	help
> +	  Mutagen is a Python module to handle audio metadata. 
> +	  It supports ASF, FLAC, MP4, Monkey?s Audio, MP3, Musepack, Ogg Opus, 
> +	  Ogg FLAC, Ogg Speex, Ogg Theora, Ogg Vorbis, True Audio, WavPack, 
> +	  OptimFROG, and AIFF audio files. All versions of ID3v2 are supported, 
> +	  and all standard ID3v2.4 frames are parsed. 
> +	  
> +	  It can read Xing headers to accurately calculate the bitrate and length 
> +	  of MP3s. ID3 and APEv2 tags can be edited regardless of audio format. 
> +	  It can also manipulate Ogg streams on an individual packet/page level.

These lines were too long, and contained some trailing white space. I
fixed that up.

> +PYTHON_MUTAGEN_VERSION = 1.36
> +PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
> +PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/69/14/4a5c8360a727563291a7159de935ffff2b99ee783928169f0fea7445370f
> +PYTHON_MUTAGEN_LICENSE = LGPLv2+

Yegor told you the license was GPLv2+, so why do you write LGPLv2+ here?

But in fact, Yegor was wrong I believe, the license is actually
just GPLv2, I haven't seen any "or later" statement anywhere.

So I fixed it as well, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
