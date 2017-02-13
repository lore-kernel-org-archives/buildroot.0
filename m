From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Feb 2017 22:26:12 +0100
Subject: [Buildroot] [PATCH v2] Add gitlab-CI support
In-Reply-To: <707812a9-c5d0-15c6-85f1-bf3a64782a21@cartelsol.com>
References: <20170207145550.11009-1-arnout@mind.be>
 <20170212212715.29524-1-arnout@mind.be>
 <707812a9-c5d0-15c6-85f1-bf3a64782a21@cartelsol.com>
Message-ID: <f6e4d4ea-509b-8ed0-46ee-152a01251212@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Marcus,

 Thank you for your feedback! I'll take it into account for v3.

On 13-02-17 13:18, Marcus Hoffmann wrote:
> Hello Arnout,
> 
> I did something similar for our buildroot project. See my comments below.

 If you have any more suggestions, I welcome them.

> 
> On 12.02.2017 22:27, Arnout Vandecappelle (Essensium/Mind) wrote:
[snip]
>> +        - echo 'Configure Buildroot'
>> +        - make ${CI_BUILD_NAME}
>> +        - echo 'Build buildroot'
>> +        - |
>> +            make > >(tee build.log |grep '>>>') 2>&1 || {
>> +                echo 'Failed build last output'
>> +                tail -200 build.log
>> +                exit 1
>> +            }
> 
> I wondered why you used process substitution here, instead of something
> like this (Which I find easier to understand, but that might just be me.):
> 
> make 2>&1 | tee build.log | grep '>>>' || {echo [...]}
> 
> But then we'd have to set -o pipefail, is that the reason for not using
> a pipeline, or am I missing something else?

 I didn't think about it too hard, I just copied it from Thomas Petazzoni's
Travis script [1]. But now you mention it, it's probably because of the pipefail.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
