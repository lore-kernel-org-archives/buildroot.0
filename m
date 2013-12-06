From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 5 Dec 2013 20:14:13 -0500
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <20131205233131.0cad979d@skate>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
 <1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
 <20131204094419.6d4d4279@skate> <529EFEBA.8040103@zacarias.com.ar>
 <20131204133306.7e7e8e07@skate> <529F24A4.6030005@zacarias.com.ar>
 <52A0BCBC.5000008@mind.be> <20131205233131.0cad979d@skate>
Message-ID: <CA+-urNQEcvSey5BhuK0dJhGe07YWk65pmq2Ar4212UMq=ockdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 5, 2013 at 5:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 05 Dec 2013 18:49:48 +0100, Arnout Vandecappelle wrote:
>
>> >> Yes, I agree, the user mode emulation should probably be removed. It
>> >> simply cannot work properly, because we have no way of guaranteeing
>> >> that the kernel headers used for the target toolchain are older than
>> >> the kernel running on the system.
>>
>>   It's not possible to do it in Config.in, but it's easy to do during the
>> build: compare /usr/include/linux/version.h with
>> $(STAGING_DIR)/usr/include/linux/version.h
>
> And then you fail the build if
> $(STAGING_DIR)/usr/include/linux/version.h gives a newer version
> of /usr/include/linux/version.h ? Could be possible, even if not really
> nice. But Fran?ois is proposing to remove cpanminus, which was the only
> reason to have qemu-user support. So do we care?

I care a little (for as much as that counts), but not enough to argue
for keeping it if it is becoming a pain. We use qemu-user in a
post-build step to run a battery of regression tests on algorithmic
code. It has been convenient since the regression test data is too
large to run in one pass on the target hardware. It's also faster to
run on our PCs. I don't think that the regression tests exercise any
of the issues above.

Frank
