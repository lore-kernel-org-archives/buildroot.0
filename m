From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Feb 2020 05:17:50 +0100
Subject: [Buildroot] [PATCH 2/4] package/arm-gnu-a-toolchain: new package
In-Reply-To: <20200213092005.o5h7wioo2kokn2gr@bars>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-3-git-send-email-sunil@amarulasolutions.com>
 <20200213073431.6p42z2gsv6kaydoi@bars>
 <CAMty3ZBaswiTKkH4KFBQhWEZCUKcOOyFyjVGMw7b-JzvroTkcw@mail.gmail.com>
 <20200213092005.o5h7wioo2kokn2gr@bars>
Message-ID: <20200214051750.5877034f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 12:20:05 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> > > Could you please clarify why a separate toolchain is required to build
> > > ATF for this platform ? Is there any specific requirements other than
> > > this particular build error ?  
> > 
> > Rockchip rk3399 has cortex-m0 and these changes are build during ATF.
> > and then environment should have arm32 cross toolchain to make it
> > build successfully.
> > 
> > I think, Sunil need to write something more on this requirement on
> > commit message.  
> 
> Well, I mean that other ATF firmwares can be built with standard buildroot
> toolchain. I guess this is the case for Rockchip ATF as well. You just need
> to specify available toolchain using environment variable or something.
> In the worst case, some patch modifing Makefiles in Rockchip ATF
> source tree is needed.

No, this is not correct. Depending on the platform, ATF may include
code that runs on ARM32 co-processors, and ARM32 code cannot be built
with an ARM64 toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
