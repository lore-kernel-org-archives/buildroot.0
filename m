From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 09:36:02 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: add check-DEVELOPERS test
In-Reply-To: <20170630200237.1378f5dd@windsurf.home>
References: <20170630164253.19859-1-arnout@mind.be>
 <20170630200237.1378f5dd@windsurf.home>
Message-ID: <ce22c0a4-37b9-a065-aaac-8ee34801cf97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 20:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 30 Jun 2017 18:42:53 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> +check-DEVELOPERS:
>> +    script:
>> +        - PYTHONPATH=$PWD/support/scripts
>> +                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
>> +                grep . && exit 1
> 
> Isn't "./support/scripts/get-developer -c" doing the right thing?

 The problem with that is that it produces a lot of output, and the warnings are
at the top. So I would have to grep for WARNING. But some of the possible errors
don't have a WARNING in front of them. So I started out changing the script to
add WARNING for those as well. But then I thought: keep things simple, just call
parse_developers directly.

 Perhaps it would be a little more transparent to add a __main__ to
getdeveloperlib and then call it with "python support/scripts/getdeveloperlib.py".

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
