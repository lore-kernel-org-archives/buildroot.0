From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 23:20:08 +0100
Subject: [Buildroot] [PATH for-next] package/htop: remove 0xe2 from
 MetersPanel.c
In-Reply-To: <20180220222025.3202-1-romain.naour@gmail.com>
References: <20180220222025.3202-1-romain.naour@gmail.com>
Message-ID: <20180225232008.04986f15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Feb 2018 23:20:25 +0100, Romain Naour wrote:
> This non ascii character trigger an issue with MakeHeader.py.
> 
> ./scripts/MakeHeader.py MetersPanel.c
> Traceback (most recent call last):
>   File "./scripts/MakeHeader.py", line 32, in <module>
>     for line in file.readlines():
>   File "[...]/output/host/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 956: ordinal not in range(128)
> 
> Fixes:
> http://autobuild.buildroot.net/results/8ed/8edb78b054a265447fd0e83f67cba5f978be4ed6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Matt, can you test on "U16.04 Bacon" autobuilder ? I can't reproduce here.

I do agree with Arnout that a better fix would be nice, but in the mean
time, I applied your patch to the next branch (after initially screwing
up and applying it to the master branch).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
