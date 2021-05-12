From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 12 May 2021 14:29:38 -0500
Subject: [Buildroot] [git commit] boot/opensbi: unconditionally disable
 SSP
In-Reply-To: <87o8dfkcjf.fsf@dell.be.48ers.dk>
References: <20210512081101.8F1A286DD7@busybox.osuosl.org>
 <CAOCHtYhAabRzQMEfLpY=mMOuazHeP-b6WmmXTcTLLnG+5KeqMw@mail.gmail.com>
 <87o8dfkcjf.fsf@dell.be.48ers.dk>
Message-ID: <CAOCHtYjRzPPduopHqBZ5W9V+FWCeq5_5oY3CfRrZ1_-=jM4_7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  >>>> opensbi custom Patching
>
>  > Applying 0001-Makefile-Don-t-specify-mabi-or-march.patch using patch:
>  > patching file Makefile
>  > Hunk #1 succeeded at 206 with fuzz 1 (offset 61 lines).
>  > Hunk #2 succeeded at 219 with fuzz 1 (offset 62 lines).
>
>  > Applying 0002-Makefile-unconditionally-disable-SSP.patch using patch:
>  > patching file Makefile
>  > Hunk #1 succeeded at 203 with fuzz 1.
>  > Hunk #2 FAILED at 217.
>  > Hunk #3 succeeded at 234 (offset -2 lines).
>  > 1 out of 3 hunks FAILED -- saving rejects to file Makefile.rej
>  > make: *** [package/pkg-generic.mk:209:
>
> Ahh, that was what I was afraid of. I've sent a series to fix it:
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=243398
>
> In fact I did test beaglev_defconfig after adding
> 0002-Makefile-unconditionally-disable-SSP.patch using patch, but looking
> back in my shell history I see I tested in a tree where the above series
> is applied.
>
> I'll get it fixed.

Awesome Peter!  Sorry i missed that on the mailing list:

Everything looks good after that commit

Build Log
http://gfnd.rcn-ee.org:8080/view/BeagleBoard/job/buildroot_beaglev_defconfig/8/consoleText

Build branch:
https://github.com/beagleboard/buildroot/tree/fixes-243398-opensbi

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
