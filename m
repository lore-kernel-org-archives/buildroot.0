From: Ron Eggler <reggler@semios.com>
Date: Tue, 17 Dec 2013 21:20:46 +0000
Subject: [Buildroot] build uboot for AT91SAM9G20
In-Reply-To: <52B0BCC6.7070508@mind.be>
References: <3487466.tnqfWxcGWT@regdesktophome> <52B0BCC6.7070508@mind.be>
Message-ID: <1393632.OdRZK0rNiW@regdesktophome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,



> On 16/12/13 02:52, Ron Eggler wrote:
> > Hi,
> > 
> > I'm relatively new to buildroot, thus please excuse my beginner question.
> > 
> > I have configured buildroot to build an image for my AT91SAM9G20 system.
> > I believe it has built just fine but I'm running into an issue when it
> > comes to uboot, I'm getting this:
> > 
> > ...
> > 
> > make[1]: Entering directory
> > `/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10'
> > 
> > make: *** No rule to make target `e10_config'. Stop.
> 
>   You set BR2_TARGET_UBOOT_BOARDNAME to "e10", but there is no board with
> that name defined in U-Boot's boards.cfg. Choose a board that appears in
> boards.cfg, e.g. at91sam9g20ek_nandflash.

Yes, perfect, that seems to have helped! I set it to at91sam9g20ek_nandflash and the 
compilation is giong afgain now.
Great , Thanks! :)

Ron

[snip]

-- 
*ron eggler | semios | senior software engineer*
320 - 887 Great Northern Way | Vancouver, BC | V5T 4T5
T | 604 229 2044 ext 105[1]
C | 778 230 9442[2]
E | reggler at semios.com[3]
smart farming[4]
twitter[5] linkedin[6]

--------
[1] tel:604%20229%202044%20ext%20105
[2] tel:778%20230%209442
[3] mailto:reggler at semios.com
[4] http://www.semios.com
[5] https://twitter.com/semios
[6] http://www.linkedin.com/company/semiosbio-technologies-inc?goback=%2Enmp_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1&trk=company_logo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131217/05e6e18a/attachment.html>
