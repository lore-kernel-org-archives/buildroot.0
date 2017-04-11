From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Apr 2017 11:23:10 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <60a71a19-b86a-e9cd-5e0d-ab51388a18de@mind.be>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <60a71a19-b86a-e9cd-5e0d-ab51388a18de@mind.be>
Message-ID: <f65e842e-6adf-1cf1-d91c-06cfa465c2fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-04-17 12:31, Arnout Vandecappelle wrote:
> 
> 
> On 02-04-17 15:03, Yann E. MORIN wrote:
>> When debugging hidden dependencies, the build order is very important.
>> Most notably, it is interesting to identify potential culprits.
>>
>> Add a new top-level rule, show-biuld-order, that dumps all the packages
>                                  build
>> in the order they would get built.
>>
>> Note that there are a few differences with show-targets:
>>
>>   - more packages are reported, becasue show-targets does not report
>                                   because
>>     host packages that have no prompt;
>>
>>   - the output is line-based, because we're using $(info $(1)); getting
>>     a single output line like show-targets would require we use an
>>     actual command, like printf '%s ' $(1); but that takes a lot of
>>     time, while $(info $(1)) is almost instantaneous (the time to parse
>>     the Makefiles);
>>
>>   - rootfs targets are not reported.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I've now actually started using this patch and it has a real benefit over
show-targets, because it shows all targets, not just the ones appearing in
.config. Ideal if you need to find all host packages...

 Perhaps now show-targets can be eliminated? It is not documented, it's only
used in graph-depends, and AFAICS from there it can easily be converted into
show-build-order. Well, for that -show-build-order should be added to
fs/common.mk but that's not rocket science :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
