From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 06:59:13 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: fix missing libraries
In-Reply-To: <20200413155127.763bbdcc@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 13 Apr 2020 15:51:27 +0200")
References: <20190923115206.4468-1-stephan.hoffmann@ext.grandcentrix.net>
 <20200413155127.763bbdcc@windsurf.home>
Message-ID: <87h7wthd5q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 23 Sep 2019 13:52:06 +0200
 > <stephan.hoffmann@ext.grandcentrix.net> wrote:

 >> From: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
 >> 
 >> libparson.so and libumqtt.so.1 are missing.
 >> 
 >> The package builds libparson, but does not install it.
 >> It also does not install the symlinks for libumqtt.so.1.1.11.
 >> 
 >> Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
 >> ---
 >> package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 24 +++++++++++++++++-----
 >> 1 file changed, 19 insertions(+), 5 deletions(-)

 > So I finally applied this, but after doing quite a bit of rework. For
 > example, your patch was not correct as it was creating the .so symlinks
 > unconditionally, even when BR2_STATIC_LIBS=y, i.e even when static
 > libraries are used. Another issue is that you were reformatting the
 > list of libraries to have one per-line, in the same patch. And you were
 > fixing the libparson and libumqtt issues in the same patch.

 > So, I first applied three preparation commits:

 >   https://git.buildroot.org/buildroot/commit/?id=c71030f0fab49be4061fb999a8eabe4190f1f18d
 >   https://git.buildroot.org/buildroot/commit/?id=59de11b0476699ddeb2cbcd30a524b849249956a
 >   https://git.buildroot.org/buildroot/commit/?id=43822bb6db8851df4d6568622b58196895028f91

 > Then, I applied your fix for libumqtt.so:

 >   https://git.buildroot.org/buildroot/commit/?id=570dd0c31b2149cd913866eb6777caa4a1b05a56

 > And your fix for libparson.so:

 >   https://git.buildroot.org/buildroot/commit/?id=94120fd7c71881e7b3963d5db27802241d9eeed2

The same set of commits have now been cherry-picked for 2020.02.x,
thanks!

-- 
Bye, Peter Korsgaard
