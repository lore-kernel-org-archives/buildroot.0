From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Aug 2015 11:02:39 +0100
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <55C32945.2000209@imgtec.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com> <55C32945.2000209@imgtec.com>
Message-ID: <55D1B13F.5010908@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 08/06/2015 10:30 AM, Vicente Olivert Riera wrote:
> Hello Thomas,
> 
> On 06/08/15 11:30, Thomas Petazzoni wrote:
>>>          mips | ltrace-c22d359433b333937ee3... | NOK |
>>> http://autobuild.buildroot.net/results/79b51941ed57b0564c68112489b03cac39a04e9a/
>>>
>>
>> output.c: In function 'output_right':
>> output.c:784:3: error: size of unnamed array is negative
>>     (void)sizeof(char[1 - 2*(sizeof(unw_word_t)
>>     ^
>>
>> Vicente, J?r?me, can you have a look?
> 
> ltrace with libunwind support is broken for MIPS, but I'm working with
> upstream to get it fixed. I hope to finish with it soon.

Fixed by:

http://patchwork.ozlabs.org/patch/507709/

Can you review it please?

Thanks,

Vincent.
