From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Feb 2018 21:15:19 -0600
Subject: [Buildroot] [PATH for-next] package/htop: remove 0xe2 from
 MetersPanel.c
In-Reply-To: <20180220222025.3202-1-romain.naour@gmail.com>
References: <20180220222025.3202-1-romain.naour@gmail.com>
Message-ID: <CANQCQpaOCezT4-fZGuJjUkpTZoo=gYtAETfG4EfwwKa1kj4SvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Tue, Feb 20, 2018 at 4:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
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
>
> I just looked what changed recently in htop and this commit looks
> suspicious:
> https://github.com/hishamhm/htop/commit/0108117d0b4f1e822f434db173e976aac20b26b5
>

I setup a build with that failing config but noticed when I directly
(make clean htop) built htop that it didn't fail.  I've kicked off a
full build to see if the host python build order is playing todo this.

Matt
