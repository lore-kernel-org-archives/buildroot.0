From: Nathaniel Roach <nroach44@gmail.com>
Date: Fri, 03 Oct 2014 14:35:19 +0800
Subject: [Buildroot] [PATCH] bandwidthd: fix static build
In-Reply-To: <20141002083349.GI3006@sapphire.tkos.co.il>
References: <7d38491011008b60f8ad91ec0261af046d453685.1412232567.git.baruch@tkos.co.il>
 <542CFECE.9020103@gmail.com> <20141002075203.GG3006@sapphire.tkos.co.il>
 <542D0518.3050704@gmail.com> <20141002075844.GH3006@sapphire.tkos.co.il>
 <542D0BC9.4060905@gmail.com> <20141002083349.GI3006@sapphire.tkos.co.il>
Message-ID: <542E43A7.6080003@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 16:33, Baruch Siach wrote:
> Hi Nathaniel,
> 
> On Thu, Oct 02, 2014 at 04:24:41PM +0800, Nathaniel Roach wrote:
>> On 02/10/14 15:58, Baruch Siach wrote:
>>> On Thu, Oct 02, 2014 at 03:56:08PM +0800, Nathaniel Roach wrote:
>>>> I do vaguely remember some issue with -lpthread, could you send me the
>>>> config?
>>>>
>>>> (It was a while ago, but I'm sure I tested the patch with a basic ARM
>>>> config, and IIRC I had the -lpthread issue once or twice but was never
>>>> able to reproduce it after my patch)
>>>
>>> Get the config from 
>>> http://autobuild.buildroot.net/results/e49/e496cc4315c06de61379222d3e842d4cd05b2f71/config.
>>
>> After testing that, you are indeed correct.
>>
>> I've gone through the emails from a while ago and it's something like this:
>>
>> Bandwidthd needs libpcap.
>> If libpcap was compiled with libusb that needs to be checked for/handled.
>> And if libusb was used apparently /that/ is what needs pthreads, thus
>> adding an additional dependency on the configure.ac.
>>
>> I'm not sure why I added a hard pass/fail check for lpthread, as I would
>> have thought I've done it like I handled like the lpng/zlib issue...
>>
>> I'll have a play around and see what I can do.
> 
> The libpcap package provides the helpful pcap-config utility that is more or 
> less equivalent to pkg-config. grep pcap-config in buildroot to see how it is 
> being used to fix static build problems.
> 
> baruch
> 

Hi Baruch, I didn't end up using pcap-config, but could you check git
version 4b07a0b3d3a280cdde582060cb29f3333ba4bf6e for me? It seems to
work in the config you pasted above and I haven't had any issues in my
other tests.

Thanks, Nathaniel
