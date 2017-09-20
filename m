From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Sep 2017 20:29:21 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
 <87fubhxnnx.fsf@dell.be.48ers.dk>
 <CANQCQpa9S7chHUTg1GBNz9Qi=r-tMeQnQO2sYpNdZ7oQ+9MP9w@mail.gmail.com>
Message-ID: <1loa9exfa8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 20 Sep 2017 13:03:32 -0500 schrieb Matthew Weber:

> All,
> 
> On Wed, Sep 20, 2017 at 12:52 PM, Peter Korsgaard
> <peter@korsgaard.com> wrote:
>>>>>>> "Bernd" == Bernd Kuhls
>>>>>>> <bernd.kuhls@t-online.de> writes:
>>
>>  > It seems github now sometimes provides slightly changed tarballs
>>  > which produce a different sha256 hash than before. Fix the hashes of
>>  > the affected packages to avoid downloading from
>>  > sources.buildroot.net.
>>
>>  > Signed-off-by: Bernd Kuhls
>>  > <bernd.kuhls@t-online.de>
>>
>> :/
>>
>> I'm not sure updating the hashes is the correct thing to do.
>> Sources.b.o runs 'make source' from the 2017.02.x and master branches
>> to keep it uptodate, and E.G. freerdp hasn't been updated since
>> 2017.02, so it will break hard for 2017.02.x users if we change it.
>>
>> Falling back to s.b.o is not such a bad thing, so I think we can wait
>> with fixing up the hashes until the packages get bumped.
>>
>> In the mean time I will try to figure out who to contact at github to
>> ask about the change.
>>
>>
> I'd second it would be better to wait.  The iperf hash issue earlier
> this summer created a mess until that was bumped.

Hi,

I do not see a perfect solution for this problem, the fallback to s.b.o. 
will not circumvent download failures because it does not provide source 
tarballs for all packages:

$ LC_ALL=C wget sources.buildroot.org/kodi-17.4-Krypton.tar.gz
--2017-09-20 20:23:27--  http://sources.buildroot.org/kodi-17.4-
Krypton.tar.gz
Resolving sources.buildroot.org (sources.buildroot.org)... 176.9.16.109
Connecting to sources.buildroot.org (sources.buildroot.org)|
176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-09-20 20:23:27 ERROR 404: Not Found.

Not committing this patch means that downloading the kodi package will 
always fail. Otoh I recognize the mess for the lts versions...

Additionally not all users are using
BR2_BACKUP_SITE="http://sources.buildroot.net"
in their setup, I normally deactivate this option to save bandwidth and 
to be informed when upstream did changes to its website.

Regards, Bernd
