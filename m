From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 24 Aug 2015 17:08:05 -0400
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <55DB7E68.2040708@mind.be>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
 <20150818160332.GX2765@tarshish>
 <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
 <20150818172723.GY2765@tarshish>
 <CALe+oY9=XXOFUFgfiuCRUHsLLqUKdwbLfnVzA2Nu=kz60VoRwg@mail.gmail.com>
 <55DB7E68.2040708@mind.be>
Message-ID: <CALe+oY-nOMMoYdocgzkanLOLyTX-uaTm2EDXPeKFOLMifpaeag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Aug 24, 2015 at 4:28 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> As far as I can see, the crypto libraries are optional. For the use case you
> mention, I also don't see the need to support crypto in host-rpm.

When attempting to support rpm 4.12.0.1, I believe beecrypt is a
requirement (but I can look at that again tonight; unless you're just
talking about nss). Since you've mentioned that internal
implementations can be fine for host builds, there is a configuration
option to have an internal build of beecrypt which I can try to do
(instead of trying to do a host package for beecrypt).

> Berkeleydb is
> mandatory but we can use the internal implementation (for host packages, that's
> usually OK - and actually, the current rpm package seems to use the internal
> implementation, which is wrong...).

I saw the option to build with an internal db implementation, but I'm
a bit curious what the correct way to set it up (same with beecrypt,
as mentioned above). While I can set the configuration options to
build these internally, I have to somehow extract/link-up the
beecrypt/berkeleydb code with my host-rpm source (ie. I'll need a
'beecrypt' and 'db' folder inside my host-rpm extracted source). Is
there an example out there (I'm having trouble seeing if another host
package in Buildroot does this)? I really don't know how else to
download and prepare beecrypt/berkeleydb without making them
host-supported packages as well.
