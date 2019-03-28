From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2019 12:21:07 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <624e302a-22a4-4921-81a5-eef5a0ddf07f@andin.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-3-anaumann@ultratronik.de>
 <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
 <20190326081814.0109d351@windsurf>
 <42086765-6c53-b726-f09e-184209193b0d@mind.be>
 <2b455f83-78f6-432c-eb27-ceece04209c8@andin.de>
 <2d6cbad4-6270-6d2b-c4a6-863d78591e7c@mind.be>
 <624e302a-22a4-4921-81a5-eef5a0ddf07f@andin.de>
Message-ID: <a4eb8e2b-03f7-b69d-8192-248046cf6ca5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/03/2019 10:50, Andreas Naumann wrote:
>> IIUC your proposal would be:
>>
>> 1. Basic qmake infra 2. Convert all packages to qmake infra (trivial
>> because the difficult cases still use custom staging/target install
>> commands, you just don't remove them). 3. Add target install support
>> to qmake infra 4. Convert all easy packages to target install from
>> qmake infra (i.e. just remove the target install commands) 5-N.
>> Convert difficult packages.
>>
> 
> Actually I meant to not do step 2, but this should be doable as well.
> I'll see how it goes.

 Then splitting up the qmake infra in two steps doesn't help much either. And
we've anyway converged on the approach now, so there's no real need to split it
up. So the only thing to split up is the patch that updates the packages: one
big patch for the easy ones, and then more complicated patches for the
individual difficult ones.

 Regards,
 Arnout
