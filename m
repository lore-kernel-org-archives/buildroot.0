From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jun 2011 06:22:37 +0300
Subject: [Buildroot] device_table & /dev/shm
In-Reply-To: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
References: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
Message-ID: <20110626032236.GA17733@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Sat, Jun 25, 2011 at 11:29:46AM -0700, Charles Krinke wrote:
> 1. I can see the generic device_table.txt and it includes a /dev/shm
> node. I can also see the /dev structure in output/target and it
> matches the generic device_table.txt. But, ... when I build the jffs2
> and load it on my MPC8323 target, what I see in /dev does not include
> /dev/shm. In fact it is significantly different. So, my first question
> is:
> 
> "What besides generic/device_table.txt can determine the contents of
> /dev on an MPC8323 target?"

Do you have devtmpfs mounted on /dev? If so, devtmpfs takes over the content 
of /dev, and hides the device nodes and directories from your device table.  

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
