From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 16:12:29 +0200
Subject: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <CY4PR1201MB0120523CE90081F3CCB3B66DA1D80@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-4-romain.naour@smile.fr>
 <46a14660-516e-46e4-3ecf-5f43b422a5d8@mind.be>
 <CY4PR1201MB01208D2F8FAD71EE9FDA8754A1D80@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <799fbe91-2db8-b771-3de8-4e777a62965e@mind.be>
 <CY4PR1201MB0120523CE90081F3CCB3B66DA1D80@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <42e755da-8fcc-2a34-d304-ea7489261203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/08/2019 14:49, Alexey Brodkin wrote:
> Hi Arnout,
> 
>> -----Original Message-----
>> From: Arnout Vandecappelle <arnout@mind.be>
>> Sent: Saturday, August 3, 2019 3:25 PM
>> To: Alexey Brodkin <abrodkin@synopsys.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>; Alexandre PAYEN
>> <alexandre.payen@smile.fr>; Damien DUVAL <damien.duval@smile.fr>; Evgeniy Didin <didin@synopsys.com>;
>> Fabrice Fontaine <fontaine.fabrice@gmail.com>; Romain Naour <romain.naour@smile.fr>;
>> buildroot at buildroot.org
>> Subject: Re: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if fenv.h is not provided by
>> libc
>>
>>
>>
>> On 03/08/2019 12:48, Alexey Brodkin wrote:
>>> Hi Arnout,
>>>
>>>>  Since Alexey indicated that this is not needed any longer, I removed that part
>>>> and applied to master, thanks.
>>>>
>>>>  Alexey, could you do a runtime test (based on the one submitted by Romain) for
>>>> ARC to be sure? You'll need a qemu for ARC for that, obviously, which is why I'm
>>>> asking you instead of doing it myself :-)
>>>
>>> Any hint on why QEMU is in the question?
>>> I.e. is there any framework or test-suite that require QEMU?
>>
>>  Yes, the Buildroot runtime tests in support/testing use qemu.
> 
> That's cool, though I haven't tried that yet so may I ask what do I
> need to run for testing numpy in particular?

 Specifically for numpy, there is no runtime test yet - Romain submitted a patch
[1] but it needs a new iteration.

 But I realise now that in your case the runtime testing infra isn't that useful
since you anyway need to change the test completely to get the right arch and
kernel. So yes, by all means, test it on the board :-)

 You just need to add this to the config:

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_NUMPY=y

 And run this in Python:

import numpy as np
list = [1,2,3,4]
arr = np.array(list)
print (arr)



 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1140773/

> 
> -Alexey
> 
> P.S. Pls pardon my noob's questions - if there's an answer in
> form of one-liner that would be super cool, otherwise docs will work.
> 
