From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 21 Apr 2016 23:18:42 +0200
Subject: [Buildroot] [PATCH] python-backports-ssl-match-hostname: new
	package
In-Reply-To: <57192BD1.8090409@mind.be>
References: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
 <57192BD1.8090409@mind.be>
Message-ID: <CAGm1_kuBn=tsBbb-BAczkdctQ=ecsZROyRJgJgBPHcWxJkfqJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 21, 2016 at 9:36 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/20/16 11:22, yegorslists at googlemail.com wrote:
>>
>> From: Yegor Yefremov<yegorslists@googlemail.com>
>>
>> Fixes #8856
>>
>> Signed-off-by: Yegor Yefremov<yegorslists@googlemail.com>
>> ---
>>   package/Config.in                                          |  1 +
>>   package/python-backports-ssl-match-hostname/Config.in      |  6 ++++++
>>   .../python-backports-ssl-match-hostname.hash               |  4 ++++
>>   .../python-backports-ssl-match-hostname.mk                 | 14
>> ++++++++++++++
>>   4 files changed, 25 insertions(+)
>>   create mode 100644 package/python-backports-ssl-match-hostname/Config.in
>>   create mode 100644
>> package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
>>   create mode 100644
>> package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index ecaf164..3b5e66e 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -630,6 +630,7 @@ menu "External python modules"
>>         source "package/python-alsaaudio/Config.in"
>>         source "package/python-autobahn/Config.in"
>>         source "package/python-backports-abc/Config.in"
>> +       source "package/python-backports-ssl-match-hostname/Config.in"
>>         source "package/python-beautifulsoup4/Config.in"
>>         source "package/python-bottle/Config.in"
>>         source "package/python-can/Config.in"
>> diff --git a/package/python-backports-ssl-match-hostname/Config.in
>> b/package/python-backports-ssl-match-hostname/Config.in
>> new file mode 100644
>> index 0000000..36399bb
>> --- /dev/null
>> +++ b/package/python-backports-ssl-match-hostname/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
>> +       bool "python-backports-ssl-match-hostname"
>
>
>  Smell likes this should
>         depends on BR2_PACKAGE_PYTHON
> no? Doesn't make much sense to backport this function to Python 3.6 :-)

No. We still have Python 3.4.x

The most interesting goody about about 3.5 ssl-match-hostname is
support for IP addresses or something like this, that uses "import
ipaddress", so it would make sense to select this package for Python
2.7.

Yegor

>> +       help
>> +         The ssl.match_hostname() function from Python 3.5.
>> +
>> +       http://bitbucket.org/brandon/backports.ssl_match_hostname
>
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
