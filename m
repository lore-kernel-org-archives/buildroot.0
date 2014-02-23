From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 23 Feb 2014 19:15:41 +0100
Subject: [Buildroot] [PATCH] lua: needs dynamic library support (dlopen)
In-Reply-To: <d16bf125-1e0d-4c3a-a591-7cd43b3c7469@email.android.com>
References: <8a14c6297835e91f6691.1393175989@argentina>
 <20140223183830.2a7c25eb@skate>
 <d16bf125-1e0d-4c3a-a591-7cd43b3c7469@email.android.com>
Message-ID: <CAB0FRssLEc6ntNwO53oDL-+yNSnBkBnP=wr7VAS3ox2WZ+HsCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-23 18:49 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>>Dear Thomas De Schampheleire,
>>
>>On Sun, 23 Feb 2014 18:19:49 +0100, Thomas De Schampheleire wrote:
>>> Fixes
>>> http://autobuild.buildroot.net/results/e76/e765f992ad721a094579140c153ff71f20753265/
>>>
>>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>>
>>> ---
>>>  package/dnsmasq/Config.in     |  4 ++++
>>>  package/efl/libedje/Config.in |  5 +++--
>>>  package/haserl/Config.in      |  5 +++++
>>>  package/lighttpd/Config.in    |  4 ++++
>>>  package/lua/Config.in         |  4 ++++
>>>  5 files changed, 20 insertions(+), 2 deletions(-)
>>
>>No, that's not the correct fix. The correct fix is a variant of
>>http://patchwork.ozlabs.org/patch/313208/, which as suggested by Peter
>>should use BR2_PREFER_STATIC_LIB as a condition, and not
>>BR2_BINFMT_FLAT.
>
> Ok, understood.
> Francois, what are your plans with that patch?

http://patchwork.ozlabs.org/patch/313208/ is a V1 with BR2_BINFMT_FLAT.
I've already send a V2, see
http://patchwork.ozlabs.org/patch/314145/ --> lua: refactor install steps
http://patchwork.ozlabs.org/patch/314146/ --> lua: handles BR2_PREFER_STATIC_LIB

Note: V1 fixes only compilation issue, V2 handles compilation,
linking, and installation

Fran?ois

>
> Thanks,
> Thomas
>
>
