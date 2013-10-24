From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 13:43:31 +0200
Subject: [Buildroot] [PATCH] stress: disable documentation
In-Reply-To: <CAAXf6LXmuFppc4473+KC73LZmUjgk4h32p9Lx_6hANKmudRdDw@mail.gmail.com>
References: <1382571802-23306-1-git-send-email-arnout@mind.be>
 <CAAXf6LXmuFppc4473+KC73LZmUjgk4h32p9Lx_6hANKmudRdDw@mail.gmail.com>
Message-ID: <526907E3.5020409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/13 09:10, Thomas De Schampheleire wrote:
> On Thu, Oct 24, 2013 at 1:43 AM, Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:
>> It fails to build with my makeinfo version. Note that the autobuilders don't
>> see this, probably because they don't have makeinfo installed.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   package/stress/stress.mk | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
>> index 63efb66..b058031 100644
>> --- a/package/stress/stress.mk
>> +++ b/package/stress/stress.mk
>> @@ -17,7 +17,10 @@ STRESS_AUTORECONF = YES
>>   #
>>   # If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
>>   # --disable-static explicitly to get stress linked dynamically.
>> +#
>> +# Also, disable documentation by undefining makeinfo
>>   STRESS_CONF_OPT = \
>> -       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
>> +       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
>> +       MAKEINFO=:
>
> What is the significance of this colon?

  It's just an empty command. I could have used 'true' as well. In 
practice, they're the same. However, POSIX defines 'true' to take no 
arguments, while ':' ignores its arguments, so ':' is more pedantically 
correct.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
