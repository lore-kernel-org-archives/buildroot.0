From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Jan 2021 22:25:53 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: properly handle
 host packages with -c option
In-Reply-To: <20210108213737.GP1485369@scaer>
References: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
 <20210107211336.3030397-2-thomas.petazzoni@bootlin.com>
 <20210107213207.GO1485369@scaer> <20210107223447.4a2b8674@windsurf.home>
 <20210108213737.GP1485369@scaer>
Message-ID: <6e5e0a9b-9df1-bbba-1252-00241354a70e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/01/2021 22:37, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-01-07 22:34 +0100, Thomas Petazzoni spake thusly:
>> On Thu, 7 Jan 2021 22:32:07 +0100
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>>
>>> I think the correct fix would be for the json output to already contain
>>> the base name of the package, and the script to use that field, rather
>>> than the key, as a package name. That way, the behaviour would be the
>>> same for both target and host packages.
>>
>> Right, that could certainly work as well.
>>
>>>
>>> Something like:
>>>
>>>     diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>>>     index a2cc160d0b..0f9d612f12 100644
>>>     --- a/package/pkg-utils.mk
>>>     +++ b/package/pkg-utils.mk
>>>     @@ -91,6 +91,7 @@ endef
>>>      # $(1): upper-case package or filesystem name
>>>      define json-info
>>>      	"$($(1)_NAME)": {
>>>     +		"name": "$($(1)_RAWNAME)",
>>
>> "name" or "rawname" ?
> 
> "rawname" is a detail of the naming of our internal variables. WE do not
> want to propagate that to the outside world.
> 
> "name" is really that: the name of the package, by which people know it
> and talk about. 

 +1

 Regards,
 Arnout
