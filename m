From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 09:23:57 +0200
Subject: [Buildroot] The aarch64 glibc failure
In-Reply-To: <20140506063010.AD7E9101299@stock.ovh.net>
References: <20140506063010.AD7E9101299@stock.ovh.net>
Message-ID: <20140506092357.000b7903@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 May 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:

>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/ff63f70812eb8ab3ceae4efc8754865479ac1a27/
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/dd04d058bb26343c9dfded76608929942d83db5a/
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/4244da86604fbe1e51da2e7269bd373e8940a178/
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/65471a371199f79a60f3a8b881cdf2bdac633336/
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/7a828d00f062d33f3fd9df0be6e00f0c4e2459b7/

So, I tried to reproduce dd04d058bb26343c9dfded76608929942d83db5a on
the build server (the exact same build server)... and the build worked
fine. So it would look like a spurious build issue. Except that
according to http://autobuild.buildroot.org/?arch=aarch64, all aarch64
builds since April 24th have failed because of this.

I was thinking that maybe the problem would have been solved by the
switch from the old build server to the new one. But the latest builds
are clearly done at date/times that indicate they were done on the new
build server (on which I did the test build which was successful).

So for now, I'm a bit unsure on how to attack this problem. I believe
I'll let the build runs for a little more, and see if it continues to
happen again.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
