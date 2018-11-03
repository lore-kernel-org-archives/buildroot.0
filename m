From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Nov 2018 23:30:27 +0100
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <CALtfCQbEUCmK5-NSi-UOFYySDbQ=ShueSXCZPC=HCQbGZTAHew@mail.gmail.com>
References: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
 <CANQCQpYkLV-XJBVqRsQLdrxthZzkqctsBcxfX4mJQqFY16jk5Q@mail.gmail.com>
 <f544829d-68ed-abfc-306c-ce3cebb1de3b@mind.be>
 <CANQCQpYAjzXTQBDjKwbMPnQViP0=Qfpr6+pgs_3e7iGOYfo50g@mail.gmail.com>
 <3232b003-ae5e-43d1-b795-f73a0ed71624@mind.be>
 <CANQCQpa-kkDU56c7vjVnw=EDFxVxda2PPNPWMPazzkdhJt1jCg@mail.gmail.com>
 <CALtfCQbVvZOwfmTx8nykn0h8JXsj_GeMiLK6f+OM+7fw0o7q+w@mail.gmail.com>
 <CANQCQpZFJG=9tG2ooLY5=vPpG_mGcztYDtgFPQiEynxvJA15Kg@mail.gmail.com>
 <CANQCQpa3Lqw5BZP251AV8Ets-N+TL5SGwfiVW9xTi3Utv9Z3ng@mail.gmail.com>
 <CALtfCQaMyoMXXn9S+BpuDR0kBS=Bn-xQsS2YfhHWYhUFyaMh-w@mail.gmail.com>
 <CALtfCQbEUCmK5-NSi-UOFYySDbQ=ShueSXCZPC=HCQbGZTAHew@mail.gmail.com>
Message-ID: <4f22bc8a-188f-2a4c-0bfb-9ebaf2d68bf8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/11/18 16:49, Oscar Gomez Fuente wrote:
> Hi Matthew,
> 
> 
> I was able to connect by VPN and check the new patch v4. Everything
> works fine on my Raspberry Pi 3B+:
> 
> # /etc/init.d/S49ntp stop
> Stopping ntpd: OK
> # date
> Sat Nov  3 15:41:17 UTC 2018
> # date --set "1970-02-01 10:10:10"
> Sun Feb  1 10:10:10 UTC 1970
> # date
> Sun Feb  1 10:10:11 UTC 1970
> # /etc/init.d/S48sntp start
> Starting sntp:
> sntp 4.2.8p12 at 1.3728-o Wed Oct 31 08:22:38 UTC 2018 (1)
> 1970-02-01 10:10:24.982820 (+0000) +1538544675.515026 +/-
> 1025696450.421369 pool.ntp.org 37.139.121.60 s2 no-leap
> OK
> # date
> Sat Nov  3 15:41:42 UTC 2018
> 
> But I don't how to do that:
> 
>>> ... provide your tested-by on that patch's email?
>>> https://patchwork.ozlabs.org/patch/992167/

 Just reply to the patch with this line in the mail:

Tested-by: Oscar Gomez Fuente <oscargomezf@gmail.com>

(now you don't need to do it anymore since I already did).

This gets picked up by Patchwork, so you can see in [1] that your tested-by line
has been added to the commit message.


 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/992167/mbox/
