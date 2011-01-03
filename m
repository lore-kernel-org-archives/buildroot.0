From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Jan 2011 07:13:03 -0300
Subject: [Buildroot] [PATCH 04/10] binutils: make it a proper package
In-Reply-To: <20110103101458.61270f4a@surf>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>	<1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>	<874o9xldzj.fsf@macbook.be.48ers.dk>	<4D1B9D16.1080902@zacarias.com.ar>
	<20110103101458.61270f4a@surf>
Message-ID: <4D21A12F.9010201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/2011 06:14 AM, Thomas Petazzoni wrote:

>>> Why remove this ARCH_IS_64 stuff?
>>
>> This is from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb which does
>> a symlink trick to make libstdc++ available. It's simpler to just copy
>> libstdc++ (and libgcj/libgcc while at it) to the sysroot which is fixed
>> in patch #5 from my series.
> 
> I am not sure about this justification, since I don't see what change
> in the toolchain build procedure removes the need for this symbolic
> link. Have you actually tested building WebKit on x86_64 for example ?
> 
> Thanks,
> 
> Thomas

Yes, tested on an x86_64 host building an x86_64 target (full midori).
First test was removing all the symlink stuff which in fact broke
webkit, then i added my lib* in staging patch. Everything was built from
scratch.
To throw in some extra testing i did the same with an arm target for
both runs with the same result.
