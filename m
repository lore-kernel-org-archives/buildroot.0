From: Thomas Davis <sunsetbrew@sunsetbrew.com>
Date: Tue, 27 Aug 2013 10:56:21 -0400
Subject: [Buildroot] [1/1] civetweb: new package
In-Reply-To: <20130827162934.3f2a4333@skate>
References: <CAG3-AMr2_Aj+Xv0A13fWawcDTUToCnt72LWyzwTLVKK+4m+++w@mail.gmail.com>
 <CAAXf6LX52MBd8Lrp4eho=Vkdo=QVyZ4=aytMJu3dY6w0EwoJkA@mail.gmail.com>
 <20130827162934.3f2a4333@skate>
Message-ID: <CAG3-AMqbp49OstNw2KfC-cB3bmBUD_8=F2=Tbbae+tAiMiPGnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you so much for the quick review!

>What is the reason for this uclibc check?

I noticed that there were several alternatives for pthreads in uclibc and
the only one that not compatible is BR2_PTHREADS_NONE.  I was afraid of
additional variants may occur in the future and I am basically only
excluding the one option.  Further, if it is possible to exclude uclibc, it
would not be compatible either.  If you feel it is overkill I can simply it.

> Could you explain why you added this comment?
Civetweb is MIT and the MIT license does not prevent it from being included
in GPL code while the inverse is not true. If I put GPL code in Civetweb,
it compromises the MIT license and currently a copy of these files are in
the repository, at least until included with buildroot.  If dual licensing
the file is the best way, I can do that, or if preferred I can remove the
statement altogether.

> In general we use the format
> ifeq ($(BR2_FOO),y)

No problem, i can fix that

>  \ No newline at end of file

will fix that too

Please advise on the uclib check and the license header and I will submit a
new patch.

Thank you,
Thomas Davis
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130827/66790200/attachment-0001.html>
