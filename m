From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 30 Oct 2014 09:35:59 +0100
Subject: [Buildroot] [PATCH v6 0/2] Mono new package
In-Reply-To: <544F9D09.1010408@lucaceresoli.net>
References: <1414009330-4433-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141025105055.05c53953@free-electrons.com>
 <544EC442.5030804@lucaceresoli.net>
 <CA+TH9VngG20VsJqPQUkRT14u+w8_DB+U8f7pZWf3e9+nF7SR9A@mail.gmail.com>
 <544F9D09.1010408@lucaceresoli.net>
Message-ID: <CA+TH9VmYfuVnix_VLygeZ55v0nurCyRCuOGyfteba28s1f-9YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,


> So eglib, boehm and the garbage collector are part of the runtime,
> correct?

I've not this understanding of Mono internals, probably they are used
to compile mono runtime executable.

> Where is the Microsoft code used? In the runtime?

The most part is in the class: part of the libraries you can use in a
mono application are based on microsoft code. However this note is
probably outdated because it was that way at the beginning, now most
(if not all) libraries are written by the mono team or contributed
externally under an OSS license.

> Uh, where are these "tools" located?
> In the tools/ subdir I can't find any evidence of a GPL license:
>
>   $ git grep -i -C3 licens -- tools/ | grep -i general
>   $
>
> Maybe you refer to another subdir?

Most (if not all) files in tool doesn't have a license at all,
probably that note was added just to inform you that the tools are GPL
also if they haven't a GPL note on their files.

> That's correct if you ship a target, not if you ship an SDK (which is
> basically the stuff that is produced by Buildroot in output/host/).
> If you do, you have host-mono in the SDK and this pulls in GPL and other
> licenses.
>
> Is my understanding correct?

Unfortunately I'm not a lawyer, nor one of the mono core developer,
nor a xamarin employee, and I really don't want to express my personal
opinion, someone could read this email in future and misunderstanding
my point of view.

I think that redistributing something based on a certain number of
packages, with or without mono, should be object of a severe license
review if your company wants to be safe.

> But unfortunately, due to my poor knowledge of the Mono project, I can't
> build myself a strong opinion on what the correct MONO_LICENSE value
> should be. But maybe you can further improve the current value starting
> from my questions above (or clarify that the current value is ok).

I think that clearly stating all the license files distributed with
mono is the only correct way. Again, you should make a license review
of your code and what you distribute to be safe.
I don't think that buildroot is useful in any way more than saying you
where to look for license files.

Sicerely, Angelo.


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
