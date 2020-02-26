From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:32:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 244.3
In-Reply-To: <20200225225651.548205-1-aduskett@gmail.com> (aduskett's message
 of "Tue, 25 Feb 2020 14:56:51 -0800")
References: <20200225225651.548205-1-aduskett@gmail.com>
Message-ID: <87d0a174ae.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 >  package/systemd/systemd.hash | 2 +-
 >  package/systemd/systemd.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
 > index 5d3a8e83b1..33ae7183a2 100644
 > --- a/package/systemd/systemd.hash
 > +++ b/package/systemd/systemd.hash
 > @@ -1,5 +1,5 @@
 >  # sha256 locally computed
 > -sha256	06e604e5484ec03ff763ae680c8b52c33fedcce95a773944f27816fde68503d7	systemd-244.1.tar.gz
 > +sha256	e6b463733da5eb37075352a64112d030b8612935a54e5b3468279a4f15a4cec4	systemd-244.3.tar.gz
 >  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 >  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 >  sha256	ca008b0178b6390e874f6e4a890fbed482b0fb946159a3b1d370bd8d2327d9bc	README

You clearly didn't run 'make systemd-legal':

>>> systemd 244.3 Collecting legal info
LICENSE.GPL2: OK (sha256: ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6)
LICENSE.LGPL2.1: OK (sha256: dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551)
ERROR: README has wrong sha256 hash:
ERROR: expected: ca008b0178b6390e874f6e4a890fbed482b0fb946159a3b1d370bd8d2327d9bc
ERROR: got     : f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make[1]: *** [package/systemd/systemd.mk:588: systemd-legal-info] Error 1

Fixed that up, but please take care in the future.

-- 
Bye, Peter Korsgaard
