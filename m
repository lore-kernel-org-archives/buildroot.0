From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Sat, 3 Nov 2018 16:49:10 +0100
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <CALtfCQaMyoMXXn9S+BpuDR0kBS=Bn-xQsS2YfhHWYhUFyaMh-w@mail.gmail.com>
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
Message-ID: <CALtfCQbEUCmK5-NSi-UOFYySDbQ=ShueSXCZPC=HCQbGZTAHew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,


I was able to connect by VPN and check the new patch v4. Everything
works fine on my Raspberry Pi 3B+:

# /etc/init.d/S49ntp stop
Stopping ntpd: OK
# date
Sat Nov  3 15:41:17 UTC 2018
# date --set "1970-02-01 10:10:10"
Sun Feb  1 10:10:10 UTC 1970
# date
Sun Feb  1 10:10:11 UTC 1970
# /etc/init.d/S48sntp start
Starting sntp:
sntp 4.2.8p12 at 1.3728-o Wed Oct 31 08:22:38 UTC 2018 (1)
1970-02-01 10:10:24.982820 (+0000) +1538544675.515026 +/-
1025696450.421369 pool.ntp.org 37.139.121.60 s2 no-leap
OK
# date
Sat Nov  3 15:41:42 UTC 2018

But I don't how to do that:

> >... provide your tested-by on that patch's email?
> > https://patchwork.ozlabs.org/patch/992167/

Best regards.

Oscar Gomez Fuente
TST Sistemas
www.tst-sistemas.es
