From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Mar 2019 09:46:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/libfuse3: new package
In-Reply-To: <CADYdroPJ7ahD1JH8ULH7fdPi-TejcWr8FAFJ++4Q_BUj1a7Lyw@mail.gmail.com>
References: <20190306163054.5918-1-norbert.lange@andritz.com>
 <bfd874ad-06a2-9cf6-7783-d66979a953e0@mind.be>
 <CADYdroPJ7ahD1JH8ULH7fdPi-TejcWr8FAFJ++4Q_BUj1a7Lyw@mail.gmail.com>
Message-ID: <f1a7be8e-28f9-11e5-0a2a-2327a22f34cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/03/2019 20:32, Norbert Lange wrote:
>>  Is there any reason not to use the normal install for target as well?
> Yes, I would have to `rm` all unused files. This was not welcome some time ago,

 TBH, we haven't decided (yet) if the best approach in general is to use
standard install and then rm, or to use custom install commands. *Most*
developers prefer to use the install + rm approach.

 I'm surprised, though, that there would be anything to remove. Remember that
anything in /usr/include, all man pages an all .a files in {/usr,}/lib are
automatically removed. It is rare that something else gets installed *and* that
it is not in fact needed on target.

 Regards,
 Arnout
