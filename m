From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Feb 2016 23:31:23 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
 installed programs
In-Reply-To: <CAGkQfmPYv0oSwO-wuQWDvzt+kC9i=1wcymz6dV7jjP=i9dN7CA@mail.gmail.com>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
 <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
 <56CE1E61.7000008@zacarias.com.ar> <20160224214832.GA3449@free.fr>
 <87r3g1zs67.fsf@dell.be.48ers.dk> <20160224221930.GB3449@free.fr>
 <CAGkQfmPYv0oSwO-wuQWDvzt+kC9i=1wcymz6dV7jjP=i9dN7CA@mail.gmail.com>
Message-ID: <56CF80BB.7070907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 11:54, Romain Izard wrote:
> 2016-02-24 23:19 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
>> On 2016-02-24 22:58 +0100, Peter Korsgaard spake thusly:
>>
>>> Didn't we just discuss on IRC that shebangs didn't have any
>>> advantages over symlinks? If so, I would prefer to keep things simple
>>> and only have a choice between symlinks (default) or classical
>>> multiple binaries.
>>
>> Well, shebangs is the current situation, so users may rely on it (for
>> whatever ill reason), so we should support that.
>>
>> However, I won't battle over it, as my preference would go with
>> hardlinks instead, but that option is not available. Meh... ;-)
> 
> The issue is that the single binary mode is much more space-efficient
> than the classical mode. For my subset of 52 executables, it takes 704

 You really need half of the coreutils programs because they have some feature
that is not supported by busybox? Or are you trying to eliminate busybox entirely?

 If you know which extra features you need, perhaps you can just port them to
busybox? Upstream is really receptive to adding (sensible) features, as long as
they are hidden behind a config option.


 Note: unlike the others, and don't have a problem with this huge menu. But
since all the other core maintainers have voiced objections against it, I doubt
it will go in.

 Regards,
 Arnout

> KiB for the single-binary mode with shebangs, and 1.9 MiB with separate
> programs (after stripping). I get a similar ratio if I compress it.
> 
> The classical mode is in fact worse than taking the coreutils package
> without filtering, which takes 1.5 MiB.
> 
> Best regards,
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
