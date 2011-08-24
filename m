From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 24 Aug 2011 13:42:28 +0300
Subject: [Buildroot] Login of Buildroot
In-Reply-To: <CACR8Qs8yY-oXwKe7+NwqkCxs7osd8_WFfLrtedBJE3_u_LwuoA@mail.gmail.com>
References: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
 <CALR4fELAirpxcgiWC_F3jOC-n8M-nA+7LS-vAzC+HyhY3T2BKw@mail.gmail.com>
 <CACR8Qs87dcKMFDsgrea881x7tod3inSJSiSct9SniTaKSF8BSQ@mail.gmail.com>
 <CALR4fEJmvv=Ywy4wenKg4+rwCfUMPDbz+W=dBiUmDm2Y8tOtMA@mail.gmail.com>
 <CACR8Qs8yY-oXwKe7+NwqkCxs7osd8_WFfLrtedBJE3_u_LwuoA@mail.gmail.com>
Message-ID: <CALR4fEKZnDDiQktqh8DKw7Yh-DnoJ_Fy8umgMuczG43fjDZR9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 24, 2011 at 12:06 PM, Alexjan Carraturo <axjslack@gmail.com> wrote:
>> ls -l /dev/ttyAMA0
>> ls -l /dev/tty

> crw-rw-rw- 1 root root 204, 64 ?6 mag 15.45 ttyAMA0
> crw-rw-rw- 1 root root 4, 1 ?6 mag 15.45 tty1

>> Next step, is to get a working shell, and run "strace passwd".
> Why do you think that may be useful?

Because then you would notice (*) that login tries to open "/dev/tty"
fails and then the login aborts.

(*) at least that is what I saw in my case, and this is what I used to
debug the "telnet not logging in" problem I had
