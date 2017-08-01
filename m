From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 19:14:38 +0200
Subject: [Buildroot] [PATCH] python-hpack: fix build breakage due to
 UTF-8 formatted file
In-Reply-To: <20170801082013.31668-1-yegorslists@googlemail.com>
References: <20170801082013.31668-1-yegorslists@googlemail.com>
Message-ID: <20170801191438.3e19b6fd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Aug 2017 10:20:13 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> UTF-8 formatted file breaks installations on some systems:
> 
> Traceback (most recent call last):
>   File "setup.py", line 34, in <module>
>     long_description=open('README.rst').read() + '\n\n' + open('HISTORY.rst').read(),
>   File "/home/peko/autobuild/instance-1/output/target/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 1125: ordinal not in range(128)
> 
> This patch replaces '?' with 'S' meaning 'Section' and hence converts file to plain ASCII.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...rt-HISTORY.rst-from-UTF-8-format-to-ASCII.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch

Applied to master, after adding a reference to the autobuilder failure
being fixed, as discussed on IRC earlier today.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
