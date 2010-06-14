From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jun 2010 13:25:27 +0200
Subject: [Buildroot] [PATCH 3/4] ffmpeg: allow customization of codecs,
	(de)muxers and other components
In-Reply-To: <L40153$4B4F2698302B94CA4D89952637FD93F6@aruba.it> (Luca
	Ceresoli's message of "Mon, 14 Jun 2010 12:00:39 +0200")
References: <L40153$4B4F2698302B94CA4D89952637FD93F6@aruba.it>
Message-ID: <8739wpg8k8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 >> Not the foreach, but the ifneq (....,"all") would break if the user
 >> ended up setting it to "all " or " all" or similar.

 Luca> Sorry, now I got what you mean.

 Luca> Why do you say qstrip+strip anyway? qstrip does strip itself:

Ahh yes, then just qstrip.

 Luca> So I would do:
 Luca> -ifneq ($(BR2_PACKAGE_FFMPEG_ENCODERS),"all")
 Luca> +ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),all)

 Luca> If that's ok, it will be in the re-submitted patches.

Yes please.

-- 
Bye, Peter Korsgaard
