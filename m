From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2015 17:31:32 +0100
Subject: [Buildroot] [PATCH v2] cxxtest: new package
In-Reply-To: <567161CF.2060709@imgtec.com>
References: <1448546706-31297-1-git-send-email-Abhishek.Singh@imgtec.com>
 <20151214223655.GE4152@free.fr> <567161CF.2060709@imgtec.com>
Message-ID: <20151216163131.GA4309@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Abhishek, All,

On 2015-12-16 18:36 +0530, Abhishek Singh spake thusly:
> On Tuesday 15 December 2015 04:06 AM, Yann E. MORIN wrote:
> >On 2015-11-26 19:35 +0530, Abhishek Singh spake thusly:
[--SNIP--]
> >>+# CxxTest uses python infrastructure as the build system. cxxtestgen is
> >>+# a script which is used to process header files to generate C++ source files.
> >>+# Compiling test runner requires CxxTest header files which are installed in
> >>+# the staging directory.
> >OK, I think we need a bit more info about all tis, as I am not sure I
> >understand. Let me try to reformulate from what I understood:
> >
> >   - cxxtest is made of twoo parts:
> >     - a tool to parse header files (supposedly from a project)
> >     - a set of header files
> >
> >   - the tool is built as a host package, so it can be used natively
> >
> >   - the headers set is installed in staging
> >
> >Then the use-case is for a user to use the csstest tool to parse his own
> >headers, that will supposedly generate a test harness, which is then
> >cross-compiled and run on the target. Right?
> >
> >Could you expand a bit on the explanations, please?
> >
> >Regards,
> >Yann E. MORIN.
> 
> What you understood is correct. I am planning to add following comments
> in next patch. Please tell, does it explains what you expect?
> 
> "CxxTest uses python infrastructure as the build system. It consists
> of two parts:
> 
> 1. cxxtestgen tool to process tests defined in header files to generate
> C++ source files. cxxtestgen is built as a host package, so that it can
> be used natively.
> 
> 2. A set of header files which are installed in staging directory. This
> will be used to cross-compile test harness to generate executable which
> will run on target."

That's good for me. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
