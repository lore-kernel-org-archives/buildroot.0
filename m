From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Apr 2015 22:17:38 +0200
Subject: [Buildroot] [PATCH] ffmpeg: explicitly pass --ranlib
References: <1429214355-29429-1-git-send-email-arnout@mind.be>
Message-ID: <XnsA47EE2C9972B5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> 
wrote in news:1429214355-29429-1-git-send-email-arnout at mind.be:

> +     --ranlib=$(TARGET_RANLIB) \

Hi,

are you sure that your patch changes the behaviour of
http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=configure;h=c11262a66c5ce8906f1a06bb54de3ab1e964dfb0;hb
=HEAD#l2760

when testing ranlib features?
I am asking this because the configure options are stored into script 
variables in line 3019[1], whereas the ranlib test occurs in line 2760 
already.

Regards, Bernd

[1] http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=configure;h=c11262a66c5ce8906f1a06bb54de3ab1e964dfb0;hb
=HEAD#l3019
