From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 10:13:30 +0100
Subject: [Buildroot] [PATCH] package/softether: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <5bc8de3d68584062a125116170628767@kontron.com> (Heiko Thiery's
 message of "Sun, 27 Oct 2019 07:55:26 +0000")
References: <20191027063929.14361-1-matthew.weber@rockwellcollins.com>
 <5bc8de3d68584062a125116170628767@kontron.com>
Message-ID: <87k18qk0ud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <Heiko.Thiery@kontron.com> writes:

 > utils/test-pkg -k -p softether fails
 > ERROR: No hash found for pru-software-support-5.1.0.tar.gz
 > make: *** [package/pkg-generic.mk:146:
 > /home/hthiery/br-test-pkg/br-arm-full/build/host-pru-software-support-5.1.0/.stamp_downloaded]
 > Fehler 1

 > I think the problem is when <pkg>_SOURCE is not explicitly specified
 > it will be generated with the $(VERSION) without the 'v' that does not
 > match the filename in the hash file.

Indeed. Matt, will you fix up the .hash files of all of these and
resend? In the mean time I will mark these as changes requested.

-- 
Bye, Peter Korsgaard
