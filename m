From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 23 Jun 2010 13:53:05 +0000 (UTC)
Subject: [Buildroot] Suggestion for config menu help for path values
References: <hvr8t1$io0$1@dough.gmane.org> <20100623090429.539f3c0f@surf>
Message-ID: <hvt3k1$167$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-23, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>> Right now I'm trying to figure out the CWD when the post-build script
>> is called, and I'll submit a help patch when I figure out the answer.
>
> All Buildroot Makefiles are interpreted from the top Buildroot source
> directory, as we only use Makefile inclusion and not recursive make.
> So, in general, relative paths are interpreted relatively to the top
> Buildroot source directory.

I had initially assumed that scripts belonged in the "scripts"
directory.  That didn't work.  Then I tried the top of the source
directory.  That didn't work either.  I finally figured out that the
script path wasn't interpreted relative to a fixed point, but it was
left up to the shell to find using the normal PATH mechanism (so it
had to be ./filename rather than filename).

I'll submit a patch to the docs.

> Don't hesitate to point us those inconsistencies, and either submit a
> patch to fix them or ask us to do so :-)

I will.

-- 
Grant Edwards               grant.b.edwards        Yow! It's a lot of fun
                                  at               being alive ... I wonder if
                              gmail.com            my bed is made?!?
