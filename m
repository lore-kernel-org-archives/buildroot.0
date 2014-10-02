From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 2 Oct 2014 09:41:27 +0100
Subject: [Buildroot] [PATCH 2/2] opencv: Let opencv's build system
 handle the ts module dependencies
In-Reply-To: <CAHXCMML4wgCRFUkYnuhBAEc833FLo4wK4FUg9j7AsA=JpDT8Ag@mail.gmail.com>
References: <1412165881-64965-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
 <CAHXCMML4wgCRFUkYnuhBAEc833FLo4wK4FUg9j7AsA=JpDT8Ag@mail.gmail.com>
Message-ID: <542D0FB7.3060209@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On 10/01/2014 09:05 PM, Samuel Martin wrote:
> Hi Vincente, all,
>
> On Wed, Oct 1, 2014 at 2:18 PM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
>> In the former version of opencv we added a patch to fix a dependencies
>> problem in the ts module. That issue was reported upstream and is now
>> merged in the 2.4.10 version:
>>
>>    https://github.com/Itseez/opencv/commit/7018f9495920f974258502b9b8b26af16d7ee427
>>
>> So now we can revert our former patch and let opencv's build system
>> handle the ts module dependencies as we already do in the other modules.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/opencv/Config.in |    1 -
>>   1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
>> index d648e5e..24f540e 100644
>> --- a/package/opencv/Config.in
>> +++ b/package/opencv/Config.in
>> @@ -101,7 +101,6 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>>
>>   config BR2_PACKAGE_OPENCV_LIB_TS
>>          bool "ts (touchscreen)"
>> -       select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>>          default y
>>          help
>>            Include opencv_ts module into the OpenCV build.
>
> Thought I understand that you want to keep this knob similar to the
> others, it is in contradiction with some pending patch [1] which fix
> the inter OpenCV modules dependencies.
>
> Whatever this patch got merged or not, the patch [1] will need to be
> updated after the bump to OpenCV-2.4.10 is merged.
> So, I have no strong opinion about this patch:
> - applying it won't break the autobuilders;
> - whereas not applying it only does not improve that much the
> situation wrt the issue that [1] attemps to fix.
>
>
> Regards,
>
>
> [1] http://patchwork.ozlabs.org/patch/384577/

I like that patch!!! In fact, I was thinking on doing that, but you 
already done it. Great.

Yeah, my purpose with the second patch is to leave thinks as they were 
before and consistent with the other opencv modules. I added a highghi 
dependency for the ts module, then reported that issue upstream. 
Upstream fixed the problem, and now I want to bump the version and 
revert the former fix. That's it.

I don't mind if the second patch gets applied or not. But I would really 
like to see your patch applied (or a similar patch to take into account 
the opencv modules dependencies in Buildroot).

Thanks for your job!

-- 
Vincent
