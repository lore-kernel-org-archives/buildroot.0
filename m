From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 08:33:14 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
 5a6f6bfe885754955b615ca9353baa3496682c6f
In-Reply-To: <AANLkTi=Vv3zoN5NvFaEeu5TOK5hX6dTBe=S_tn7kFddo@mail.gmail.com>
References: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
	<20101213174444.3b328c36@surf>
	<AANLkTinqjw_EqtmNnj6+rTzHDFdoVov34aDTOo4VpkNQ@mail.gmail.com>
	<20101213205936.10a69e66@surf> <87d3p5i34o.fsf@macbook.be.48ers.dk>
	<AANLkTi=Vv3zoN5NvFaEeu5TOK5hX6dTBe=S_tn7kFddo@mail.gmail.com>
Message-ID: <20101214083314.314e6752@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Dec 2010 08:05:48 +0100
Belisko Marek <marek.belisko@gmail.com> wrote:

> I'm behind proxy and get this(try more times) :
> >>> mplayer 32710 Downloading
> svn: Can't connect to host 'svn.mplayerhq.hu': No route to host

We have to download mplayer from the Subversion repository, as this is
the only way to get a reasonably recent version of mplayer. They also
provide "snapshots", but only a single one, changing every day, which
is not acceptable for Buildroot. And their Subversion repository is not
accessible through http/https.

> --2010-12-14 08:01:36--
> http://sources.buildroot.net//mplayer-32710.tar.gz Resolving
> sources.buildroot.net... 88.198.64.109 Connecting to
> sources.buildroot.net|88.198.64.109|:80... connected. HTTP request
> sent, awaiting response... 404 Not Found 2010-12-14 08:01:36 ERROR
> 404: Not Found.

Here our download mechanism is going to the Buildroot mirror, but this
mirror is usually only updated after a release.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
