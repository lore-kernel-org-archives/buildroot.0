From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Feb 2019 23:47:21 -0200
Subject: [Buildroot] [PATCH v5 02/10] testing/infra: split runtime test
 from BRTest
References: <CANQCQpbtW+uTx1pq4QNwwZWtNHU4eP57q6Y0j2ZGkKtb70NDdw@mail.gmail.com>
Message-ID: <5c58eb29e393e_51af3facae0bdbd8944c8@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Feb 04, 2019 at 11:12 PM, Matthew Weber wrote:

> On Mon, Feb 4, 2019 at 7:00 PM Ricardo Martincoski wrote:
[snip]
>> The download test cases do not need to build anything before they run, so by
>> splitting the two classes and making test_git to inherit from the new BRTest
>> instead of RuntimeTestBase makes the download test cases to run really fast.
>> The two test cases already on master, after applying and refreshing this patch,
>> run in 35 seconds total in my machine.
>> Less than 2 minutes each in the Gitlab CI auto-scale runners:
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/156194310
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/156194313
> 
> If I understand correctly those are the only two at this point that
> should use the BRTest class instead of the RuntimeTestBase, right?

Right.

> 
>> Unfortunately there is still some problem in my WIP refresh of the patch, so I
>> can't send it now.
>>
>> >
>> >  If you do so before Wednesday, we might still apply it.
>>
>> Unfortunately it's unlikely I can do in time.
>>
> 
> I might be in the same situation after looking at the build failures.

No problem. We can do it later. Thank you for looking into this.

> I'll spend a bit more on it tonight but there are a lot of tests to
> either spot check or run all.  I'm not sure yet if it is my build
> machine's OS and python version or qemu at this point.

I found myself in this situation a few times in the past :-)
You can also download the docker image and run the test cases inside it.


Regards,
Ricardo
