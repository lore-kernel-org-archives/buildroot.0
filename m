From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 21:43:40 +0100
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: make
 it Python 3.x compatible
In-Reply-To: <20191203210038.348bd8bd@windsurf>
References: <20191203165457.1100390-1-thomas.petazzoni@bootlin.com>
 <20191203171137.7aqw4tjmx24fgnqm@sapphire.tkos.co.il>
 <20191203210038.348bd8bd@windsurf>
Message-ID: <4a12408c-4a2b-e312-e3f2-6f02f84ff6a0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 21:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 3 Dec 2019 19:11:37 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
>>>  - The urlparse module no longer exists, it's not urllib.parse  
>>
>> s/not/now/
> 
> Indeed.
> 
>>>  if sys.hexversion >= 0x3000000:
>>>      import configparser
>>>      import urllib.request as _urllib
>>> +    import urllib.parse as urlparse  
>>
>> Would that work with any Python 3.x?
> 
> https://docs.python.org/3/library/urllib.parse.html#module-urllib.parse
> has some comments in the documentation of urllib.parse.urlparse() that
> say:
> 
> """
> Changed in version 3.2: Added IPv6 URL parsing capabilities.
> """
> 
> So it means that urllib.parse.urlparse() was there at least before
> Python 3.2, which means it was most likely there since Python 3.x.

 And anyway, I think we generally should assume Python >= 3.4. Debian
oldoldstable (jessie) has 3.4 already. Trying to support older versions will
make our life unnecessarily difficult.

 Regards,
 Arnout
