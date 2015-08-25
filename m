From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Aug 2015 10:34:10 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <CALe+oY-nOMMoYdocgzkanLOLyTX-uaTm2EDXPeKFOLMifpaeag@mail.gmail.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
 <20150818160332.GX2765@tarshish>
 <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
 <20150818172723.GY2765@tarshish>
 <CALe+oY9=XXOFUFgfiuCRUHsLLqUKdwbLfnVzA2Nu=kz60VoRwg@mail.gmail.com>
 <55DB7E68.2040708@mind.be>
 <CALe+oY-nOMMoYdocgzkanLOLyTX-uaTm2EDXPeKFOLMifpaeag@mail.gmail.com>
Message-ID: <55DC2882.4030804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/24/2015 11:08 PM, James Knight wrote:
[snip]
> I saw the option to build with an internal db implementation, but I'm
> a bit curious what the correct way to set it up (same with beecrypt,
> as mentioned above). While I can set the configuration options to
> build these internally, I have to somehow extract/link-up the
> beecrypt/berkeleydb code with my host-rpm source (ie. I'll need a
> 'beecrypt' and 'db' folder inside my host-rpm extracted source). 

 I haven't looked at rpm 4.12.0.1, but the rpm5 tarball we have now has the
berkeleydb sources bundled. It doesn't have beecrypt though (but according to
configure.ac it's optional).

 If rpm 4.12.0.1 doesn't have those sources bundled, then it's definitely better
to just add host-beecrypt and host-berkeleydb.

 Regards,
 Arnout

> Is
> there an example out there (I'm having trouble seeing if another host
> package in Buildroot does this)? I really don't know how else to
> download and prepare beecrypt/berkeleydb without making them
> host-supported packages as well.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
