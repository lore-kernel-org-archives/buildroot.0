From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:28:24 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <CALe+oY9=XXOFUFgfiuCRUHsLLqUKdwbLfnVzA2Nu=kz60VoRwg@mail.gmail.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
 <20150818160332.GX2765@tarshish>
 <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
 <20150818172723.GY2765@tarshish>
 <CALe+oY9=XXOFUFgfiuCRUHsLLqUKdwbLfnVzA2Nu=kz60VoRwg@mail.gmail.com>
Message-ID: <55DB7E68.2040708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2015 10:14 PM, James Knight wrote:
> That being said, the change does not help my situation of having a
> target-complaint rpm build. I can't guarantee that my target rpm's
> berkeleydb matches my host rpm's berkeleydb. If I attempt to prepare
> the target system's rpm database with my host (stock Fedora), I will
> get a "DB_VERSION_MISMATCH" error. This makes me believe, to support a
> post-build generation of a target system's rpm database, host support
> for rpm is required. 

 I agree with that and I think this is a valid use case for adding a host rpm.
In this case, the host rpm should be added to Config.in.host.

 If someone thinks that this is not a valid use case, then I think we should
remove the rpm package altogether.


> With the change from rpm5 to rpm, the full list
> of dependent packages I'll have to provide host-support are now as
> follows: beecrypt, berkeleydb, libnss and neon. I can make another

 As far as I can see, the crypto libraries are optional. For the use case you
mention, I also don't see the need to support crypto in host-rpm. Berkeleydb is
mandatory but we can use the internal implementation (for host packages, that's
usually OK - and actually, the current rpm package seems to use the internal
implementation, which is wrong...). For neon, adding the host variant will be
needed. Try with the minimally-configured host-neon, though rpm may require some
of its options (e.g. WebDAV).


 Regards,
 Arnout

> attempt to push up host-support changes for these packages (along with
> rpm) with corrections on issues Thomas has indicated; unless anyone
> feels that this use case is too specific for Buildroot.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
