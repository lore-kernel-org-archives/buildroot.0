From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jan 2016 16:03:37 +0100
Subject: [Buildroot] [PATCH 1/1] disable reboot by ctrl-alt-del
In-Reply-To: <1451858433-7932-1-git-send-email-felten@vaxnet.de>
References: <1451858433-7932-1-git-send-email-felten@vaxnet.de>
Message-ID: <20160104160337.402c3aef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jan 2016 23:00:33 +0100, lothar felten wrote:
> From: lf <micro1183@gmail.com>
> 
> Most embedded systems do not have a keyboard.
> If a keyboard is attached afterwards (e.g. to an accessible USB host port) 
> this allows the user to reboot the system by pressing Ctrl-Alt-Del, which
> might not be desired.
>  
> Signed-off-by: lothar felten <felten@vaxnet.de>

Thanks Lothar for your contribution. Your patch has already been
committed, so I hadn't had the time to give my opinion.

My opinion is quite different than the one from Yann and Peter however:
I believe your customization of the ctrl-alt-del behavior is really a
detail, which can very easily be overridden in a post-build script and
therefore does not deserve an additional Config.in option. If we start
adding Config.in options for every possible customization of the
inittab, we will have gazillions of options to solve very specific use
cases.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
