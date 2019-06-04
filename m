From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jun 2019 22:21:50 +0200
Subject: [Buildroot] [PATCH for-next 2/3] package/swig: enable PCRE
 regex matching in host-swig
In-Reply-To: <20190601092802.2b4102ac@windsurf>
References: <20190529151655.7098-1-romain.naour@gmail.com>
 <20190529151655.7098-2-romain.naour@gmail.com>
 <20190601092802.2b4102ac@windsurf>
Message-ID: <a28bad79-391c-87e7-4bf5-f94ba7dfc233@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/06/2019 09:28, Thomas Petazzoni wrote:
> Hello,
> 
> +Arnout, Yann, Peter in Cc.
> 
> On Wed, 29 May 2019 17:16:54 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> The upcoming ogre package needs a host swig binary with PCRE
>> regex support.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/swig/swig.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> I never really like the addition of mandatory host package dependencies
> just for the sake of one use case. I was considering adding a hidden
> BR2_PACKAGE_HOST_PCRE option for this, but since pcre takes only 17
> seconds to build, maybe it was not worth the effort. So I've applied to
> next as-is, but I'd be interested to know what Arnout/Peter/Yann thing
> about adding a hidden BR2_PACKAGE_HOST_PCRE hidden option for that kind
> of situation. We had decided to not systematically add such options in
> all host packages, but that we could add some in a case-by-case basis.
> This case-by-case basis however will look "weird": ogre would have
> host-swig in its <pkg>_DEPENDENCIES, but in Config.in would select
> BR2_PACKAGE_HOST_PCRE and not BR2_PACKAGE_HOST_SWIG. This could start
> getting a bit clunky.

 It could be

	select BR2_PACKAGE_HOST_PCRE # build swig with PCRE support

 Regards,
 Arnout
