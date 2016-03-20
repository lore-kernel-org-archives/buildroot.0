From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Mar 2016 17:33:42 +0100
Subject: [Buildroot] [PATCH 12/16 v5] core/legal-info: also save extra
 downloads
In-Reply-To: <20160319161407.5194685e@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <0e4f63ef1f47edce58214cd21d9e5f177731979f.1457718289.git.yann.morin.1998@free.fr>
 <20160319161407.5194685e@free-electrons.com>
Message-ID: <56EED0E6.10301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/16 16:14, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Fri, 11 Mar 2016 18:49:25 +0100, Yann E. MORIN wrote:
>> Some packages, like perl, download extra files that end up as part of
>> the source that Buildroot builds. Up until now, those files were not
>> saved in the legal-info output.
>>
>> Add those files to the legal-info output.
>>
>> The unfortunate side-effect is that we will also save the secondary
>> archive for the external blackfin toolchains; however, we already do
>> save the binary release of some external toolchains when they do not
>> provide actual source archives.
>>
>> This is inherently bad, as those are not source archives, but solving
>> this is a bigger concern, for another series...
>
> I see two possible ways around this:
>
>   - Have two separate variables, like <pkg>_EXTRA_SOURCE (to be used for
>     perl, contains real source code that needs to be saved during
>     legal-info), and <pkg>_EXTRA_DOWNLOADS (to be used for external
>     toolchains).

  I don't like this very much, because it adds infra for something that is used 
only once.


>
>   - Just like you don't copy <pkg>_SOURCE to legal-info when
>     <pkg>_ACTUAL_SOURCE is defined, don't copy <pkg>_EXTRA_DOWNLOADS
>     when <pkg>_ACTUAL_SOURCE is defined.

  This sounds like a good idea. However, I'm sure that at some point we'll run 
into a conflict (i.e. a package that has ACTUAL_SOURCE defined but also wants 
EXTRA DOWNLOADS of sources). To be solved when that happens, but we need a good 
commit message or comment that basically summarises this entire discussion so we 
know the implications when that happens.

  Regards,
  Arnout

>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
