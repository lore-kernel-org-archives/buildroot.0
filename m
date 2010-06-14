From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jun 2010 11:26:53 +0200
Subject: [Buildroot] [PATCH 3/4] ffmpeg: allow customization of codecs,
	(de)muxers and other components
In-Reply-To: <L3ZXW6$DC1420A5D64F3A5EE742F2128E2CC026@aruba.it> (Luca
	Ceresoli's message of "Mon, 14 Jun 2010 10:50:30 +0200")
References: <L3ZXW6$DC1420A5D64F3A5EE742F2128E2CC026@aruba.it>
Message-ID: <877hm2ezhe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 Luca> +ifneq ($(BR2_PACKAGE_FFMPEG_DECODERS),"all")
 >> 
 >> I would suggest you use qstrip + strip here as well, so it doesn't break if the
 >> user accidently added extra spaces or so.

 Luca> How can foreach break with extra spaces? I've been trying things as:
 >> BR2_PACKAGE_FFMPEG_ENCODERS="   vorbis    flac  "
 Luca> and they work ok.

Not the foreach, but the ifneq (....,"all") would break if the user
ended up setting it to "all " or " all" or similar.

-- 
Bye, Peter Korsgaard
