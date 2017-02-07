From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 21:49:30 +0100
Subject: [Buildroot] [PATCH v5 02/19] fakedate: new package
In-Reply-To: <1482241596-31688-3-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Tue, 20 Dec 2016 14:46:19 +0100")
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-3-git-send-email-jezz@sysmic.org>
Message-ID: <87fujprajp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > `date' is widely used by packages to include build information in their
 > binaries. Unfortunately, this is incompatible with  BR2_REPRODUCIBLE.

 > Instead of having to identify all `date' invocations in the different
 > packages, this commit adds a small tool that allows to always return
 > the same date.

 > This work was sponsored by `BA Robotic Systems'.

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---

 > Notes:
 >     v3:
 >       - Do not force $PATH. Find true `date' binary instead (Thomas)
 >       - Add explanations (Thomas)
 >       - Fix options detection (Arnout)
 >       - Rename INHIBIT in FORCE_EPOCH (Thomas)
 >       - Break after FORCE_EPOCH=0 (Arnout)
 >       - Add support for '--reference'
 >       - Add full copyright blurb (Arnout)

Would using something like libfaketime not be a more generic solution?

https://github.com/wolfcw/libfaketime

-- 
Bye, Peter Korsgaard
