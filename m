From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Nov 2014 18:58:23 -0300
Subject: [Buildroot] [PATCH] system/permissions: /etc/random-seed must
 be mode 600
In-Reply-To: <1690999.xJl8MaTsPY@sagittea>
References: <1416517694-7952-1-git-send-email-gustavo@zacarias.com.ar>
 <1690999.xJl8MaTsPY@sagittea>
Message-ID: <546E63FF.5070503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/20/2014 06:27 PM, J?r?me Pouiller wrote:
> Just curiosity, does it make sense to provide a random seed? I mean, it is not 
> very random, is it?

I have another patch that creates random-seed at build-time that i'm
testing.
That's not too good either since it's fixed "per firmware image" so to
speak, but at least it's better than an easily downloadable fixed seed
from many mirrors :)
The problem with mode 744 (currently) is that anyone can read the seed,
which as we know is fixed for now, but they can also read the evolved
seed too _IF_ the box/device shutdowns properly.
I guess it's time to write some best practices documentation, in this
aspect we can't cover for all the varying possibilities i'm afraid.
Ideally a separate partition/eeprom would contain the seed so as to make
it unique to each device and firmware-independant.
And no, using the device MAC address/serial number for this isn't that
good :)
Regards.
