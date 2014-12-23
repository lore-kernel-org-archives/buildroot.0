From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 23:10:52 +0100
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <1419369534.3284.4.camel@synopsys.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
 <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
 <1419337919.2781.6.camel@synopsys.com>
 <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
 <1419345339.2781.9.camel@synopsys.com>
 <20141223205201.021ee085@free-electrons.com>
 <1419369534.3284.4.camel@synopsys.com>
Message-ID: <20141223231052.6973e707@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 23 Dec 2014 21:18:56 +0000, Alexey Brodkin wrote:

> Interesting, then how it worked for me?
> 
> I have the same login prompt as usual:
> --->---
> Welcome to Buildroot
> buildroot login:
> --->---
> 
> Here I enter "root" as usual, press Enter and that's it.
> "whoami" says "root" and I may modify any files etc.
> 
> What do I do wrong?

Weird, when I tested I had to add "console" to /etc/securetty,
otherwise login would not let me log in as root. Are you using just
Busybox, or some other login/getty implementation? Are you using an
unmodified /etc/securetty?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
