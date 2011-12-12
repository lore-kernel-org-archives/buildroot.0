From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Dec 2011 13:26:41 +0100
Subject: [Buildroot] connman dowload failure
In-Reply-To: <20111212120653.GF4531@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 12 Dec 2011 14:06:53 +0200")
References: <20111212120653.GF4531@sapphire.tkos.co.il>
Message-ID: <87wra2t1q6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Hi Buildroot list,
 Baruch> I'm trying to build connman for my platform, but the build fails at the source 
 Baruch> download stage using both git and wget. This is the output of 'make V=1':

 >>>> connman 0.78 Downloading

 Baruch>  test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || (pushd /home/baruch/git/buildroot/output/dl > /dev/null && git clone clone --bare git://git.kernel.org/pub/scm/network/connman/connman.git connman-0.78 && pushd connman-0.78 > /dev/null && git clone archive --format=tar --prefix=connman-0.78/ 0.78 | gzip -c > /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz && popd > /dev/null && rm -rf /home/baruch/git/buildroot/output/dl/connman-0.78 && popd > /dev/null) && exit 

This is caused by cf71111b99ab951 (Cleanup the VCS commands
configuration). The BR2_GIT variable changed from "git clone" to just
"git". If you change that in your .config it should work again.

-- 
Bye, Peter Korsgaard
