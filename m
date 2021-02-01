From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 12:00:14 +0100
Subject: [Buildroot] Question About the Rational Limitations on
 Buildroot as a Tool
In-Reply-To: <d116a0687c2af6f6356332e7854f053a@librehash.com> (buck winston
 via buildroot's message of "Sun, 31 Jan 2021 11:58:13 -0500")
References: <d116a0687c2af6f6356332e7854f053a@librehash.com>
Message-ID: <87im7cnjcx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "buck" == buck winston via buildroot <buildroot@busybox.net> writes:

Hi,

 > First, I want to start this e-mail off by giving a huge thanks to those
 > that created and maintain(ed) this tool. Folks like yourselves are what
 > enable people like me to convince even less experienced people that
 > they're anywhere close to the genius that you all actually are. I know
 > you all may not see your contributions as particularly 'noble', but I do
 > - and before I ask anything (take) from you all, I want to at least give
 > you all your just due for a job well do. 

 > I know there's a chance that this question was asked before - _but I
 > legitimately looked for the answer to it online and in other resources
 > and did not find a satisfactory one. _ 

 > If there is an answer roaming out there somewhere, I'm just an idiot and
 > I missed it - please forgive me. 

 > Question About Limitations of 'Buildroot' 

 > I stumbled across buildroot through Fabrice Bellard's tool (JSLinux).
 > Being fascinated with 'JSLinux' (client-side terminal that executes in
 > javascript in one's browser), I wanted to know more about how to build
 > this for myself (and eventually host my own version that expends
 > slightly more resources since I have a smaller audience). 

 > Long story, short - after downloading the modules from his site, I got
 > into the buildroot tool and started going through the wealth of options
 > provided in the ncurses interface for the creation of this kernel / root
 > and I started to get really curious about how viable this can be as a
 > legitimate system ran on commercial laptops - let's say a device with
 > 16GB RAM, modern chip processor (nothing crazy), good graphics card, and
 > other modern specs (2019 or later). 

 > All over the site, I've read that this is a great way to build an OS for
 > 'embedded devices', which I understand to be tools like routers perhaps,
 > Raspberry Pi's, Arduinos etc. 

 > Cool. But given the wealth of features, libraries, kernel packages,
 > audio packages, etc., that are available for compilation in the TUI, it
 > appeared to me like one could make a very legitimate customized OS with
 > this 'buildroot' tool. 

 > To be clear, I'm sure that there are others that have asked this
 > question before but I either cannot find them or the few that I have
 > found that have asked this question received some fairly inadequate
 > answers. So I wanted to come straight to the source. 

 > _To be more specific in my questions: _ 

 > 1. Why is 'buildroot' pivoted toward creating kernels / OSes geared for
 > embedded devices (almost exclusively, it seems)? I'm not saying that
 > this is a flaw or an oversight at all. On the contrary, I'm assuming
 > that there is an obviously sound reason for doing this that I simply
 > cannot find and was hoping to understand more about the nature of this
 > project through the answer that I receive to this question. 

 > and 

 > 2. From what I saw, it seems that one can build a pretty damn robust OS
 > with this tool (not including all of the bells & whistles that are just
 > aesthetic dloads or creature comforts). I saw it allows for the
 > inclusion of the latest kernel version by Linux, relevant graphics
 > libraries, libraries for building, X11 related downloads, Interpreter
 > languages and scripting, networking applications, security tools,
 > various filesystems, available shells, the support of other concurrently
 > running applications as well (the computer that I'm using has decent
 > specs). 

 > Would it be naive to believe that perhaps when buildroot started out, it
 > did not have the capability but now, in the project's maturity, the tool
 > is so full featured that it can essentially serve as a pathway for one
 > creating their own custom OS? Obviously not something as extensive as
 > Debian / Ubuntu / PCLinux etc., but maybe an Arch Linux? (putting aside
 > their considerable expertise and mastery) 

 > And, if not, what is there that this project is lacking that it would
 > need before it could sufficiently serve that role? 

 > Thank you in advance for taking the time to field my query, 

Yes, you _COULD_ conceptually build such a system with Buildroot, but I
would not recommend it as Buildroot:

- Requires you to configure all parts of the system up front (and
  understand what parts you need), and any configuration changes
  requires a full rebuild. There is no package manager or prebuilt
  packages available

- Only provides a limited selection of "desktop-style" packages

Buildroot is optimized for creating a fixed function build, and has a
number of features to ensure that this can happen in an optimized
way, independently of if this fixed function build needs to run on a x86
machine or some other architecture.

A general purpose / open "PC" desktop solution is quite different from
that.

-- 
Bye, Peter Korsgaard
