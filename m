From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 18 Apr 2012 17:39:09 +0200
Subject: [Buildroot] [RFC v2 16/31] linux: define license
In-Reply-To: <CAAXf6LU=wrhrN2cAV2WcOgvBxjXmXGDGfiKSf4Z1Y3jt_cox=Q@mail.gmail.com>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LX8JkXWzHAkYV8J74sYDhsFPRJ=OdYxiB4+6PxRswx3MA@mail.gmail.com>
 <4F8C8CE2.3000702@lucaceresoli.net>
 <201204162338.49807.yann.morin.1998@free.fr>
 <CAAXf6LU=wrhrN2cAV2WcOgvBxjXmXGDGfiKSf4Z1Y3jt_cox=Q@mail.gmail.com>
Message-ID: <4F8EE01D.3000406@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:

>>> I checked four packages in detail, and two of them have an unclear choice of
>>> GPL version. I can't stand any more headache tonight, and I'm not sure I'll
>>> have more luck with other packages. This is so frustrating...
>> Not sure? Use 'unknown'. This can be refined at a later stage, if need be.
>>
>> A package with no license specified in the $(PKG)_LICENSE should default
>> to 'unknown', to draw attention.
>>
>> IMNSHO, it is highly preferrable for the buildroot community to be
>> conservative on this point, and in case there is ambiguity, default to
>> 'unknown', and let a lawyer do his/her work. ;-)
> Ideally, we'd try to make sure that the upstream developers clarify
> their license so as to remove the ambiguity. I think it is of benefit
> to no-one that such ambiguities exist.
I agree with both of you. Getting things clarified from upstream is the best
thing. When this is impossible, a deep legal analysis is far out of the goals
of Buildroot.

Still, there are cases of packages whose licensing policy is clear but not
simple enough to fit into the narrow space of a csv file.
See the case of tslib: the library and a few examples are LGPL, other examples
are GPL.
In this case we might declare TSLIB_LICENSE = GPL + LGPL, but this is not
totally clear and not totally informative. So as Yann suggests it might be
better to give up and default to an "unknown" license.

Luca
