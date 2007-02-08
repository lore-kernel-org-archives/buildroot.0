From: carl zhu <carl.zhu@gmail.com>
Date: Thu, 8 Feb 2007 15:50:29 +0800
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <200702072136.41131.yann.morin.1998@anciens.enib.fr>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<1170878990.10007.4.camel@ndragon.eng.wgate.com>
	<200702072124.30009.yann.morin.1998@anciens.enib.fr>
	<200702072136.41131.yann.morin.1998@anciens.enib.fr>
Message-ID: <168013e20702072350j59e08339maf8cbc711f00d958@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, so you mean if use this patch, GCC 4.0.4 can work with uclibc? I
still feel a little strange, because I have googled several days before,
and  I have found someone fixed this issue with applied IIRC, Does it do
help for this issue?

I am new for build cross-compiler.

related link:http://tech.groups.yahoo.com/group/gnuarm/message/1325


On 2/8/07, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:
>
> On Wednesday 07 February 2007 212, Yann E. MORIN wrote:
> > Short answer: it does not work.
> > See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id)329  [1]
> > (not directly related, but yet, useless on ARM).
>
> I realise I'm being vague. Some explanations below.
>
> In fact, the patch I posted allows one to successfully build a x-compiler
> for soft-float armeb (mine is armeb-xscale-linux-uclibc, tuned for
> Xscale).
> Unfortunately, the resulting gcc barfs on the squashfs code in the kernel.
> A smaller test-case is available in the bug report, suggesting this is
> quite
> easy to hit.
>
> That's why I've reverted to gcc-4.0.4, which still needs the attached
> patch,
> but Just Work (TM).
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |
> ^                |
> | --=< ?_? >=-- ?------------.-------:  X  AGAINST      |  /e\  There is
> no  |
> | http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML
> MAIL    |  """  conspiracy.  |
>
> ?------------------------------?-------?------------------?--------------------?
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070208/f3754625/attachment.htm 
