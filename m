From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 11:32:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-26
In-Reply-To: <20140527063007.C907B100BA4@stock.ovh.net> (Thomas Petazzoni's
 message of "Tue, 27 May 2014 08:30:07 +0200 (CEST)")
References: <20140527063007.C907B100BA4@stock.ovh.net>
Message-ID: <87ioorefdf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2014-05-26
 > ===============================

 >         success : 114
 >        failures : 9  
 >        timeouts : 0  
 >           TOTAL : 123

 > Classification of failures by reason
 > ====================================

 >                  mplayer-1.1.1 | 1 
 >            host-gdb-arc-4.8-R3 | 1 
 >                   midori-0.4.6 | 1 
 >     xserver_xorg-server-1.15.1 | 1 
 >                   python-2.7.6 | 1 
 >                    slang-2.2.4 | 1 
 >                       gdb-6.6a | 1 
 > host-gdb-6be65fb56ea6694a92... | 1 
 > dvb-apps-3d43b280298c39a67d... | 1 

 > Detail of failures
 > ===================

 >     mipsel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/4b56b89dd0ccd3b7e4017782e8d48b9c71207ff7/

Fixed by http://git.buildroot.net/buildroot/commit/?id=6b7719f9642fed0de5052b05eff28ec00be67caa

 >       bfin |                       gdb-6.6a | NOK | http://autobuild.buildroot.net/results/3e2b733758651f7a168832de2d3b34afc171609d/

Fixed by http://git.buildroot.net/buildroot/commit/?id=a3f18230402224c3f696d7f0336d7066acc2c508

 > microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/16d4a83eb1e1b9d65641de47f2a2bc5d8ab18bdd/
 >        arc |            host-gdb-arc-4.8-R3 | NOK | http://autobuild.buildroot.net/results/df64fe6e834f016267f522f089e00a08b1fd893e/

Both fixed by http://git.buildroot.net/buildroot/commit/?id=ffd243c6527250c488a83ee22460416e167be7dd

 >        arm |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/d48b68dd6a43fa9a224237e8f458ca8987a3d7b4/

Fixed by http://git.buildroot.net/buildroot/commit/?id=8ca6a6fff28ebee0c8ed3a8234f2923c4af938e5


 >        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a5494f6560125f7ba4f70db18e15e582c17d1b57/

The handwritten configure script leaves temporary files around in
/tmp. Thomas has cleaned up the build server for now.

 >        arm |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/ebaae4009d7ef26b3db9b1c4bf94199366f0e5a2/

Mix of --static and -export-dynamic. Perhaps python should depend on
!BR2_PREFER_STATIC_LIB?

 >       bfin |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/dbce9e591466717d9c87f42b5f192d8fd1be0475/

Fixed by http://git.buildroot.net/buildroot/commit/?id=fcff0d9cd0d077a35aab4250060a3362678ad2ac

 >     x86_64 |     xserver_xorg-server-1.15.1 | NOK | http://autobuild.buildroot.net/results/11ece737078ca8da2fee4249432148675b4e630e/

Looks like a race condition.

-- 
Bye, Peter Korsgaard
