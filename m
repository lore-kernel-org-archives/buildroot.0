From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 25 May 2016 09:44:46 -0500
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517153611.2a3b4199@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <CANn-YGQtktWrFm-1a3okv+6SB0ymwt+KPyA5pCMKR-jyE8LN+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, May 17, 2016 at 8:36 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> Rodrigo, Geoff, Gustavo, Vicente, Gwenhael, Samuel, Yegor, Ben,
> Clayton, Bernd, please see below, there are questions/issues for you.
>
> Note to others: there are also plenty of build failures below with
> nobody assigned. Feel free to pick some of them and investigate. Thanks!
>
>
> >          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/cebfd7e29a6521ae7ba4c229586a3ef662aa9de1/
>
> libustr-debug-1.0.so.1': File exists
>
> Gah, smells like parallel installation issue. Clayton, since you added
> this package, can you have a look?

I took a look at the errors but I can't seem to reproduce it on my
local setup. I can submit a patch that tries to fix it but I'm not
sure what the root cause of the error is. The commands make is running
should not allow for the error to happen (removes the link before it
is created). I'll submit the patch for review and then we can go from
there.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
