From: Dan Lyke <danlyke@flutterby.com>
Date: Tue, 2 Dec 2008 11:34:32 -0800
Subject: [Buildroot] Compile error: makedevs.c - warnings treated as
 errors
In-Reply-To: <7631e7570812021117h254f7bd2r3145bdcca1611ccf@mail.gmail.com>
References: <7631e7570812021117h254f7bd2r3145bdcca1611ccf@mail.gmail.com>
Message-ID: <20081202113432.598b490a@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2 Dec 2008 12:17:05 -0700
"Joe George" <ccjoegml@gmail.com> wrote:
> cc1: warnings being treated as errors
> /media/swdev/buildroot/build_powerpc/makedevs/makedevs.c: In function
> 'main': /media/swdev/buildroot/build_powerpc/makedevs/makedevs.c:531:
> error: ignoring return value of 'system', declared with attribute
> warn_unused_result
> make: *** [/media/swdev/buildroot/build_powerpc/makedevs/makedevs]
> Error 1


I've just replaced that line in makedevs.c with

   int r = system(...);
   if (r) {}

Temporary gross workaround and all, but it let the compile continue.
