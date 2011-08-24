From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 24 Aug 2011 11:57:30 +0300
Subject: [Buildroot] Login of Buildroot
In-Reply-To: <CACR8Qs87dcKMFDsgrea881x7tod3inSJSiSct9SniTaKSF8BSQ@mail.gmail.com>
References: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
 <CALR4fELAirpxcgiWC_F3jOC-n8M-nA+7LS-vAzC+HyhY3T2BKw@mail.gmail.com>
 <CACR8Qs87dcKMFDsgrea881x7tod3inSJSiSct9SniTaKSF8BSQ@mail.gmail.com>
Message-ID: <CALR4fEJmvv=Ywy4wenKg4+rwCfUMPDbz+W=dBiUmDm2Y8tOtMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 24, 2011 at 11:48 AM, Alexjan Carraturo <axjslack@gmail.com> wrote:
>> What happens if you remove "securetty"? Do you have the correct /dev/*
>> files? (for example /dev/tty)

> What do you mean with "remove securetty"; do you mean remove my tty
> from file, or remove the file "securetty"?
rm -f /dev/securetty

>
> The correct tty is present (/dev/ttyAMA0) and seems to have right
> permissions (crw-rw-rw).
ls -l /dev/ttyAMA0
ls -l /dev/tty

(passwd+login use the later one)

Next step, is to get a working shell, and run "strace passwd".
