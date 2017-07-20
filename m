From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 16:16:24 +0200
Subject: [Buildroot] [PATCH v7 5/9] core: sanitize RPATH in host tree at
 the very end of the build
In-Reply-To: <20170720160632.37698930@windsurf>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-6-git-send-email-wg@grandegger.com>
 <4e228fa3-0126-6752-8a98-e17967b61fb3@mind.be>
 <20170720154404.7533bf28@windsurf>
 <2f8b3ab3-b2e6-d444-9981-bd07bfc250b8@mind.be>
 <20170720160632.37698930@windsurf>
Message-ID: <fead33c9-6f0a-b5bb-6410-afd42a424a3f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 16:06, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 20 Jul 2017 15:58:49 +0200, Arnout Vandecappelle wrote:
[snip]
>>> Basically, sdk needs to depend on "world".  
>>
>>  Not really, it doesn't need to depend on target-finalize or the rootfs targets.
> 
> Correct, but I am not sure it is really worth being smart here.

 Indeed it isn't. And having

sdk: world

will discourage anyone trying to add

world: sdk

:-)

[snip]
> So do we agree that:
> 
>  - target sanitization will be done in target-finalize
> 
>  - staging sanitization will be done in "make sdk"
> 
>  - host sanitization will be done in "make sdk"
> 
> Correct ?

 Yes! And also other sanitization (like stripping references to the build
directories) will be done in "make sdk".

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
