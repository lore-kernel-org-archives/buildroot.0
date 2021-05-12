From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 20:55:00 +0200
Subject: [Buildroot] [git commit] boot/opensbi: unconditionally disable
 SSP
In-Reply-To: <CAOCHtYhAabRzQMEfLpY=mMOuazHeP-b6WmmXTcTLLnG+5KeqMw@mail.gmail.com>
 (Robert Nelson's message of "Wed, 12 May 2021 07:45:17 -0500")
References: <20210512081101.8F1A286DD7@busybox.osuosl.org>
 <CAOCHtYhAabRzQMEfLpY=mMOuazHeP-b6WmmXTcTLLnG+5KeqMw@mail.gmail.com>
Message-ID: <87o8dfkcjf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Nelson <robertcnelson@gmail.com> writes:

Hi,

 > Just a heads up, our BeagleBoard.org CI triggered a build failure
 > after this commit last night..

 > ```
 > make distclean
 > make beaglev_defconfig
 > make -j8
 > ```

 > /mnt/storage/var/lib/jenkins/workspace/buildroot_beaglev_defconfig/output/build/opensbi-custom
 >   -xf -
 >>>> opensbi custom Patching

 > Applying 0001-Makefile-Don-t-specify-mabi-or-march.patch using patch:
 > patching file Makefile
 > Hunk #1 succeeded at 206 with fuzz 1 (offset 61 lines).
 > Hunk #2 succeeded at 219 with fuzz 1 (offset 62 lines).

 > Applying 0002-Makefile-unconditionally-disable-SSP.patch using patch:
 > patching file Makefile
 > Hunk #1 succeeded at 203 with fuzz 1.
 > Hunk #2 FAILED at 217.
 > Hunk #3 succeeded at 234 (offset -2 lines).
 > 1 out of 3 hunks FAILED -- saving rejects to file Makefile.rej
 > make: *** [package/pkg-generic.mk:209:

Ahh, that was what I was afraid of. I've sent a series to fix it:

https://patchwork.ozlabs.org/project/buildroot/list/?series=243398

In fact I did test beaglev_defconfig after adding
0002-Makefile-unconditionally-disable-SSP.patch using patch, but looking
back in my shell history I see I tested in a tree where the above series
is applied.

I'll get it fixed.

-- 
Bye, Peter Korsgaard
