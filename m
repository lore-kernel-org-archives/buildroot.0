From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 09:37:55 +0200
Subject: [Buildroot] [PATCH] opencv: fix sparc64 compile
In-Reply-To: <20160404194344.GB5944@waldemar-brodkorb.de>
References: <20160403110913.GA19849@waldemar-brodkorb.de>
 <5702C33D.80608@mind.be> <20160404194344.GB5944@waldemar-brodkorb.de>
Message-ID: <57036B53.6080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/04/16 21:43, Waldemar Brodkorb wrote:
> Hi Arnout,
> Arnout Vandecappelle wrote,
>
>> On 04/03/16 13:09, Waldemar Brodkorb wrote:
>>> This patch from Debian fixes following autobuild failure:
>>> http://autobuild.buildroot.net/results/eda5c6c43da40a342e0f545a348d2f865eb5ccf2/
>>>
>>> Tested with ARM build without a regression.
>>>
>>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>>> ---
>>>   package/opencv/0002-atomic.patch | 222 +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 222 insertions(+)
>>>   create mode 100644 package/opencv/0002-atomic.patch
>>>
>>> diff --git a/package/opencv/0002-atomic.patch b/package/opencv/0002-atomic.patch
>>> new file mode 100644
>>> index 0000000..607d3fd
>>> --- /dev/null
>>> +++ b/package/opencv/0002-atomic.patch
>>> @@ -0,0 +1,222 @@
>>> +Bug#714923: opencv FTBFS on sparc64
>>> +https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1393793.html
>>> +
>>
>>   You should sign off the patch. It is also missing a description of what is
>> wrong and how it is fixed.
>
> Thanks for the review.
> I thought Signed-off-By is only used if I made the patch and not if
> I copy the patch from some internet site.

 
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

  Third paragraph.

  Regards,
  Arnout

>
>>   Also please refer to the bug tracker itself rather than the mail archive:
>>
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=714923
>>
>>   The first message there contains a nice description of the problem that you
>> can reuse in the patch.
>
> Okay,
>
> Waldemar
>

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
