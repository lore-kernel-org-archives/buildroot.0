From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Feb 2020 05:19:25 +0100
Subject: [Buildroot] [PATCH 2/4] package/arm-gnu-a-toolchain: new package
In-Reply-To: <CAM+7aWuyvgf=ZjzxW+OAs+XpzT3yf+iru8JF7n+wQNAJLGg31Q@mail.gmail.com>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-3-git-send-email-sunil@amarulasolutions.com>
 <20200213073431.6p42z2gsv6kaydoi@bars>
 <CAMty3ZBaswiTKkH4KFBQhWEZCUKcOOyFyjVGMw7b-JzvroTkcw@mail.gmail.com>
 <20200213092005.o5h7wioo2kokn2gr@bars>
 <CAM+7aWuyvgf=ZjzxW+OAs+XpzT3yf+iru8JF7n+wQNAJLGg31Q@mail.gmail.com>
Message-ID: <20200214051925.1d3b6cc3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 15:31:59 +0530
Sunil Kumar Mahesh <sunil@amarulasolutions.com> wrote:

> One of the requirements to build ATF is to have Baremetal GNU GCC tools.
> This is stated in
> ATF documentation (ATF/docs/getting_started/user-guide.rst - section Tools)

No, the problem is not to have access to baremetal GC tools. On most
platforms we built ATF with a non-bare metal toolchain, and this works
just fine.

What justifies adding this toolchain is that the target platform is
ARM64, but ATF needs to be built bits of code for some ARM32
co-processor, and you can't build ARM32 code with an ARM64 toolchain.

Since all we need for ARM32 is to build bare-metal code, we use a
bare-metal ARM32 toolchain for that. But everything else in ATF will be
built by the regular non-bare-metal ARM64 toolchain built by Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
