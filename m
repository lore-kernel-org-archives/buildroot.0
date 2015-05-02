From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 02 May 2015 14:15:42 +0200
Subject: [Buildroot] [PATCH] php.ini: set date.timezone to UTC
In-Reply-To: <55448176.6050108@mind.be>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <5543FCCE.2000904@mind.be> <55440789.50004@je-eigen-domein.nl>
 <55448176.6050108@mind.be>
Message-ID: <5544BFEE.5020603@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2015 09:49 AM, Arnout Vandecappelle wrote:
> On 02/05/15 01:08, Floris Bos wrote:
>> On 05/02/2015 12:23 AM, Arnout Vandecappelle wrote:
>> == Warning: strtotime(): It is not safe to rely on the system's 
>> timezone settings. 
>   Any idea _why_ it is not safe? I've tried to google it but didn't come up with
> a reason, just a lot of fixes.

No idea.

>> You are *required* to use the date.timezone setting or the
>> date_default_timezone_set() function. In case you used any of those methods and
>> you are still getting this warning, you most likely misspelled the timezone
>> identifier. We selected the timezone 'UTC' for now, but please set date.timezone
>> to select your timezone.
>> ==
>>
>> It certainly does work for common names like Europe/Brussels, but not sure if
>> that goes for every zone name.
>   Hm, php (like so often) has its own re-implementation of the timezone
> database... . It's based on the same Olson database so it's probably OK for
> valid timezones, but tzdata has additional posix/ and right/ variants and it
> also has the old SystemV/ timezones...
>
>   Well, people who use one of these weird timezones will see the php error so
> they can solve it I guess.

I do know Debian has a patch to let PHP use the system's timezone 
database instead of the internal one.
We could borrow that one, but then we would be deviating from upstream 
(which did not want the patch, and prefers to stick with their internal db).


Yours sincerely,

Floris Bos
