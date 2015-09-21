From: =?utf-8?B?5bed5bO2IOa1qQ==?= <kei-k@ca2.so-net.ne.jp>
Date: Mon, 21 Sep 2015 10:51:25 +0900
Subject: [Buildroot] [PATCH v5 1/1] squeezelite: new package
In-Reply-To: <38121FAB319C3344930C920E7B51831326015AD4@LEMAIL01.le.imgtec.org>
References: <201509201015.t8KAFEK0027976@ms-omx02.plus.so-net.ne.jp>
 <38121FAB319C3344930C920E7B51831326015AD4@LEMAIL01.le.imgtec.org>
Message-ID: <66D29DF2-AD52-49E3-BBB4-6F7C88FE6B36@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for taking time to review.
Ok, I will post sanity patch again.

Kawashima

> 2015/09/20 20:00?Vincent Olivert Riera <Vincent.Riera@imgtec.com> ?????
> 
> Dear Hiroshi Kawashima,
> 
> thanks for taking my comments into account and fix all the issue we find during the review process.
> 
> This patch looks good to me, but it has a big issue. You have edited it manually and forgot to change one important thing. Please keep reading.
> 
> On 20/09/15 11:15, kei-k at ca2.so-net.ne.jp wrote:
>> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
>> ---
>>  package/Config.in                  |    5 +----
>>  package/squeezelite/Config.in      |   33 +++++++++++++++++++++++++++++++++
> 
> Here you have changed a 32 by a 33, and added one more +. Please keep scrolling down.
> 
>>  package/squeezelite/squeezelite.mk |   30 ++++++++++++++++++++++++++++++
>>  3 files changed, 63 insertions(+), 4 deletions(-)
>>  create mode 100644 package/squeezelite/Config.in
>>  create mode 100644 package/squeezelite/squeezelite.mk
>> 
>> diff --git a/package/Config.in b/package/Config.in
>> index 22aef52..57f4498 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -33,6 +33,7 @@ menu "Audio and video applications"
>>  	source "package/opus-tools/Config.in"
>>  	source "package/pulseaudio/Config.in"
>>  	source "package/sox/Config.in"
>> +	source "package/squeezelite/Config.in"
>>  	source "package/tidsp-binaries/Config.in"
>>  	source "package/tovid/Config.in"
>>  	source "package/tstools/Config.in"
>> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
>> new file mode 100644
>> index 0000000..c27dac2
>> --- /dev/null
>> +++ b/package/squeezelite/Config.in
>> @@ -0,0 +1,32 @@
> 
> But you forgot to change this 32 here and put 33, so when we apply your patch only 32 lines are written to package/squeezelite/Config.in.
> 
> Please, _NEVER_ edit patches manually. Always regenerate them using "git format-patch".
> 
> In fact, I don't know why are you generating the patch file (since you are not adding a changelog) and then sending it by email. You can just send by email your latest commit with "git send-email --to=buildroot at buildroot.org --subject-prefix="PATCHv6" -1".
> 
> When we find issues during the review, you have to fix the issues by editing the needed files. Then add those files again with "git add <the file>", and then amend your commit with "git commit --amend". That workflow is much easier and faster.
> 
> Regards,
> 
> Vincent.
> 
> [snip]
