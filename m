From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Oct 2014 23:16:34 +0100
Subject: [Buildroot] [PATCH v6 0/2] Mono new package
In-Reply-To: <20141025105055.05c53953@free-electrons.com>
References: <1414009330-4433-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141025105055.05c53953@free-electrons.com>
Message-ID: <544EC442.5030804@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, Angelo,

Thomas Petazzoni wrote:
> Dear Angelo Compagnucci,
>
> On Wed, 22 Oct 2014 22:22:08 +0200, Angelo Compagnucci wrote:
>
>> Angelo Compagnucci (2):
>>    package/monolite: new package
>>    package/mono: new package
>
> Thanks, both patches applied. On the second patch, there was a missing
> dependency of host-mono on host-gettext (which you didn't see probably
> because you have gettext installed on your machine). I also did some
> improvements to the licensing description, even though some independent
> review of this (Yann, Luca ?) would be good.

I don't use Mono and it's a fairly large package. I just gave it a
quick look, and it looks like it has a _very_ complex licensing
scheme...

The file LICENSE is there to clarify the licensing. The need to have
such a file is itself quite enlightening on how arcane the thing is.
And around the middle of the file I got a headache and gave up.

According to their website [1], the tools are released under the GPL (no
version specified). But in the tools/ subdirectory there is no mention
of GPL, only a BSD license.

Overall, if it were me, and if I were forced to use Mono at all, I'd
state:
   MONO_LICENSE = A fuzzy mix of LGPL (any version), MIT/X11 and \
                  others, or commercial

BTW, Angelo, Thomas, where did you get licensing info when
writing/committing the package?

[1] http://www.mono-project.com/docs/faq/licensing/

-- 
Luca
