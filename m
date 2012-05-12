From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 16:30:52 +0200
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <CADiAo4KofjL+kb8RLbWRwHauYpgqtWefLi_4QwV50sMgf-M+VA@mail.gmail.com>
References: <1336560101-29035-1-git-send-email-golubovsky@gmail.com>
 <4FAD9523.3020501@mind.be>
 <CADiAo4KofjL+kb8RLbWRwHauYpgqtWefLi_4QwV50sMgf-M+VA@mail.gmail.com>
Message-ID: <4FAE741C.7090104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 07:01, Dmitry Golubovsky wrote:
> Arnout,
>
> On Fri, May 11, 2012 at 6:39 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
[snip]
>>   When you use GENTARGETS, you must also specify the install commands.
>
> And if I don't then standard "cd $(@D); make install" or anything
> similar will be used? Somehow it works without explicit install
> command specification.

  No, with GENTARGETS the install commands are empty by default.  Or you sure
it's not the old binary from a previous compilation that you see in your
target dir?

  I tried it with a clean build and there's no v86d or testvbe in the target
dir.


>> However, you can probably keep using AUTOTARGETS.  Even when you use
>> AUTOTARGETS, it is possible to override the CONFIGURE_CMDS and BUILD_CMDS.
>
> Due to the way v86d configure is written GENTARGETS seems to be more
> proper - I got convinced.

  The non-existent MAKETARGETS would be even better :-)


>> But you don't even need to override the BUILD_CMDS.  Instead, you can
>> pass additional options to the MAKE call, by defining
>>
>> V86D_MAKE_OPT += CC="$(TARGET_CC) -D__i386__"
>
> What I have in the patch I provided, was tested build-wise on i386 and
> x86-64 targets (but the program itself was only tested in 32bit mode).
> I tried that Thomas suggested (redefine CFLAGS), it did not work. I
> don't see much sense in changing the working command from what is in
> my patch.

  Sure, it's OK as it is (except for the install target of course).
Merely pointing out an alternative.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
