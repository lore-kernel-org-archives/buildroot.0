From: Matias Garcia <mgarcia@rossvideo.com>
Date: Mon, 27 Jun 2011 16:23:55 -0400
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
In-Reply-To: <BANLkTinSC4W8=vwRCHYmBndbJqt7rv=xgQ@mail.gmail.com>
References: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>	<4E04C9EE.4050206@rossvideo.com>	<20110627035939.GB3046@jasper.tkos.co.il>
 <BANLkTinSC4W8=vwRCHYmBndbJqt7rv=xgQ@mail.gmail.com>
Message-ID: <4E08E6DB.4070606@rossvideo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-06-27 04:10 PM, raymond zhao wrote:
> On Sun, Jun 26, 2011 at 11:59 PM, Baruch Siach<baruch@tkos.co.il>  wrote:
>> Hi Raymond, Matias,
>> I'm also using the CodeSourcery toolchain for the e500v2 target (P1011), and I
>> figured out that I must pass -te500v2 to gcc at link time as well. Since there
>> is no generic way to add LDFLAGS options in Buildroot, I've posted the patch
>> at http://lists.busybox.net/pipermail/buildroot/2011-June/043668.html. Did you
>> find a better solution?
>>
>> baruch
> Hi, Baruch
> I took a look at the CodeSourcery. Looks it doesn't support uCLibc.
> Best regards,
> changbing
changbing: That's correct. You may find an older toolchain from them 
that uses uClibc, but you'll have to specify it yourself in the 
Buildroot config. I found a very small difference in size (<2MB) between 
uclibc and eglibc filesystems, but I'm using 32MB of flash just for the 
OS, so small is relative.

Baruch: I use the external toolchain wrapper introduced just before 
2011.05, but I had to patch it to add arbitrary options. I posted a 
couple of patches here, one that introduces a new option for selecting 
the sysroot when compiling the external wrapper, and another that simply 
passes the BR2_TARGET_OPTIMIZATIONS to the external wrapper, but they 
didn't get much attention.

I prefer the first method (new config option) because you can choose not 
to pass the optimizations@some later point for whatever reason, and 
thus use the wrapper only to select your sysroot.

Cheers,
Matias
