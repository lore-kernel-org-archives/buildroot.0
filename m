From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 1 Oct 2013 16:08:30 +0800
Subject: [Buildroot] [PATCH 1/2] logrotate: nees mmu
In-Reply-To: <20131001093249.6a135a15@skate>
References: <1380594702.9353.1.camel@phoenix> <20131001093249.6a135a15@skate>
Message-ID: <CAFRkauCMd5+Ce+_Y8uOEJLmRbZwYDUdvuxHz-8ATdzVC1TZyWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Axel Lin,
>
> On Tue, 01 Oct 2013 10:31:42 +0800, Axel Lin wrote:
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>> Fix below build error:
>>
>> logrotate.o: In function `switch_user_permanently':
>> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:129: undefined reference to `fork'
>> logrotate.o: In function `removeLogFile':
>> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:431: undefined reference to `fork'
>> logrotate.o: In function `mailLog':
>> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:597: undefined reference to `fork'
>> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:615: undefined reference to `fork'
>> logrotate.o: In function `compressLogFile':
>> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:533: undefined reference to `fork'
>> collect2: ld returned 1 exit status
>> make[1]: *** [logrotate] Error 1
>
> It's a minor comment, but I believe the log of the error could go
> within the commit log itself (i.e, before the --- separator). It really
> is part of the explanation of why the change is needed.
>
> Note that there is no need to resend this patch just for this reason,
> it was merely a suggestion for future patches.

Actually, I check git log before sending patches.
Some commit log includes a link to the autobuild build log.
But I don't find any commit log with build error so I didn't include the
build error messages.
I just add the error messages here to make it easier for review.

Anyway, I will include the error message in commit log next time I send a patch.

Regards,
Axel
