From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 31 Oct 2018 09:37:43 +0100
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <CANQCQpa-kkDU56c7vjVnw=EDFxVxda2PPNPWMPazzkdhJt1jCg@mail.gmail.com>
References: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
 <CANQCQpYkLV-XJBVqRsQLdrxthZzkqctsBcxfX4mJQqFY16jk5Q@mail.gmail.com>
 <f544829d-68ed-abfc-306c-ce3cebb1de3b@mind.be>
 <CANQCQpYAjzXTQBDjKwbMPnQViP0=Qfpr6+pgs_3e7iGOYfo50g@mail.gmail.com>
 <3232b003-ae5e-43d1-b795-f73a0ed71624@mind.be>
 <CANQCQpa-kkDU56c7vjVnw=EDFxVxda2PPNPWMPazzkdhJt1jCg@mail.gmail.com>
Message-ID: <CALtfCQbVvZOwfmTx8nykn0h8JXsj_GeMiLK6f+OM+7fw0o7q+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I was checking it on my Raspberry Pi 3B+ and it works perfectly.

The only weird thing is the log related to the other ntp servers, but
I think they are normal. It sees to be that they are duplicated, the
alternative servers exist in case one of them it was down, so it is
ok.

----->
# date --set "1970-01-01 10:10:00"
Thu Jan  1 10:10:00 UTC 1970

# sntp -K /tmp/kod -sS -M 128 0.pool.ntp.org 1.pool.ntp.org
2.pool.ntp.org 3.pool.ntp.org
sntp 4.2.8p12 at 1.3728-o Wed Oct 31 08:22:38 UTC 2018 (1)
213.251.52.234:123 0.pool.ntp.org duplicate address from 1.pool.ntp.org ignored.
37.139.121.60:123 0.pool.ntp.org duplicate address from 1.pool.ntp.org ignored.
185.132.136.116:123 0.pool.ntp.org duplicate address from
1.pool.ntp.org ignored.
81.19.96.148:123 0.pool.ntp.org duplicate address from 1.pool.ntp.org ignored.
213.251.52.234:123 0.pool.ntp.org duplicate address from 2.pool.ntp.org ignored.
81.19.96.148:123 0.pool.ntp.org duplicate address from 2.pool.ntp.org ignored.
185.132.136.116:123 0.pool.ntp.org duplicate address from
2.pool.ntp.org ignored.
37.139.121.60:123 0.pool.ntp.org duplicate address from 2.pool.ntp.org ignored.
Send to [2001:720:1014:a205::2]:123 failed, Network is unreachable
213.251.52.234:123 0.pool.ntp.org duplicate address from 3.pool.ntp.org ignored.
81.19.96.148:123 0.pool.ntp.org duplicate address from 3.pool.ntp.org ignored.
185.132.136.116:123 0.pool.ntp.org duplicate address from
3.pool.ntp.org ignored.
37.139.121.60:123 0.pool.ntp.org duplicate address from 3.pool.ntp.org ignored.
Send to [2001:720:1014:a202::2]:123 failed, Network is unreachable
1970-01-01 10:10:05.624784 (+0000) +1540938259.059756 +/-
1027292172.738343 0.pool.ntp.org 213.251.52.234 s2 no-leap

# date
Wed Oct 31 08:34:26 UTC 2018
----->

Great Job!

Best regards.

Oscar Gomez Fuente
TST Sistemas
www.tst-sistemas.es
