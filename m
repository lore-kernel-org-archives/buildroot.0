From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Feb 2013 17:34:06 +0100
Subject: [Buildroot] Errors about BX when building toolchain under
	latest buildroot
In-Reply-To: <CAJXWAww+geVHWFvn4dy+HaFs0P8vNtHX11xCVUo5tCvAvEx1Pw@mail.gmail.com>
 (hayate's message of "Sun, 3 Feb 2013 23:13:18 +0800")
References: <CAJXWAww+geVHWFvn4dy+HaFs0P8vNtHX11xCVUo5tCvAvEx1Pw@mail.gmail.com>
Message-ID: <87obg14arl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hayate" == hayate  <hayatelee@gmail.com> writes:

 hayate> Hi,
 hayate> Latest buildroot?buildroot-2012.11.1
 hayate> choose: arm-LittleEndian, generic arm, OABI, gcc 4.6.3, uClibc-0.9.33.1

 hayate> Others are unchanged

 hayate> Then encounter errors saying that BX is not available on the
 hayate> target processor

 hayate> However changing to uClibc from 0.9.33 to 0.9.31 makes building
 hayate> successful.

 hayate> Is this a bug? Should that USE_BX or 0.9.33 be disabled when
 hayate> selecting generic arm?

Yes, sounds like a bug. Ancient ARM variants didn't have the BX
instruction, so we should fixup uclibc.mk to enable/disable USE_BX
depending on if the variant has it.

-- 
Bye, Peter Korsgaard
