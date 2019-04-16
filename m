From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 21:49:03 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <87tveye0yq.fsf@dell.be.48ers.dk>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
 <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
 <87tveye0yq.fsf@dell.be.48ers.dk>
Message-ID: <2f487d6e-97d6-497d-561d-d6c526e36fe8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2019 11:47, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 14/04/2019 22:17, Yann E. MORIN wrote:
>  >> Users are increasingly trying to extract information about packages. For
>  >> example, they might need to get the list of URIs, or the dependencies of
>  >> a package.
>  >> 
>  >> Although we do have a bunch of rules to generate some of that, this is
>  >> done in ad-hoc way, with most of the output formats just ad-hoc, raw,
>  >> unformatted blurbs, mostly internal data dumped as-is.
>  >> 
>  >> Introduce a new rule, show-info, that provides a properly formatted
>  >> output of all the meta-information about packages: name, type, version,
>  >> licenses, dependencies...
>  >> 
>  >> We choose to use JSON as the output format, because it is pretty
>  >> versatile, has parsers in virtually all languages, has tools to parse
>  >> from the shell (jq).
> 
>  >  Actually, OpenWrt has a couple of bash functions to convert JSON into bash
>  > variables. If we start making extensive use of show-info, it might be worth
>  > copying that.
> 
> That should be pretty trivial to do with jq, E.G. something like:
> 
> https://stackoverflow.com/questions/25378013/how-to-convert-a-json-object-to-key-value-format-in-jq

 Yes, but then jq needs to be installed. The point is to be able to use the
show-info output in our own shell scripts without requiring an additional
package to be installed.

 Regards,
 Arnout
