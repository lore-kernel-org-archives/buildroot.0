From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 19 Jun 2012 14:20:16 +0200
Subject: [Buildroot] New package
In-Reply-To: <20120618085754.5a6fb1b8@skate>
References: <CAFYZmWjqLdemKVbdGQ=s2WGNGjtpVF1hvfpmqFeaQShyUokRzA@mail.gmail.com>
 <20120618085754.5a6fb1b8@skate>
Message-ID: <CAHQn0kiM__pOsi3MXC58JW0hFQHX-rj-P-1LZ05o3fRBrGL70A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 18, 2012 at 8:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sun, 17 Jun 2012 22:51:59 -0300,
> "djames.suhanko" <djames.suhanko@gmail.com> a ?crit :
>
>> BAR_SITE =
>> http://sourceforge.net/projects/clpbar/files/clpbar/bar-1.10.9/bar_1.10.9.tar.gz/download
>
>> The compilation is OK, but the automatic download from sourceforge isn't
>> working. How can I do the automatic download from sourceforge?
>
> This BAR_SITE will not work. Getting the correct URLs from SourceForge
> is a bit funky. Tip: download from Firefox, and in the downloads
> window, right click on the file, and ask Firefox for the original
> location of the file. It will be:
>
> http://kent.dl.sourceforge.net/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz
>
> So, you should use:
>
> BAR_SITE = http://$(BR2_SOURCEFORGE_MIRROR)/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz

I think it's even:
BAR_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz
