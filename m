From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 4 Dec 2013 16:39:30 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-03
In-Reply-To: <20131204133500.2f99e067@skate>
References: <20131204073002.8453B101504@stock.ovh.net>
 <529F0ACD.1080803@imgtec.com> <20131204133500.2f99e067@skate>
Message-ID: <529F5AC2.1020700@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2013 12:35 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Wed, 4 Dec 2013 10:58:21 +0000, Vicente Olivert Riera wrote:
>
>>>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/35406e2aa9210f436c750b889a79c65fd8f5ded1/
>>
>> This is a problem with certain arches (IA64, MIPS and SPARC) in uClibc.
>> The file "uClibc/libc/sysdeps/linux/${ARCH}/bits/siginfo.h" has a struct
>> called sigevent. That struct has "__pid_t _tid;" in some arches, but not
>> on IA64, MIPS and SPARC, that's why it fails. glibc, for instance, has
>> that member on all arches.
>
> What can we do to fix this?
Just add the missing lines to the siginfo.h of the affected arches.

> Is there a fix upstream in uClibc?
I have seen the uClibc git repository today and the siginfo.h files for 
the affected arches haven't been modified yet. However, they have made 
some changes on the other arches and now those arches don't have a 
siginfo.h file, so I guess uClibc upstream will do the same for the 
affected arches sooner or later.

> Should we report the problem to them?
I think that will not hurt anyone :-)

> Thomas
>


-- 
Vincent
