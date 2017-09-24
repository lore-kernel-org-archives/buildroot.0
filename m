From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 09:03:33 +0200
Subject: [Buildroot] [PATCHv2 1/1] openjpeg: Fix malloc poison issue
In-Reply-To: <20170908075217.4900-1-olivier.schonken@gmail.com> (Olivier
 Schonken's message of "Fri, 8 Sep 2017 09:52:17 +0200")
References: <20170908075217.4900-1-olivier.schonken@gmail.com>
Message-ID: <87zi9klgsa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 > The malloc poison issue has been fixed upstream, this patch will thus only
 > be temporary.

 > Fixes the following autobuild issues

 >        sparc | http://autobuild.buildroot.net/results/c1b7a316ca2a4db49023f304dbc7fd5fed05bd9d
 >         bfin | http://autobuild.buildroot.net/results/031ece7a72e76a9155938cb283de859bd12a8171
 >          sh4 | http://autobuild.buildroot.net/results/88664451f71c12ccd94e874d408fbb680bea1695
 >       xtensa | http://autobuild.buildroot.net/results/fbede64a5a86d4868b6da0ab1275e75803235af0
 >      powerpc | http://autobuild.buildroot.net/results/6c641650509048039b18fbeb010dbca0f0fc5292
 > microblazeel | http://autobuild.buildroot.net/results/fa2d5272b2db73cbfa441ead9250157c5626ab15
 >     mips64el | http://autobuild.buildroot.net/results/fc96f6628f71e05d9a74e0e13e50178d29a2c495
 >          sh4 | http://autobuild.buildroot.net/results/a6d6a6dcb9b4fa250edaaf5935762c5820457b23
 >       x86_64 | http://autobuild.buildroot.net/results/47b4ca2cc661582d86830b9353a6c8af86e4ba35
 >          arc | http://autobuild.buildroot.net/results/08e2e4eca6c3dbde8116a649dbf46e52ded45d10
 >          arc | http://autobuild.buildroot.net/results/899fa044aab7ee28acfa71544f2105da4a5c97d5
 >          arm | http://autobuild.buildroot.net/results/6016f6885b21d6e8c6199a6833c7acce6210ecc6
 >          arm | http://autobuild.buildroot.net/results/adbb3c76497e89161535c711de98809a0fa168a7
 >         or1k | http://autobuild.buildroot.net/results/de3ef69a72d2c2082e202fbed702c53a51274fef
 >     mips64el | http://autobuild.buildroot.net/results/39b186b13001a810e0992b52321f1015b445d2fd
 >       x86_64 | http://autobuild.buildroot.net/results/22c6a29a1ded6aedf01adfdfcf26302248dba80c
 >          arm | http://autobuild.buildroot.net/results/b62c54b727eb5f576c4a517a69c495b537c3b69a
 >         m68k | http://autobuild.buildroot.net/results/a826561c5786be5f0088b50b633210593e23ffff
 >          arm | http://autobuild.buildroot.net/results/d32ec927a5e4d5644cb3641014bcf6ebe5c14490

 > Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 > ---
 > Fix malloc poison issue to remove all uclibc related error from autobuild.
 > Will investigate threads and C++ issue further with less autobuild failures

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
