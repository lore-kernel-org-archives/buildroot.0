From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 10:23:25 +0200
Subject: [Buildroot] defconfigs with upstream kernels
In-Reply-To: <20170814051324.fsb7vyp3pc2bcsnq@sapphire.tkos.co.il>
References: <a1c822f4-061c-527b-5ae2-2a82764159f4@mind.be>
 <20170814051324.fsb7vyp3pc2bcsnq@sapphire.tkos.co.il>
Message-ID: <20170814102325.33d2b25a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 08:13:24 +0300, Baruch Siach wrote:

> >  Any objections to switching all upstream boards to LATEST?  
> 
> I don't think this is a good idea.
> 
> The kernel and bootloaders are special in that their correct operation depends 
> on many little platform specific details that tend to break frequently between 
> releases because of unrelated code changes. Even worse. Due to the time lag 
> between the patch post time and merge time, a new config might be broken by 
> merge time, not to mention Buildroot release time. In this case the Buildroot 
> user will not have a chance to go back to see when things broke.
> 
> Now, I know you could say the same about gcc/binutils/libc. But I think there 
> is a difference. The toolchain is far less platform specific. Toolchain 
> components also see less frequent releases. As you noted, the breaks we have 
> recently seen were mostly caused by the now reverted choice to hard-code 
> specific gcc versions into the code.
> 
> In sum, I think that hardware specific config should refer to a specific known 
> good and tested versions of the kernel and the bootloader (when applicable). 
> Alternatively, at the very leasts, the commit log must include these details.

I agree with Baruch. Nothing else to say, he perfectly expressed my
opinion on this topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
