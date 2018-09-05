From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 5 Sep 2018 08:29:36 +0200
Subject: [Buildroot] [PATCH v3] mediastreamer: fix avcodec functions
 conflict
In-Reply-To: <767b037d-9ff3-9392-25ca-3656a400be30@mind.be>
References: <20180904131251.30724-1-giulio.benetti@micronovasrl.com>
 <87va7lasjf.fsf@dell.be.48ers.dk>
 <735a4c9f-42c2-9744-6889-921bf720d167@micronovasrl.com>
 <87in3lapvk.fsf@dell.be.48ers.dk>
 <767b037d-9ff3-9392-25ca-3656a400be30@mind.be>
Message-ID: <3482c2e2-35f1-854d-608e-65f1ab3c4871@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Il 05/09/2018 00:10, Arnout Vandecappelle ha scritto:
> 
> 
> On 04/09/2018 23:56, Peter Korsgaard wrote:
>>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
>>
>> Hi,
>>
>>   >> Committed after extending the commit message to clarify that this is
>>   >> about static linking, thanks.
>>
>>   > Sorry for my ignorance, so library order during linking is an issue only
>>   > with static libraries?
>>
>> Yes, when statically linking ld will only pull in the object files
>> containing referenced symbols, so you need to list the libraries in the
>> dependency order (E.G. if you call a function in library a that in turn
>> calls a function in library b then you must use -la -b).
>>
>> For details, see
>> E.G. https://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking
> 
>   Note the explanation of --start-group/--end-group, which is sometimes the
> easiest way to fix a linking order issue.

Thank you that clarified me a lot.
Giulio
