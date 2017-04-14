From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Apr 2017 19:14:19 +0200
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
In-Reply-To: <58f00d5f9f9f2_1dd63f875a965624536da@ultri3.mail>
References: <58f00d5f9f9f2_1dd63f875a965624536da@ultri3.mail>
Message-ID: <ff7902df-d244-bbdd-507e-84bf6bc6f1f5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-04-17 01:44, Ricardo Martincoski wrote:
> Samuel, Maxime, Thomas, All,
> 
> First of all, I don't want to start a flame war.
> 
> I would like to know what you think about moving from A to D (or C or B) below.
> 
> A) keep using the implicit coding style for Python that we use now in Buildroot;

 Note about this coding style: it is absolutely not formal, and most likely not
followed consistently. It's a combination of the coding style that the various
contributors are used to, with some things inherited from non-Python Buildroot
coding style. I think the single line between functions falls in the latter
category.


> B) adopt a pre-existing Python coding style;
>    The advantages of using a pre-existing one are: documenting on the manual
>    takes a single sentence; for some coding styles there are automatic checkers
>    to help during development/review.
>    Of course there are coding style guides others than PEP8. But I don't know
>    much about them.
>    Do some of you use another coding style for Python? What are its advantages?
> 
> C) adopt the recommendation PEP8 [1] as coding style;
> 
> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>    automatic checker for coding style before submitting patches;
>    It checks for a subset of the recommendation (e.g. file naming is not
>    checked).

 For me, option D is great. It can also be added to the checkpackage script.


> What I am *NOT* proposing:
> - use Python for every script;
> - adapt all current Python scripts as the first step;
> - enforce, starting now, 0 warnings from pep8 [2] before merging a patch;
> - use an automatic formatter, like autopep8 [3];

 Nothing wrong with autopep8 - at least if it is used to generate patches, not
as a pre-commit hook of course.


 The first step is to add the one line to the manual, somewhere in the
Contributing section.

 Regards,
 Arnout

> 
> My *personal* reasoning for using PEP8 [1] and pep8 [2] (outside Buildroot) is:
> "Some people that wrote much more Python code than me already thought and
> discussed about this to came up with this recommendation"
> "I am lazy so I use the tool so I don't need to read the recommendation too
> often"
> 
> [1] https://www.python.org/dev/peps/pep-0008/
> [2] https://pypi.python.org/pypi/pep8
> [3] https://pypi.python.org/pypi/autopep8
> 
> Regards,
> Ricardo
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
