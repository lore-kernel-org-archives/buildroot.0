From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 15 Jan 2014 12:46:15 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-13
In-Reply-To: <20140114073009.D944B10264B@stock.ovh.net>
References: <20140114073009.D944B10264B@stock.ovh.net>
Message-ID: <CAFOYHZB+FECgTWX1aa2cSDQMHSS83f8Ri7yOj7H+nZyY6Lr_kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Tue, Jan 14, 2014 at 8:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>        arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/54b739bd3713de87113cbed35e05b9074282b30d/
>        arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/

I have tried to reproduce both of these build configs. The first one
fails for me with an unrelated error ( /usr/X11R6/lib in chroot .: No
such file or directory). The second one succeeds. Am I doing something
wrong?

  git checkout `curl
http://autobuild.buildroot.net/results/fec/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/gitid`
  curl http://autobuild.buildroot.net/results/fec/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/config
| sed 's|/home/test/||' > .config
  make
