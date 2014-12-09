From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:16:43 +0100
Subject: [Buildroot] [PATCH 6/6] package/mpd: enable OSS support
In-Reply-To: <1418078694-26331-6-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
 <1418078694-26331-6-git-send-email-jkrause@posteo.de>
Message-ID: <20141209201643.0c091f4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon,  8 Dec 2014 23:44:54 +0100, J?rg Krause wrote:
> Add support for the OSS (Open Sound System).
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Applied, after adjusting the commit title: the commit is not enabling
OSS support, it's adding an option to enable or disable the OSS
support. And in practice it actually disables it: it was enabled by
default by the mpd configure.ac script, unless --disable-oss is passed.
Now that we have the option which defaults to not enabled, the OSS
support will be disabled by default. I believe this is good as on most
Linux systems, ALSA is now used for audio, and OSS is deprecated.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
