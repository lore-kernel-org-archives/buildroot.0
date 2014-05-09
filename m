From: Frank Bergmann <frank@frajasalo.de>
Date: Fri, 09 May 2014 21:06:55 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140509133412.GE764@arch.cereza>
References: <20140507063009.23A95100E55@stock.ovh.net>
 <20140507093155.18034c1d@free-electrons.com>
 <20140509133412.GE764@arch.cereza>
Message-ID: <536D274F.3030100@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09.05.2014 15:34, Ezequiel Garcia wrote:
> On 07 May 09:31 AM, Thomas Petazzoni wrote:
>>>       nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/9cd30031a40f768f6090cfba44c880fb2406672b/
>>
>> Ezequiel?
>>
>
> fio does a configure-time test to see if fallocate() is there, which passes
> successfully. Then BR builds fio passing LARGE_FILE flags which makes the
> toolchain try fallocate64(), which is not implemented.
>
> However, I'm not sure how to either make the configure-time fallocate test
> fail (so fio knows there's no fallocate), or prevent BR from passing the
> LARGE_FILE flags.
>
> Disable fio for nios2?

Or patch away the fallocate function in the configure script for nios2
like the patch in attachment do ?

With regards,
Frank Bergmann.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-fio-fix-missing-fallocate64.patch
Type: text/x-patch
Size: 2185 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140509/0a686dff/attachment.bin>
