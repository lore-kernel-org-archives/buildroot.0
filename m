From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 31 May 2017 13:42:14 +0200
Subject: [Buildroot] [PATCH 13/16] erlang-jiffy: New package
In-Reply-To: <20170531111936.79596357@free-electrons.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-14-johan.oudinet@gmail.com>
 <20170531000729.2059186b@free-electrons.com>
 <CAJtjsKa9mRtHaLjXcdbAi7w7_R=KNE3M_QSP-_SA=S=dGhqf1A@mail.gmail.com>
 <20170531111936.79596357@free-electrons.com>
Message-ID: <CAJtjsKZ2=uvqNLsVRzxi-4H+qz3TG5h7F696W22ONrLqO1bXww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 31, 2017 at 11:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> I guess something like:
>
> ERLANG_JIFFY_LICENSE = MIT (core), BSD-3-Clause (Google double conversion library), BSD-3-Clause (tests)

Ok, thanks.

>
>> That's an error. Thanks for spotting it. I'm not using the features
>> offered by this package in my ejabberd configuration, that's why I
>> haven't seen this bug.
>
> Wait. Does this means that Jiffy is not a mandatory dependency to build
> ejabberd? If that's the case, then ejabberd should not select it.
>

I did compile ejabberd without it. Christophe told me it is needed for
the REST APIs. It is possible to use ejabberd without them (that's
what I do) but if ejabberd crashes without it, I wouldn't call them
optional dependencies. Still, I like your idea in improving ejabberd
packaging in BR to be able to compile a minimal version of ejabberd
and select additional options if needed.
Christophe, what do you think?

-- 
Johan
