From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 09:44:33 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 30 Jul 2016 23:23:22 +0200")
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <87twf6s13y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> microblazeel | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/4dbb88b8d0fd83f3a44d0daff6a7fffebd235317/
 >> xtensa | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/86b6577acffdb27cbb4015fd00e9295df7de9409/
 >> arm | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/06e1e3ee4ff9e2b883fd2ad45c0a3229b1212fae/
 >> powerpc | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/9855efe0ce46ce62bd488a96a185cd0cd2479734/
 >> microblazeel | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/96748cbceef475afc2a22a2a87dfdddfbf620f9a/

 > evtable_SW.inc:17:1: error: array index in initializer exceeds array bounds
 >  EV_MAP(SW_PEN_INSERTED),
 >  ^

 > Peter, you contributed this package, so your turn to look into this :-)

It got broken with 4.7 kernel headers as it uses the wrong array size
macros. I'll send a fix.

-- 
Venlig hilsen,
Peter Korsgaard 
